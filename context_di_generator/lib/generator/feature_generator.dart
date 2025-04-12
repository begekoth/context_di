import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
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

    if (annotation.read('generateFactoryTypes').boolValue) {
      for (final annotation in element.metadata) {
        final type = annotation.element?.enclosingElement3?.displayName;

        if (type == 'Factory') {
          final reader = ConstantReader(annotation.computeConstantValue());
          final typeValue = reader.read('type').typeValue.getDisplayString();
          final paramsTypeValue =
              reader.peek('params')?.typeValue.getDisplayString();

          if (paramsTypeValue != null) {
            buffer.writeln(
                "typedef Create${typeValue} = ${typeValue} Function(BuildContext, ${paramsTypeValue});\n");
            continue;
          }

          buffer.writeln(
              "typedef Create$typeValue = $typeValue Function(BuildContext);\n");
        }
      }
    }

    buffer.writeln('mixin _\$${element.name}Mixin on FeatureDependencies {');
    buffer.writeln('  @override');
    buffer.writeln('  List<Registration> register() {');
    buffer.writeln('    return [');

    for (final annotation in element.metadata) {
      final reader = ConstantReader(annotation.computeConstantValue());
      final type = annotation.element?.enclosingElement3?.displayName;
      if (type == null) continue;

      switch (type) {
        case 'Singleton':
          _generateSingletonRegistration(buffer, reader);
          break;
        case 'Factory':
          _generateFactoryRegistration(buffer, reader);
          break;
      }
    }

    buffer.writeln('    ];');
    buffer.writeln('  }');
    buffer.writeln('}');
    buffer.writeln('');

    return buffer.toString();
  }

  void _generateSingletonRegistration(
      StringBuffer buffer, ConstantReader reader) {
    final typeValue = reader.read('type').typeValue.getDisplayString();
    final asValue = reader.peek('as')?.typeValue.getDisplayString();
    final dispose =
        reader.peek('dispose')?.objectValue.toFunctionValue()?.displayName;
    final typeElement = reader.read('type').typeValue.element as ClassElement;

    if (asValue != null) {
      buffer.writeln('      registerSingletonAs<$typeValue, $asValue>(');
    } else {
      buffer.writeln('      registerSingleton(');
    }

    if (typeElement.constructors.first.parameters.isEmpty) {
      buffer.writeln('        (context) => $typeValue(),');
    } else {
      buffer.writeln('        (context) => $typeValue(');
      buffer.writeln(
          '          ${_generateConstructorParams(typeElement, typeValue)},');
      buffer.writeln('        ),');
    }

    if (dispose != null) {
      buffer.writeln('        dispose: $dispose,');
    }
    buffer.writeln('      ),');
  }

  void _generateFactoryRegistration(
      StringBuffer buffer, ConstantReader reader) {
    final typeValue = reader.read('type').typeValue.getDisplayString();
    final paramsTypeValue = reader.peek('params')?.typeValue;
    final typeElement = reader.read('type').typeValue.element as ClassElement;

    if (paramsTypeValue != null) {
      buffer.writeln('      registerParamsFactory(');
      buffer
          .writeln('        (context, $paramsTypeValue params) => $typeValue(');
      buffer.writeln(
          '          ${_generateConstructorParams(typeElement, typeValue, paramsTypeValue)},');
      buffer.writeln('        ),');
      buffer.writeln('      ),');
      return;
    }

    buffer.writeln('      registerFactory(');

    if (typeElement.constructors.first.parameters.isEmpty) {
      buffer.writeln('        (context) => $typeValue(),');
    } else {
      buffer.writeln('        (context) => $typeValue(');
      buffer.writeln(
          '          ${_generateConstructorParams(typeElement, typeValue)},');
      buffer.writeln('        ),');
    }

    buffer.writeln('      ),');
  }

  String _generateConstructorParams(ClassElement element, String typeValue,
      [DartType? paramsTypeValue]) {
    final constructorName = typeValue.split('.').last;
    final constructor = element.constructors
            .where(
              (c) => c.name == constructorName,
            )
            .firstOrNull ??
        element.constructors.first;

    final paramsFields = paramsTypeValue?.extractParamsFields();

    String ifNamed(ParameterElement param, String value) {
      return param.isNamed ? '${param.name}: $value' : value;
    }

    final params = constructor.parameters.map((param) {
      if (param.type.element3?.name == 'BuildContext')
        return ifNamed(param, 'context');

      if (paramsFields != null) {
        final paramName = param.name;
        final publicName =
            paramName.startsWith('_') ? paramName.substring(1) : paramName;
        if (paramsFields.contains(publicName)) {
          paramsFields.remove(publicName);
          return ifNamed(param, 'params.$publicName');
        }
      }
      return ifNamed(param, 'context.resolve()');
    }).join(',\n          ');

    if (paramsFields != null && paramsFields.isNotEmpty) {
      throw Exception(
          'Not found parameters: ${paramsFields.join(', ')} in constructor: $constructor');
    }

    return params;
  }
}

extension _ExtractParamsFields on DartType {
  Set<String> extractParamsFields() => switch (this) {
        RecordType(:final namedFields) =>
          namedFields.map((e) => e.name).toSet(),
        InterfaceType(:final element) when element is ClassElement =>
          element.fields.map((e) => e.name).toSet(),
        _ => throw Exception(
            'Unsupported params type $this can be a class or record type, not: ${this.element}')
      };
}
