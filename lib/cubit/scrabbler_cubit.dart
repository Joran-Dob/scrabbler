// ignore_for_file: public_member_api_docs

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scrabbler/src/scrabbler_char_item.dart';
import 'package:scrabbler/src/scrabbler_config.dart';
import 'package:scrabbler/src/scrabbler_word_item.dart';
part 'scrabbler_state.dart';
part 'scrabbler_cubit.freezed.dart';

class ScrabblerCubit extends Cubit<ScrabblerState> {
  ScrabblerCubit({
    ScrabblerConfig? config,
    required List<String> words,
  })  : _config = config,
        _wordValues = words,
        super(const ScrabblerState.initial()) {
    _init();
  }

  final List<String> _wordValues;

  final ScrabblerConfig? _config;
  List<ScrabblerWordItem> words = [];
  Map<ScrabblerWordItem, List<ScrabblerCharItem>> charItems = {};
  int currentWordIndex = 0;

  List<ScrabblerCharItem> get currentCharItems => charItems[words[currentWordIndex]] ?? [];

  void _init() {
    emit(const ScrabblerState.loading());
    _loadWordItems();
    emit(
      ScrabblerState.loaded(
        words: words,
        charItems: charItems,
        currentCharItems: currentCharItems,
        currentWordIndex: currentWordIndex,
      ),
    );
  }

  void _loadWordItems() {
    for (final word in _wordValues) {
      final characters = word.characters.toList();
      final wordCharItems = <ScrabblerCharItem>[];
      final wordItem = ScrabblerWordItem(
        content: word,
        characters: characters.map((e) {
          final charItem = ScrabblerCharItem(
            char: e,
          );
          wordCharItems.add(charItem);
          return charItem;
        }).toList(),
      );
      wordCharItems.shuffle();
      charItems[wordItem] = wordCharItems;
      words.add(wordItem);
    }
  }

  void onCharItemDropped(
    ScrabblerCharItem charItemDropped,
    ScrabblerCharItem charItem,
    ScrabblerWordItem wordItem,
  ) {
    emit(const ScrabblerState.loading());
    if (correctCharItemDropped(charItem, charItemDropped)) {
      final wordIndex = words.indexOf(wordItem);
      final charIndex = words[wordIndex].characters.indexOf(charItem);
      final charItemListIndex = currentCharItems.indexOf(charItemDropped);
      words[wordIndex].characters[charIndex] = charItem.copyWith(
        correct: true,
      );
      currentCharItems[charItemListIndex] = charItemDropped.copyWith(
        correct: true,
      );
      _checkIfCorrect();
      emit(
        ScrabblerState.loaded(
          words: words,
          charItems: charItems,
          currentCharItems: currentCharItems,
          currentWordIndex: currentWordIndex,
        ),
      );
    }
  }

  void _checkIfCorrect() {
    if (currentCharItems.every((element) => element.correct) &&
        currentWordIndex < words.length - 1) {
      currentWordIndex++;
    } else if (words.every((element) => element.characters.every((e) => e.correct))) {
      _config?.onGameCompleted?.call();
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
