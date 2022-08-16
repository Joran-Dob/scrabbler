import 'package:scrabbler/src/scrabbler_char_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'scrabbler_char_item.freezed.dart';

@freezed
class ScrabblerCharItem with _$ScrabblerCharItem {
  const factory ScrabblerCharItem({
    required String char,
    @Default(false) bool correct,
  }) = _ScrabblerCharItem;
}
