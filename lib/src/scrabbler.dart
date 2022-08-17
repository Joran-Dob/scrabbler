import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrabbler/cubit/scrabbler_cubit.dart';
import 'package:scrabbler/src/scrabbler_char_item.dart';
import 'package:scrabbler/src/scrabbler_config.dart';

const _defaultBorderSide = BorderSide();

class Scrabbler extends StatelessWidget {
  const Scrabbler({
    super.key,
    this.config,
    required this.words,
  });

  final ScrabblerConfig? config;
  final List<String> words;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScrabblerCubit(
        config: config,
        words: words,
      ),
      child: const _Scrabbler(),
    );
  }
}

class _Scrabbler extends StatefulWidget {
  const _Scrabbler();

  @override
  State<_Scrabbler> createState() => _ScrabblerState();
}

class _ScrabblerState extends State<_Scrabbler> {
  @override
  Widget build(BuildContext context) {
    final _scrabblerCubit = BlocProvider.of<ScrabblerCubit>(context);

    return BlocBuilder<ScrabblerCubit, ScrabblerState>(
      bloc: _scrabblerCubit,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          loaded: (words, charItems) => ListView(
            children: [
              for (final _wordItem in words)
                Row(
                  children: [
                    for (final character in _wordItem.characters)
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 2.0,
                          ),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: _defaultBorderSide,
                                  left: _defaultBorderSide,
                                  right: _wordItem.characters.last == character
                                      ? _defaultBorderSide
                                      : BorderSide.none,
                                  top: _defaultBorderSide,
                                ),
                              ),
                              child: character.correct
                                  ? Center(
                                      child: Text(
                                        character.char,
                                        style: const TextStyle(
                                          fontSize: 24,
                                        ),
                                      ),
                                    )
                                  : DragTarget<ScrabblerCharItem>(
                                      builder: (
                                        context,
                                        candidateData,
                                        rejectedData,
                                      ) {
                                        return const SizedBox();
                                      },
                                      onWillAccept: (data) {
                                        if (data != null) {
                                          return _scrabblerCubit.correctCharItemDropped(
                                            data,
                                            character,
                                          );
                                        }
                                        return false;
                                      },
                                      onAccept: (data) {
                                        _scrabblerCubit.onCharItemDropped(
                                          data,
                                          character,
                                          _wordItem,
                                        );
                                      },
                                    ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                ),
                itemCount: charItems.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Draggable<ScrabblerCharItem>(
                      dragAnchorStrategy: childDragAnchorStrategy,
                      data: charItems[index],
                      feedback: Material(
                        child: Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                            child: Text(
                              charItems[index].char.toUpperCase(),
                            ),
                          ),
                        ),
                      ),
                      childWhenDragging: Container(),
                      child: !charItems[index].correct
                          ? Container(
                              height: 40.0,
                              width: 40.0,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Center(
                                child: Text(
                                  charItems[index].char.toUpperCase(),
                                ),
                              ),
                            )
                          : Container(),
                    ),
                  );
                },
              ),
            ],
          ),
          orElse: SizedBox.new,
        );
      },
    );
  }
}
