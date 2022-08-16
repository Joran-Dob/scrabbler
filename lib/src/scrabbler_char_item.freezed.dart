// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'scrabbler_char_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ScrabblerCharItem {
  String get char => throw _privateConstructorUsedError;
  bool get correct => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScrabblerCharItemCopyWith<ScrabblerCharItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScrabblerCharItemCopyWith<$Res> {
  factory $ScrabblerCharItemCopyWith(
          ScrabblerCharItem value, $Res Function(ScrabblerCharItem) then) =
      _$ScrabblerCharItemCopyWithImpl<$Res>;
  $Res call({String char, bool correct});
}

/// @nodoc
class _$ScrabblerCharItemCopyWithImpl<$Res>
    implements $ScrabblerCharItemCopyWith<$Res> {
  _$ScrabblerCharItemCopyWithImpl(this._value, this._then);

  final ScrabblerCharItem _value;
  // ignore: unused_field
  final $Res Function(ScrabblerCharItem) _then;

  @override
  $Res call({
    Object? char = freezed,
    Object? correct = freezed,
  }) {
    return _then(_value.copyWith(
      char: char == freezed
          ? _value.char
          : char // ignore: cast_nullable_to_non_nullable
              as String,
      correct: correct == freezed
          ? _value.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_ScrabblerCharItemCopyWith<$Res>
    implements $ScrabblerCharItemCopyWith<$Res> {
  factory _$$_ScrabblerCharItemCopyWith(_$_ScrabblerCharItem value,
          $Res Function(_$_ScrabblerCharItem) then) =
      __$$_ScrabblerCharItemCopyWithImpl<$Res>;
  @override
  $Res call({String char, bool correct});
}

/// @nodoc
class __$$_ScrabblerCharItemCopyWithImpl<$Res>
    extends _$ScrabblerCharItemCopyWithImpl<$Res>
    implements _$$_ScrabblerCharItemCopyWith<$Res> {
  __$$_ScrabblerCharItemCopyWithImpl(
      _$_ScrabblerCharItem _value, $Res Function(_$_ScrabblerCharItem) _then)
      : super(_value, (v) => _then(v as _$_ScrabblerCharItem));

  @override
  _$_ScrabblerCharItem get _value => super._value as _$_ScrabblerCharItem;

  @override
  $Res call({
    Object? char = freezed,
    Object? correct = freezed,
  }) {
    return _then(_$_ScrabblerCharItem(
      char: char == freezed
          ? _value.char
          : char // ignore: cast_nullable_to_non_nullable
              as String,
      correct: correct == freezed
          ? _value.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ScrabblerCharItem
    with DiagnosticableTreeMixin
    implements _ScrabblerCharItem {
  const _$_ScrabblerCharItem({required this.char, this.correct = false});

  @override
  final String char;
  @override
  @JsonKey()
  final bool correct;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScrabblerCharItem(char: $char, correct: $correct)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ScrabblerCharItem'))
      ..add(DiagnosticsProperty('char', char))
      ..add(DiagnosticsProperty('correct', correct));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScrabblerCharItem &&
            const DeepCollectionEquality().equals(other.char, char) &&
            const DeepCollectionEquality().equals(other.correct, correct));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(char),
      const DeepCollectionEquality().hash(correct));

  @JsonKey(ignore: true)
  @override
  _$$_ScrabblerCharItemCopyWith<_$_ScrabblerCharItem> get copyWith =>
      __$$_ScrabblerCharItemCopyWithImpl<_$_ScrabblerCharItem>(
          this, _$identity);
}

abstract class _ScrabblerCharItem implements ScrabblerCharItem {
  const factory _ScrabblerCharItem(
      {required final String char, final bool correct}) = _$_ScrabblerCharItem;

  @override
  String get char;
  @override
  bool get correct;
  @override
  @JsonKey(ignore: true)
  _$$_ScrabblerCharItemCopyWith<_$_ScrabblerCharItem> get copyWith =>
      throw _privateConstructorUsedError;
}
