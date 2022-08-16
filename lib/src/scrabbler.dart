import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrabbler/cubit/scrabbler_cubit.dart';
import 'package:scrabbler/src/scrabbler_char_item.dart';
import 'package:scrabbler/src/scrabbler_config.dart';

class Scrabbler extends StatelessWidget {
  const Scrabbler({
    Key? key,
    this.config,
  }) : super(key: key);

  final ScrabblerConfig? config;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScrabblerCubit(config: config),
      child: _Scrabbler(),
    );
  }
}

class _Scrabbler extends StatefulWidget {
  const _Scrabbler({Key? key}) : super(key: key);

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
        if (state is ScrabblerLoaded) {
          return ListView(
            children: [
              for (final _wordItem in state.words)
                Row(
                  children: [
                    for (final character in _wordItem.characters)
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                          ),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
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
                                      builder: (context, candidateData, rejectedData) {
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
                                      onMove: (details) => print(details),
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
                itemCount: state.charItems.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Draggable<ScrabblerCharItem>(
                      dragAnchorStrategy: (draggable, context, position) {
                        return childDragAnchorStrategy(draggable, context, position);
                      },
                      data: state.charItems[index],
                      feedback: Material(
                        child: Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child:
                              Center(child: Text('${state.charItems[index].char.toUpperCase()}')),
                        ),
                      ),
                      childWhenDragging: Container(),
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Center(child: Text('${state.charItems[index].char.toUpperCase()}')),
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
