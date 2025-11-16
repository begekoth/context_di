// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ListEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ListEvent()';
  }
}

/// @nodoc
class $ListEventCopyWith<$Res> {
  $ListEventCopyWith(ListEvent _, $Res Function(ListEvent) __);
}

/// @nodoc

class _Started implements ListEvent {
  const _Started();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ListEvent.started()';
  }
}

/// @nodoc

class _Select implements ListEvent {
  const _Select(this.entity);

  final SomeEntity? entity;

  /// Create a copy of ListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SelectCopyWith<_Select> get copyWith =>
      __$SelectCopyWithImpl<_Select>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Select &&
            (identical(other.entity, entity) || other.entity == entity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, entity);

  @override
  String toString() {
    return 'ListEvent.select(entity: $entity)';
  }
}

/// @nodoc
abstract mixin class _$SelectCopyWith<$Res>
    implements $ListEventCopyWith<$Res> {
  factory _$SelectCopyWith(_Select value, $Res Function(_Select) _then) =
      __$SelectCopyWithImpl;
  @useResult
  $Res call({SomeEntity? entity});

  $SomeEntityCopyWith<$Res>? get entity;
}

/// @nodoc
class __$SelectCopyWithImpl<$Res> implements _$SelectCopyWith<$Res> {
  __$SelectCopyWithImpl(this._self, this._then);

  final _Select _self;
  final $Res Function(_Select) _then;

  /// Create a copy of ListEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? entity = freezed,
  }) {
    return _then(_Select(
      freezed == entity
          ? _self.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as SomeEntity?,
    ));
  }

  /// Create a copy of ListEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SomeEntityCopyWith<$Res>? get entity {
    if (_self.entity == null) {
      return null;
    }

    return $SomeEntityCopyWith<$Res>(_self.entity!, (value) {
      return _then(_self.copyWith(entity: value));
    });
  }
}

/// @nodoc
mixin _$ListState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ListState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ListState()';
  }
}

/// @nodoc
class $ListStateCopyWith<$Res> {
  $ListStateCopyWith(ListState _, $Res Function(ListState) __);
}

/// @nodoc

class Initial implements ListState {
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
    return 'ListState.initial()';
  }
}

/// @nodoc

class Loaded implements ListState {
  const Loaded({final List<SomeEntity> list = const [], this.selected = null})
      : _list = list;

  final List<SomeEntity> _list;
  @JsonKey()
  List<SomeEntity> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @JsonKey()
  final SomeEntity? selected;

  /// Create a copy of ListState
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
            const DeepCollectionEquality().equals(other._list, _list) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_list), selected);

  @override
  String toString() {
    return 'ListState.loaded(list: $list, selected: $selected)';
  }
}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $ListStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) =
      _$LoadedCopyWithImpl;
  @useResult
  $Res call({List<SomeEntity> list, SomeEntity? selected});

  $SomeEntityCopyWith<$Res>? get selected;
}

/// @nodoc
class _$LoadedCopyWithImpl<$Res> implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

  /// Create a copy of ListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? list = null,
    Object? selected = freezed,
  }) {
    return _then(Loaded(
      list: null == list
          ? _self._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<SomeEntity>,
      selected: freezed == selected
          ? _self.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as SomeEntity?,
    ));
  }

  /// Create a copy of ListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SomeEntityCopyWith<$Res>? get selected {
    if (_self.selected == null) {
      return null;
    }

    return $SomeEntityCopyWith<$Res>(_self.selected!, (value) {
      return _then(_self.copyWith(selected: value));
    });
  }
}

// dart format on
