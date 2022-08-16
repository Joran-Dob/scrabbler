// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'scrabbler_word_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ScrabblerWordItem {
  String get content => throw _privateConstructorUsedError;
  set content(String value) => throw _privateConstructorUsedError;
  List<ScrabblerCharItem> get characters => throw _privateConstructorUsedError;
  set characters(List<ScrabblerCharItem> value) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScrabblerWordItemCopyWith<ScrabblerWordItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScrabblerWordItemCopyWith<$Res> {
  factory $ScrabblerWordItemCopyWith(
          ScrabblerWordItem value, $Res Function(ScrabblerWordItem) then) =
      _$ScrabblerWordItemCopyWithImpl<$Res>;
  $Res call({String content, List<ScrabblerCharItem> characters});
}

/// @nodoc
class _$ScrabblerWordItemCopyWithImpl<$Res>
    implements $ScrabblerWordItemCopyWith<$Res> {
  _$ScrabblerWordItemCopyWithImpl(this._value, this._then);

  final ScrabblerWordItem _value;
  // ignore: unused_field
  final $Res Function(ScrabblerWordItem) _then;

  @override
  $Res call({
    Object? content = freezed,
    Object? characters = freezed,
  }) {
    return _then(_value.copyWith(
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      characters: characters == freezed
          ? _value.characters
          : characters // ignore: cast_nullable_to_non_nullable
              as List<ScrabblerCharItem>,
    ));
  }
}

/// @nodoc
abstract class _$$_ScrabblerWordItemCopyWith<$Res>
    implements $ScrabblerWordItemCopyWith<$Res> {
  factory _$$_ScrabblerWordItemCopyWith(_$_ScrabblerWordItem value,
          $Res Function(_$_ScrabblerWordItem) then) =
      __$$_ScrabblerWordItemCopyWithImpl<$Res>;
  @override
  $Res call({String content, List<ScrabblerCharItem> characters});
}

/// @nodoc
class __$$_ScrabblerWordItemCopyWithImpl<$Res>
    extends _$ScrabblerWordItemCopyWithImpl<$Res>
    implements _$$_ScrabblerWordItemCopyWith<$Res> {
  __$$_ScrabblerWordItemCopyWithImpl(
      _$_ScrabblerWordItem _value, $Res Function(_$_ScrabblerWordItem) _then)
      : super(_value, (v) => _then(v as _$_ScrabblerWordItem));

  @override
  _$_ScrabblerWordItem get _value => super._value as _$_ScrabblerWordItem;

  @override
  $Res call({
    Object? content = freezed,
    Object? characters = freezed,
  }) {
    return _then(_$_ScrabblerWordItem(
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      characters: characters == freezed
          ? _value.characters
          : characters // ignore: cast_nullable_to_non_nullable
              as List<ScrabblerCharItem>,
    ));
  }
}

/// @nodoc

class _$_ScrabblerWordItem
    with DiagnosticableTreeMixin
    implements _ScrabblerWordItem {
  _$_ScrabblerWordItem({required this.content, required this.characters});

  @override
  String content;
  @override
  List<ScrabblerCharItem> characters;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScrabblerWordItem(content: $content, characters: $characters)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ScrabblerWordItem'))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('characters', characters));
  }

  @JsonKey(ignore: true)
  @override
  _$$_ScrabblerWordItemCopyWith<_$_ScrabblerWordItem> get copyWith =>
      __$$_ScrabblerWordItemCopyWithImpl<_$_ScrabblerWordItem>(
          this, _$identity);
}

abstract class _ScrabblerWordItem implements ScrabblerWordItem {
  factory _ScrabblerWordItem(
      {required String content,
      required List<ScrabblerCharItem> characters}) = _$_ScrabblerWordItem;

  @override
  String get content;
  set content(String value);
  @override
  List<ScrabblerCharItem> get characters;
  set characters(List<ScrabblerCharItem> value);
  @override
  @JsonKey(ignore: true)
  _$$_ScrabblerWordItemCopyWith<_$_ScrabblerWordItem> get copyWith =>
      throw _privateConstructorUsedError;
}
