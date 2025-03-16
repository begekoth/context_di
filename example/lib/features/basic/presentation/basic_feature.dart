import 'package:context_di/context_di.dart';

import '../data/repositories/repository.dart';
import '../domain/domain.dart';
import 'managers/entity_bloc.dart';
import 'managers/list_bloc.dart';

typedef EntityBlocParams = ({int id});

class BasicFeature extends FeatureDependencies {
  const BasicFeature({super.key, super.builder});

  @override
  List<Registration> register() {
    return [
      registerSingletonAs<Repository, RepositoryInterface>(
        (context) => Repository(context.resolve()),
        dispose: (context, instance) => instance.dispose(),
      ),
      registerFactory(
        (context) => ListBloc(context.resolve()),
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
