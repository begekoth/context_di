// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// FeatureGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic.dart';

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
        (context, ({int id}) params) => EntityBloc(
          params.id,
          context.resolve(),
        ),
      ),
    ];
  }
}
