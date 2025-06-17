import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/some_entity.dart';
import '../../domain/repositories/repository_interface.dart';

part 'entity_bloc.freezed.dart';
part 'entity_event.dart';
part 'entity_state.dart';

class EntityBloc extends Bloc<EntityEvent, EntityState> {
  final RepositoryInterface _repository;

  EntityBloc(this._repository, {required int id})
      : super(const EntityState.initial()) {
    on<EntityEvent>((event, emit) async {
      switch (event) {
        case _Started(:final id):
          if (await _repository.getEntity(id) case SomeEntity entity) {
            emit(EntityState.loaded(
              title: entity.title,
              subtitle: entity.subtitle,
            ));
          }
      }
    });

    add(EntityEvent.started(id));
  }
}
