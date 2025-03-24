// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entity_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EntityEvent {
  int get id;

  /// Create a copy of EntityEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EntityEventCopyWith<EntityEvent> get copyWith =>
      _$EntityEventCopyWithImpl<EntityEvent>(this as EntityEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EntityEvent &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'EntityEvent(id: $id)';
  }
}

/// @nodoc
abstract mixin class $EntityEventCopyWith<$Res> {
  factory $EntityEventCopyWith(
          EntityEvent value, $Res Function(EntityEvent) _then) =
      _$EntityEventCopyWithImpl;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$EntityEventCopyWithImpl<$Res> implements $EntityEventCopyWith<$Res> {
  _$EntityEventCopyWithImpl(this._self, this._then);

  final EntityEvent _self;
  final $Res Function(EntityEvent) _then;

  /// Create a copy of EntityEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _Started implements EntityEvent {
  const _Started(this.id);

  @override
  final int id;

  /// Create a copy of EntityEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StartedCopyWith<_Started> get copyWith =>
      __$StartedCopyWithImpl<_Started>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Started &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'EntityEvent.started(id: $id)';
  }
}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res>
    implements $EntityEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) =
      __$StartedCopyWithImpl;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$StartedCopyWithImpl<$Res> implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

  /// Create a copy of EntityEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(_Started(
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$EntityState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is EntityState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'EntityState()';
  }
}

/// @nodoc
class $EntityStateCopyWith<$Res> {
  $EntityStateCopyWith(EntityState _, $Res Function(EntityState) __);
}

/// @nodoc

class Initial implements EntityState {
  const Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'EntityState.initial()';
  }
}

/// @nodoc

class Loaded implements EntityState {
  const Loaded({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  /// Create a copy of EntityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadedCopyWith<Loaded> get copyWith =>
      _$LoadedCopyWithImpl<Loaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Loaded &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, subtitle);

  @override
  String toString() {
    return 'EntityState.loaded(title: $title, subtitle: $subtitle)';
  }
}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res>
    implements $EntityStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) =
      _$LoadedCopyWithImpl;
  @useResult
  $Res call({String title, String subtitle});
}

/// @nodoc
class _$LoadedCopyWithImpl<$Res> implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

  /// Create a copy of EntityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? subtitle = null,
  }) {
    return _then(Loaded(
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

// dart format on
