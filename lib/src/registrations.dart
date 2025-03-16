import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

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
  final T Function(BuildContext context) create;

  @override
  Provider<FactoryRegistration<T>> get provider => Provider(create: (_) => this);

  FactoryRegistration(this.create);
}

class ParamsFactoryRegistration<T, P> extends Registration {
  final T Function(BuildContext context, P params) create;

  @override
  Provider<ParamsFactoryRegistration<T, P>> get provider => Provider(create: (_) => this);

  ParamsFactoryRegistration(this.create);
}