part of 'list_bloc.dart';

@freezed
sealed class ListState with _$ListState {
  const factory ListState.initial() = Initial;

  const factory ListState.loaded({
    @Default([]) List<SomeEntity> list,
    @Default(null) SomeEntity? selected,
  }) = Loaded;
}
