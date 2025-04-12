import 'package:context_di/context_di.dart';

import '../data/repositories/repository.dart';
import '../domain/domain.dart';
import 'managers/entity_bloc.dart';
import 'managers/list_bloc.dart';

part 'basic_feature.g.dart';

//typedef EntityBlocParams = ({int id});

class EntityBlocParams {
  final int id;

  const EntityBlocParams(this.id);
}

typedef Params = ({int id});

void _dispose(BuildContext context, Repository instance) => instance.dispose();

@Feature()
@Singleton(Repository, as: RepositoryInterface, dispose: _dispose)
@Factory(ListBloc)
@Factory(EntityBloc, params: EntityBlocParams)
@Factory(ParamsConstructor, params: Params)
class BasicFeature extends FeatureDependencies with _$BasicFeatureMixin {
  const BasicFeature({super.key, super.builder, super.child});
}


class ParamsConstructor {
  final int id;
  final BuildContext c;

  const ParamsConstructor(this.id, this.c);
}
