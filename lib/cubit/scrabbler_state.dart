part of 'scrabbler_cubit.dart';

@immutable
abstract class ScrabblerState {}

class ScrabblerInitial extends ScrabblerState {}

class ScrabblerLoading extends ScrabblerState {}

class ScrabblerLoaded extends ScrabblerState {
  ScrabblerLoaded({
    required this.words,
    required this.charItems,
  });

  final List<ScrabblerWordItem> words;
  final List<ScrabblerCharItem> charItems;
}
