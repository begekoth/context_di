/// Annotation to mark a class as a feature
class Feature {
  final bool generateFactoryTypes;

  const Feature({this.generateFactoryTypes = true});
}

/// Annotation to register a singleton dependency
class Singleton {
  final Type type;
  final Type? as;
  final Function? dispose;

  const Singleton(this.type, {this.as, this.dispose});
}

/// Annotation to register a factory dependency
class Factory {
  final Type type;
  final Type? params;

  const Factory(this.type, {this.params});
}
