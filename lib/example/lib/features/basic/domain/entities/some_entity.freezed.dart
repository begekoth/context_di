// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'some_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SomeEntity {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get subtitle => throw _privateConstructorUsedError;

  /// Create a copy of SomeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SomeEntityCopyWith<SomeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SomeEntityCopyWith<$Res> {
  factory $SomeEntityCopyWith(
          SomeEntity value, $Res Function(SomeEntity) then) =
      _$SomeEntityCopyWithImpl<$Res, SomeEntity>;
  @useResult
  $Res call({int id, String title, String subtitle});
}

/// @nodoc
class _$SomeEntityCopyWithImpl<$Res, $Val extends SomeEntity>
    implements $SomeEntityCopyWith<$Res> {
  _$SomeEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SomeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? subtitle = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SomeEntityImplCopyWith<$Res>
    implements $SomeEntityCopyWith<$Res> {
  factory _$$SomeEntityImplCopyWith(
          _$SomeEntityImpl value, $Res Function(_$SomeEntityImpl) then) =
      __$$SomeEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title, String subtitle});
}

/// @nodoc
class __$$SomeEntityImplCopyWithImpl<$Res>
    extends _$SomeEntityCopyWithImpl<$Res, _$SomeEntityImpl>
    implements _$$SomeEntityImplCopyWith<$Res> {
  __$$SomeEntityImplCopyWithImpl(
      _$SomeEntityImpl _value, $Res Function(_$SomeEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of SomeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? subtitle = null,
  }) {
    return _then(_$SomeEntityImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SomeEntityImpl implements _SomeEntity {
  const _$SomeEntityImpl(this.id, this.title, this.subtitle);

  @override
  final int id;
  @override
  final String title;
  @override
  final String subtitle;

  @override
  String toString() {
    return 'SomeEntity(id: $id, title: $title, subtitle: $subtitle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SomeEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, subtitle);

  /// Create a copy of SomeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SomeEntityImplCopyWith<_$SomeEntityImpl> get copyWith =>
      __$$SomeEntityImplCopyWithImpl<_$SomeEntityImpl>(this, _$identity);
}

abstract class _SomeEntity implements SomeEntity {
  const factory _SomeEntity(
          final int id, final String title, final String subtitle) =
      _$SomeEntityImpl;

  @override
  int get id;
  @override
  String get title;
  @override
  String get subtitle;

  /// Create a copy of SomeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SomeEntityImplCopyWith<_$SomeEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
