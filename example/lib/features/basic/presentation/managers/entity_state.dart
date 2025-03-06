part of 'entity_bloc.dart';

@freezed
sealed class EntityState with _$EntityState {
  const factory EntityState.initial() = Initial;

  const factory EntityState.loaded({
    required String title,
    required String subtitle,
  }) = Loaded;
}
