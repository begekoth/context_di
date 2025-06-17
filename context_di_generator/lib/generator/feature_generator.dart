import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/element2.dart';
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
    final topLevelFactories = StringBuffer();

    if (annotation.read('generateFactoryTypes').boolValue) {
      for (final annotation in element.metadata) {
        final type = annotation.element2?.enclosingElement2?.displayName;

        if (type == 'Factory') {
          final reader = ConstantReader(annotation.computeConstantValue());
          final typeValue = reader.read('type').typeValue.getDisplayString();
          final typeElement = reader.read('type').typeValue.element3 as ClassElement2;
          final paramsType = reader.peek('params')?.typeValue;
          final paramsTypeValue = paramsType?.getDisplayString();

          if (paramsTypeValue != null) {
            buffer.writeln("typedef Create${typeValue} = ${typeValue} Function(BuildContext, ${paramsTypeValue});\n");
            topLevelFactories.writeln("${typeValue} create${typeValue}(BuildContext context, ${paramsTypeValue} params) => ${typeValue}(");
            topLevelFactories.writeln("  ${_generateConstructorParams(typeElement, typeValue, paramsType)},");
            topLevelFactories.writeln(");\n");
          } else {
            buffer.writeln("typedef Create$typeValue = $typeValue Function(BuildContext);\n");
            if (typeElement.constructors2.first.formalParameters.isEmpty) {
              topLevelFactories.writeln("$typeValue create$typeValue(BuildContext context) => $typeValue();\n");
            } else {
              topLevelFactories.writeln("$typeValue create$typeValue(BuildContext context) => $typeValue(");
              topLevelFactories.writeln("  ${_generateConstructorParams(typeElement, typeValue)},");
              topLevelFactories.writeln(");\n");
            }
          }
        }
      }
    }

    buffer.writeln('mixin _\$${element.name}Mixin on FeatureDependencies {');
    buffer.writeln('  @override');
    buffer.writeln('  List<Registration> register() {');
    buffer.writeln('    return [');

    for (final annotation in element.metadata) {
      final reader = ConstantReader(annotation.computeConstantValue());
      final type = annotation.element2?.enclosingElement2?.displayName;
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
    buffer.writeln(topLevelFactories.toString());

    return buffer.toString();
  }

  void _generateSingletonRegistration(StringBuffer buffer, ConstantReader reader) {
    final typeValue = reader.read('type').typeValue.getDisplayString();
    final asValue = reader.peek('as')?.typeValue.getDisplayString();
    final dispose = reader.peek('dispose')?.objectValue.toFunctionValue2()?.displayName;
    final typeElement = reader.read('type').typeValue.element3 as ClassElement2;

    if (asValue != null) {
      buffer.writeln('      registerSingletonAs<$typeValue, $asValue>(');
    } else {
      buffer.writeln('      registerSingleton(');
    }

    if (typeElement.constructors2.first.formalParameters.isEmpty) {
      buffer.writeln('        (context) => $typeValue(),');
    } else {
      buffer.writeln('        (context) => $typeValue(');
      buffer.writeln('          ${_generateConstructorParams(typeElement, typeValue)},');
      buffer.writeln('        ),');
    }

    if (dispose != null) {
      buffer.writeln('        dispose: $dispose,');
    }
    buffer.writeln('      ),');
  }

  void _generateFactoryRegistration(StringBuffer buffer, ConstantReader reader) {
    final typeValue = reader.read('type').typeValue.getDisplayString();
    final paramsTypeValue = reader.peek('params')?.typeValue;
    final typeElement = reader.read('type').typeValue.element3 as ClassElement2;

    if (paramsTypeValue != null) {
      buffer.writeln('      registerParamsFactory(');
      buffer.writeln('        (context, $paramsTypeValue params) => $typeValue(');
      buffer.writeln('          ${_generateConstructorParams(typeElement, typeValue, paramsTypeValue)},');
      buffer.writeln('        ),');
      buffer.writeln('      ),');
      return;
    }

    buffer.writeln('      registerFactory(');

    if (typeElement.constructors2.first.formalParameters.isEmpty) {
      buffer.writeln('        (context) => $typeValue(),');
    } else {
      buffer.writeln('        (context) => $typeValue(');
      buffer.writeln('          ${_generateConstructorParams(typeElement, typeValue)},');
      buffer.writeln('        ),');
    }

    buffer.writeln('      ),');
  }

  String _generateConstructorParams(ClassElement2 element, String typeValue, [DartType? paramsTypeValue]) {
    final constructorName = typeValue.split('.').last;
    final constructor = element.constructors2
            .where(
              (c) => c.displayName == constructorName,
            )
            .firstOrNull ??
        element.constructors2.first;

    final paramsFields = paramsTypeValue?.extractParamsFields();

    String ifNamed(FormalParameterElement param, String value) {
      return param.isNamed ? '${param.displayName}: $value' : value;
    }

    final params = constructor.formalParameters.map((param) {
      if (param.type.element3?.displayName == 'BuildContext') return ifNamed(param, 'context');

      if (paramsFields != null) {
        final paramName = param.displayName;
        final publicName = paramName.startsWith('_') ? paramName.substring(1) : paramName;
        if (paramsFields.contains(publicName)) {
          paramsFields.remove(publicName);
          return ifNamed(param, 'params.$publicName');
        }
      }
      return ifNamed(param, 'context.resolve()');
    }).join(',\n          ');

    if (paramsFields != null && paramsFields.isNotEmpty) {
      throw Exception('Not found parameters: ${paramsFields.join(', ')} in constructor: \$constructor');
    }

    return params;
  }
}

extension _ExtractParamsFields on DartType {
  Set<String> extractParamsFields() => switch (this) {
        RecordType(:final namedFields) => namedFields.map((e) => e.name).toSet(),
        InterfaceType(:final element3) when element3 is ClassElement2 => element3.fields2.map((e) => e.displayName).toSet(),
        _ => throw Exception('Unsupported params type \$this can be a class or record type, not: \${this.element}')
      };
}
