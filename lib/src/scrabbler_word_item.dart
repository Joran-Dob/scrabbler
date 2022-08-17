import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scrabbler/src/scrabbler_char_item.dart';

part 'scrabbler_word_item.freezed.dart';

@unfreezed
class ScrabblerWordItem with _$ScrabblerWordItem {
  factory ScrabblerWordItem({
    required String content,
    required List<ScrabblerCharItem> characters,
  }) = _ScrabblerWordItem;
}
