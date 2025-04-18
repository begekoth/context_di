// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_feature.dart';

// **************************************************************************
// FeatureGenerator
// **************************************************************************

typedef CreateListBloc = ListBloc Function(BuildContext);

typedef CreateEntityBloc = EntityBloc Function(BuildContext, EntityBlocParams);

typedef CreateParamsConstructor = ParamsConstructor Function(
    BuildContext, ({int id}));

mixin _$BasicFeatureMixin on FeatureDependencies {
  @override
  List<Registration> register() {
    return [
      registerSingletonAs<Repository, RepositoryInterface>(
        (context) => Repository(
          context.resolve(),
          context.resolve(),
        ),
        dispose: _dispose,
      ),
      registerFactory(
        (context) => ListBloc(
          context.resolve(),
        ),
      ),
      registerParamsFactory(
        (context, EntityBlocParams params) => EntityBloc(
          params.id,
          context.resolve(),
        ),
      ),
      registerParamsFactory(
        (context, ({int id}) params) => ParamsConstructor(
          params.id,
          context,
        ),
      ),
    ];
  }
}
