// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'some_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SomeEntity {
  int get id;

  String get title;

  String get subtitle;

  /// Create a copy of SomeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SomeEntityCopyWith<SomeEntity> get copyWith =>
      _$SomeEntityCopyWithImpl<SomeEntity>(this as SomeEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SomeEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, subtitle);

  @override
  String toString() {
    return 'SomeEntity(id: $id, title: $title, subtitle: $subtitle)';
  }
}

/// @nodoc
abstract mixin class $SomeEntityCopyWith<$Res> {
  factory $SomeEntityCopyWith(
          SomeEntity value, $Res Function(SomeEntity) _then) =
      _$SomeEntityCopyWithImpl;

  @useResult
  $Res call({int id, String title, String subtitle});
}

/// @nodoc
class _$SomeEntityCopyWithImpl<$Res> implements $SomeEntityCopyWith<$Res> {
  _$SomeEntityCopyWithImpl(this._self, this._then);

  final SomeEntity _self;
  final $Res Function(SomeEntity) _then;

  /// Create a copy of SomeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? subtitle = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _self.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _SomeEntity implements SomeEntity {
  const _SomeEntity(this.id, this.title, this.subtitle);

  @override
  final int id;
  @override
  final String title;
  @override
  final String subtitle;

  /// Create a copy of SomeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SomeEntityCopyWith<_SomeEntity> get copyWith =>
      __$SomeEntityCopyWithImpl<_SomeEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SomeEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, subtitle);

  @override
  String toString() {
    return 'SomeEntity(id: $id, title: $title, subtitle: $subtitle)';
  }
}

/// @nodoc
abstract mixin class _$SomeEntityCopyWith<$Res>
    implements $SomeEntityCopyWith<$Res> {
  factory _$SomeEntityCopyWith(
          _SomeEntity value, $Res Function(_SomeEntity) _then) =
      __$SomeEntityCopyWithImpl;

  @override
  @useResult
  $Res call({int id, String title, String subtitle});
}

/// @nodoc
class __$SomeEntityCopyWithImpl<$Res> implements _$SomeEntityCopyWith<$Res> {
  __$SomeEntityCopyWithImpl(this._self, this._then);

  final _SomeEntity _self;
  final $Res Function(_SomeEntity) _then;

  /// Create a copy of SomeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? subtitle = null,
  }) {
    return _then(_SomeEntity(
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      null == subtitle
          ? _self.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
