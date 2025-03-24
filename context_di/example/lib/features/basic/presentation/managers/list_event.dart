part of 'list_bloc.dart';

@freezed
sealed class ListEvent with _$ListEvent {
  const factory ListEvent.started() = _Started;

  const factory ListEvent.select(SomeEntity? entity) = _Select;
}
