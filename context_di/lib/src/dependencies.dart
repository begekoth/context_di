import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'registrations.dart';

abstract class FeatureDependencies extends StatelessWidget {
  const FeatureDependencies({super.key, this.builder});
  final Widget Function(BuildContext context)? builder;

  List<Registration> register();

  Registration registerFactory<T>(T Function(BuildContext context) create) {
    return FactoryRegistration<T>(create);
  }

  Registration registerParamsFactory<T, P>(
      T Function(BuildContext context, P params) create) {
    return ParamsFactoryRegistration<T, P>(create);
  }

  Registration registerSingleton<T>(T Function(BuildContext context) create,
      {void Function(BuildContext, T)? dispose}) {
    return SingletonRegistration<T>(create, dispose: dispose);
  }

  Registration registerSingletonAs<I extends T, T>(
      T Function(BuildContext context) create,
      {void Function(BuildContext, I)? dispose}) {
    return SingletonAsRegistration<I, T>(create, dispose: dispose);
  }

  @override
  Widget build(BuildContext context) {
    final registrations = register();
    final builder = this.builder;

    return MultiProvider(providers: [
      ...registrations.map((e) => e.provider),
    ], builder: builder != null ? (context, _) => builder(context) : null);
  }
}

extension FeatureContextExtension<F extends FeatureDependencies>
    on BuildContext {
  T resolve<T>() {
    try {
      final factory = Provider.of<FactoryRegistration<T>?>(this, listen: false);

      if (factory != null) {
        return factory.create(this);
      }

      final singleton = Provider.of<T>(this, listen: false);

      return singleton;
    } on ProviderNotFoundException {
      throw Exception("Class $T probably not registered");
    }
  }

  T resolveWithParams<T, P>(P params) {
    try {
      final factory =
          Provider.of<ParamsFactoryRegistration<T, P>>(this, listen: false);

      return factory.create(this, params);
    } on ProviderNotFoundException {
      throw Exception("Class $T probably not registered");
    }
  }
}
