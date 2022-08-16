import 'package:bloc/bloc.dart';
import 'package:flutter/rendering.dart';
import 'package:scrabbler/src/scrabbler_char_item.dart';
import 'package:scrabbler/src/scrabbler_config.dart';
import 'package:scrabbler/src/scrabbler_word_item.dart';
import 'package:flutter/material.dart';
part 'scrabbler_state.dart';

class ScrabblerCubit extends Cubit<ScrabblerState> {
  ScrabblerCubit({
    ScrabblerConfig? config,
  })  : _config = config,
        super(ScrabblerInitial()) {
    _init();
  }

  final ScrabblerConfig? _config;
  List<ScrabblerWordItem> words = [];
  List<ScrabblerCharItem> charItems = [];

  void _init() {
    emit(ScrabblerLoading());
    loadWordItems();
    emit(
      ScrabblerLoaded(
        words: words,
        charItems: charItems,
      ),
    );
  }

  final _words = <String>['BELOW', 'BLACK', 'BUILD', 'EIGHT', 'FORCE'];

  void loadWordItems() {
    _words.forEach((element) {
      words.add(
        ScrabblerWordItem(
          content: element,
          characters: element.characters.map((e) {
            final charItem = ScrabblerCharItem(
              char: e,
            );
            charItems.add(charItem);
            return charItem;
          }).toList(),
        ),
      );
    });
  }

  void onCharItemDropped(
    ScrabblerCharItem charItemDropped,
    ScrabblerCharItem charItem,
    ScrabblerWordItem wordItem,
  ) {
    if (correctCharItemDropped(charItem, charItemDropped)) {
      final wordIndex = words.indexOf(wordItem);
      final charIndex = words[wordIndex].characters.indexOf(charItem);
      words[wordIndex].characters[charIndex] = charItem.copyWith(
        correct: true,
      );
      emit(
        ScrabblerLoaded(
          words: words,
          charItems: charItems,
        ),
      );
    }
  }

  bool correctCharItemDropped(
    ScrabblerCharItem charItem,
    ScrabblerCharItem charItemDropped,
  ) {
    if (charItemDropped.char == charItem.char) {
      return true;
    }
    return false;
  }
}
