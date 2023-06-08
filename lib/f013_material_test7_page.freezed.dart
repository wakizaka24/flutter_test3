// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'f013_material_test7_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MaterialTest7PageState {
  List<String> get uniqueIdList => throw _privateConstructorUsedError;
  DateTime? get loadingDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MaterialTest7PageStateCopyWith<MaterialTest7PageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialTest7PageStateCopyWith<$Res> {
  factory $MaterialTest7PageStateCopyWith(MaterialTest7PageState value,
          $Res Function(MaterialTest7PageState) then) =
      _$MaterialTest7PageStateCopyWithImpl<$Res, MaterialTest7PageState>;
  @useResult
  $Res call({List<String> uniqueIdList, DateTime? loadingDate});
}

/// @nodoc
class _$MaterialTest7PageStateCopyWithImpl<$Res,
        $Val extends MaterialTest7PageState>
    implements $MaterialTest7PageStateCopyWith<$Res> {
  _$MaterialTest7PageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uniqueIdList = null,
    Object? loadingDate = freezed,
  }) {
    return _then(_value.copyWith(
      uniqueIdList: null == uniqueIdList
          ? _value.uniqueIdList
          : uniqueIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      loadingDate: freezed == loadingDate
          ? _value.loadingDate
          : loadingDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MaterialTest7PageStateCopyWith<$Res>
    implements $MaterialTest7PageStateCopyWith<$Res> {
  factory _$$_MaterialTest7PageStateCopyWith(_$_MaterialTest7PageState value,
          $Res Function(_$_MaterialTest7PageState) then) =
      __$$_MaterialTest7PageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> uniqueIdList, DateTime? loadingDate});
}

/// @nodoc
class __$$_MaterialTest7PageStateCopyWithImpl<$Res>
    extends _$MaterialTest7PageStateCopyWithImpl<$Res,
        _$_MaterialTest7PageState>
    implements _$$_MaterialTest7PageStateCopyWith<$Res> {
  __$$_MaterialTest7PageStateCopyWithImpl(_$_MaterialTest7PageState _value,
      $Res Function(_$_MaterialTest7PageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uniqueIdList = null,
    Object? loadingDate = freezed,
  }) {
    return _then(_$_MaterialTest7PageState(
      uniqueIdList: null == uniqueIdList
          ? _value._uniqueIdList
          : uniqueIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      loadingDate: freezed == loadingDate
          ? _value.loadingDate
          : loadingDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_MaterialTest7PageState implements _MaterialTest7PageState {
  const _$_MaterialTest7PageState(
      {final List<String> uniqueIdList = const [], this.loadingDate})
      : _uniqueIdList = uniqueIdList;

  final List<String> _uniqueIdList;
  @override
  @JsonKey()
  List<String> get uniqueIdList {
    if (_uniqueIdList is EqualUnmodifiableListView) return _uniqueIdList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_uniqueIdList);
  }

  @override
  final DateTime? loadingDate;

  @override
  String toString() {
    return 'MaterialTest7PageState(uniqueIdList: $uniqueIdList, loadingDate: $loadingDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaterialTest7PageState &&
            const DeepCollectionEquality()
                .equals(other._uniqueIdList, _uniqueIdList) &&
            (identical(other.loadingDate, loadingDate) ||
                other.loadingDate == loadingDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_uniqueIdList), loadingDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MaterialTest7PageStateCopyWith<_$_MaterialTest7PageState> get copyWith =>
      __$$_MaterialTest7PageStateCopyWithImpl<_$_MaterialTest7PageState>(
          this, _$identity);
}

abstract class _MaterialTest7PageState implements MaterialTest7PageState {
  const factory _MaterialTest7PageState(
      {final List<String> uniqueIdList,
      final DateTime? loadingDate}) = _$_MaterialTest7PageState;

  @override
  List<String> get uniqueIdList;
  @override
  DateTime? get loadingDate;
  @override
  @JsonKey(ignore: true)
  _$$_MaterialTest7PageStateCopyWith<_$_MaterialTest7PageState> get copyWith =>
      throw _privateConstructorUsedError;
}
