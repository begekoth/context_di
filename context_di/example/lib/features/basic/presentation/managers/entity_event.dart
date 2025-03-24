part of 'entity_bloc.dart';

@freezed
sealed class EntityEvent with _$EntityEvent {
  const factory EntityEvent.started(int id) = _Started;
}
