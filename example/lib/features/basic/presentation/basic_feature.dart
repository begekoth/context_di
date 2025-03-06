import 'package:context_di/context_di.dart';
import 'package:flutter/material.dart';

import '../data/repositories/repository.dart';
import '../domain/domain.dart';
import 'managers/entity_bloc.dart';
import 'managers/list_bloc.dart';

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
          context.resolve<RepositoryInterface>(),
        ),
      ),
    ];
  }
}
