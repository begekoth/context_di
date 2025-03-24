import 'package:context_di/context_di.dart';
import 'package:flutter/widgets.dart';

import '../data/repositories/repository.dart';
import '../domain/domain.dart';
import 'managers/entity_bloc.dart';
import 'managers/list_bloc.dart';

part 'basic.feature.dart';

typedef EntityBlocParams = ({int id});

void _dispose(BuildContext context, Repository instance) => instance.dispose();

@Feature()
@Singleton(Repository, as: RepositoryInterface, dispose: _dispose)
@Factory(ListBloc)
@Factory(EntityBloc, params: EntityBlocParams)
class Basic extends FeatureDependencies with _$BasicFeatureMixin {
  const Basic({super.key, super.builder});
}
