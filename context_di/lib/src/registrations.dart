import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../utils.dart';

sealed class Registration {
  const Registration();

  Provider<dynamic> get provider;
}

class SingletonRegistration<T> extends Registration {
  final T Function(BuildContext context) _create;

  final bool lazy;
  final void Function(BuildContext, T)? dispose;

  @override
  Provider<T> get provider {
    return Provider(create: _create, lazy: lazy, dispose: dispose);
  }

  SingletonRegistration(this._create, {this.lazy = true, this.dispose});
}

class SingletonAsRegistration<I extends T, T> extends Registration {
  final T Function(BuildContext context) _create;

  final bool lazy;
  final void Function(BuildContext, I)? dispose;

  @override
  Provider<T> get provider {
    return Provider(
      create: _create,
      lazy: lazy,
      dispose: (c, instance) => dispose?.call(c, instance as I),
    );
  }

  SingletonAsRegistration(this._create, {this.lazy = true, this.dispose});
}

class FactoryRegistration<T> extends Registration {
  final Factory<T> factory;

  @override
  Provider<Factory<T>> get provider => Provider(create: (_) => factory);

  FactoryRegistration(this.factory);
}

class ParamsFactoryRegistration<T, P> extends Registration {
  final ParamsFactory<T, P> factory;

  @override
  Provider<ParamsFactory<T, P>> get provider =>
      Provider(create: (_) => factory);

  ParamsFactoryRegistration(this.factory);
}
