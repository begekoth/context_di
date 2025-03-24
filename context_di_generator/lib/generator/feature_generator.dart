import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:context_di/annotations.dart';
import 'package:source_gen/source_gen.dart';

class FeatureGenerator extends GeneratorForAnnotation<Feature> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        'Feature annotation can only be applied to classes.',
      );
    }

    final buffer = StringBuffer();

    // Add imports
    buffer.writeln('// GENERATED CODE - DO NOT MODIFY BY HAND');
    buffer.writeln();
    buffer.writeln('part of \'${element.source.shortName}\';');
    buffer.writeln();

    buffer.writeln(
        'mixin _\$${element.name}FeatureMixin on FeatureDependencies {');
    buffer.writeln('  @override');
    buffer.writeln('  List<Registration> register() {');
    buffer.writeln('    return [');

    for (final annotation in element.metadata) {
      final reader = ConstantReader(annotation.computeConstantValue());
      final type = annotation.element?.enclosingElement3?.displayName;
      if (type == null) continue;

      switch (type) {
        case 'Singleton':
          final typeValue = reader.read('type').typeValue.getDisplayString();
          final asValue = reader.peek('as')?.typeValue.getDisplayString();
          final dispose = reader
              .peek('dispose')
              ?.objectValue
              .toFunctionValue()
              ?.displayName;
          final typeElement =
              reader.read('type').typeValue.element as ClassElement;

          if (asValue != null) {
            buffer.writeln('      registerSingletonAs<$typeValue, $asValue>(');
            buffer.writeln('        (context) => $typeValue(');
            buffer.writeln(
                '          ${_generateConstructorParams(typeElement, typeValue)},');
            buffer.writeln('        ),');
            if (dispose != null) {
              buffer.writeln('        dispose: $dispose,');
            }
            buffer.writeln('      ),');
          } else {
            buffer.writeln('      registerSingleton(');
            buffer.writeln('        (context) => $typeValue(');
            buffer.writeln(
                '          ${_generateConstructorParams(typeElement, typeValue)},');
            buffer.writeln('        ),');
            if (dispose != null) {
              buffer.writeln('        dispose: $dispose,');
            }
            buffer.writeln('      ),');
          }
        case 'Factory':
          final typeValue = reader.read('type').typeValue.getDisplayString();
          final paramsTypeValue =
              reader.peek('params')?.typeValue.getDisplayString();
          final typeElement =
              reader.read('type').typeValue.element as ClassElement;
          if (paramsTypeValue == null) {
            buffer.writeln('      registerFactory(');
            buffer.writeln('        (context) => $typeValue(');
            buffer.writeln(
                '          ${_generateConstructorParams(typeElement, typeValue)},');
            buffer.writeln('        ),');
            buffer.writeln('      ),');
            break;
          }

          buffer.writeln('      registerParamsFactory(');
          buffer.writeln(
              '        (context, $paramsTypeValue params) => $typeValue(');
          buffer.writeln(
              '          ${_generateConstructorParams(typeElement, typeValue, paramsTypeValue)},');
          buffer.writeln('        ),');
          buffer.writeln('      ),');
      }
    }

    buffer.writeln('    ];');
    buffer.writeln('  }');
    buffer.writeln('}');
    buffer.writeln('');

    return buffer.toString();
  }

  String _generateConstructorParams(ClassElement element, String typeValue,
      [String? paramsTypeValue]) {
    final constructorName = typeValue.split('.').last;
    final constructor = element.constructors
            .where(
              (c) => c.name == constructorName,
            )
            .firstOrNull ??
        element.constructors.first;

    // Extract field names from params type if it exists
    final paramsFields = <String>{};
    if (paramsTypeValue != null) {
      // Handle record types
      if (paramsTypeValue.startsWith('({') && paramsTypeValue.endsWith('})')) {
        // Extract field names from record type
        // Format is ({type1 name1, type2 name2})
        final fieldsStr =
            paramsTypeValue.substring(2, paramsTypeValue.length - 2);
        final fields = fieldsStr.split(',').map((f) => f.trim());
        paramsFields.addAll(
          fields.map((f) => f.split(' ').last),
        );
      } else {
        // Handle class types
        final paramsTypeName = paramsTypeValue.split('.').last;
        final paramsTypeElement = element.library.topLevelElements
            .whereType<ClassElement>()
            .firstWhere(
              (e) => e.name == paramsTypeName,
              orElse: () => throw InvalidGenerationSourceError(
                'Params type $paramsTypeValue not found',
              ),
            );

        paramsFields.addAll(
          paramsTypeElement.fields
              .where((f) => !f.isStatic && !f.isPrivate)
              .map((f) => f.name),
        );
      }
    }

    String ifNamed(ParameterElement param, String value) {
      if (param.isNamed) {
        return '${param.name}: $value';
      }
      return value;
    }

    return constructor.parameters.map((param) {
      if (paramsTypeValue != null) {
        final paramName = param.name;
        // Remove leading underscore for private fields
        final publicName =
            paramName.startsWith('_') ? paramName.substring(1) : paramName;
        // Only map parameters that are in the params type
        if (paramsFields.contains(publicName)) {
          return ifNamed(param, 'params.$publicName');
        }
      }
      return ifNamed(param, 'context.resolve()');
    }).join(',\n          ');
  }
}
