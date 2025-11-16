import 'package:freezed_annotation/freezed_annotation.dart';

part 'some_entity.freezed.dart';

@freezed
abstract class SomeEntity with _$SomeEntity {
  const factory SomeEntity(int id, String title, String subtitle) = _SomeEntity;
}
