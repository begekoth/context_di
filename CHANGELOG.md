## 0.2.2-Preview

Changed factory handling

now better approach is use code generation and resolve like this:

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
old `resolve` approach still works

add child to FeatureDependencies and changed builder to more like MultiProvider