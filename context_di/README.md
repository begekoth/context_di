<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->
[![pub package](https://img.shields.io/pub/v/context_di.svg)](https://pub.dev/packages/context_di)

Project is based on [Provider](https://pub.dev/packages/provider) package.
Main goal is to create a tool that will help reduce boilerplate code and
make it easier to work with dependency injection via Provider.

## Features
2 scopes are supported:
- factory scope (creates instance every time)
- singleton scope (one instance per feature)

Parameterized factories
```dart
final bloc = context.read<CreateEntityBloc>()(context, (id: _id));
```

Scopes based on widget tree lifecycle:
![dispose.gif](dispose.gif)

## Added Code Generation

add [build_runner](https://pub.dev/packages/build_runner) and [context_di_generator](https://pub.dev/packages/context_di_generator) to your project
```yaml
dev_dependencies:
  build_runner:
  context_di_generator:
```

create empty feature class that extends [FeatureDependencies](https://pub.dev/documentation/context_di/latest/context_di/FeatureDependencies-class.html)
with _$(ClassName)Mixin
```dart
part 'basic_feature.g.dart';

typedef EntityBlocParams = ({int id});

void _dispose(BuildContext context, Repository instance) => instance.dispose();

@Feature()
@Singleton(Repository, as: RepositoryInterface, dispose: _dispose)
@Factory(ListBloc)
@Factory(EntityBloc, params: EntityBlocParams)
class BasicFeature extends FeatureDependencies with _$BasicFeatureMixin {
  const Basic({super.key, super.builder});
}
```

then run `dart run build_runner build -d` to generate feature file

generation could be combined with manual registration approach
```dart
@Feature()
@Singleton(SupabaseAuthUtils)
@Singleton(GetUserHandler)
@Singleton(SupabaseAuthApi)
@Singleton(AuthRepository, as: IAuthRepository)
@Singleton(ExternalOpenUrl)
class AppFeature extends FeatureDependencies with _$AppFeatureMixin {
  const AppFeature(this.initialDependencies, {super.key, super.builder});

  final List<Registration> initialDependencies;

  @override
  List<Registration> register() => [
    ...initialDependencies, //some initial dependencies
    ...super.register(), //generated dependencies
    registerSingleton<AppBloc>(
            (c) => AppBloc(c.resolve(), c), dispose: (c, bloc) => bloc.close()
    ), //manual registration
  ];
}
```

# Resolve approach

Now better approach is use code generation and resolve like this:

factories:
```dart
final bloc = context.read<CreateListBloc>()(context);

final bloc = context.read<CreateEntityBloc>()(context, (id: _id));
```
`CreateListBloc` and `CreateEntityBloc` will be generated

singletons:
```dart
final repo = contex.read<RepositoryInterface>();
```
old `context.resolve<T>()` approach still works

## Getting started
Create a feature class that extends `FeatureDependencies` and override `register` method.
When you need to register a dependency, use `registerSingleton`, `registerSingletonAs`, `registerFactory` or `registerParamsFactory` methods.

```dart
typedef EntityBlocParams = ({int id});

class BasicFeature extends FeatureDependencies {
  const BasicFeature({super.key, super.builder});

  @override
  List<Registration> register(BuildContext context) {
    return [
      registerSingletonAs<Repository, RepositoryInterface>(
        (context) => Repository(context.resolve()),
        dispose: (context, instance) => instance.dispose(),
      ),
      registerFactory(
        (context) => ListBloc(context.resolve<RepositoryInterface>()),
      ),
      registerParamsFactory(
        (context, EntityBlocParams params) => EntityBloc(
          params.id,
          context.resolve(),
        ),
      ),
    ];
  }
}
```

Add to your widget tree
```dart
@RoutePage()
class BasicFeaturePage extends StatelessWidget {
  const BasicFeaturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicFeature(builder: (context) {
      return _Content();
    });
  }
}
```

And resolve dependencies in feature context
```dart
class _Content extends StatefulWidget {
  const _Content();

  @override
  State<_Content> createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  late final ListBloc _listBloc;

  int? _selectedId;

  @override
  void initState() {
    _listBloc = context.resolve<ListBloc>(); //old approach
    _listBloc = context.read<CreateListBloc>()(context); //new approach
    super.initState();
  }

  @override
  void dispose() {
    _listBloc.close();
    super.dispose();
  }

  //...
}
```
```dart
@RoutePage()
class EntityPage extends StatelessWidget {
  final int _id;

  const EntityPage({super.key, required int id}) : _id = id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EntityBloc>(
      create: (_) => context.resolveWithParams((id: _id)),
      child: BlocBuilder<EntityBloc, EntityState>(builder: (context, state) {
        return Scaffold(
          body: switch (state) {
            Initial() => Center(child: CircularProgressIndicator.adaptive()),
            Loaded() => _Content(state),
          },
        );
      }),
    );
  }
}
```

basic resolve
```dart
 final listBloc = context.resolve<ListBloc>(); //old approach
 final listBloc = context.read<CreateListBloc>()(context); //new approach
```

parametrized resolve
```dart
 var create = (_) => context.resolveWithParams((id: _id)); //old approach
 var create = (_) => context.read<CreateEntityBloc>()(context, (id: _id)); //new approach
```

## Additional information

IMPORTANT NOTICE! You can use `resolve` or `resolveWithParams` only in feature context, in lover levels of widget tree.
If you have some core dependencies register them on app level:
```dart
class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return _RootDependencies(
      builder: (context) => MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: _router.config(),
      ),
    );
  }
}

class _RootDependencies extends FeatureDependencies {
  const _RootDependencies({super.builder});

  @override
  List<Registration> register(BuildContext context) {
    return [
      registerSingleton<Logger>((_) => Logger()),
    ];
  }
}
```

