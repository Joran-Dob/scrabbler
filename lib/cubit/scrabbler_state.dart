part of 'scrabbler_cubit.dart';

@freezed
class ScrabblerState with _$ScrabblerState {
  const factory ScrabblerState.initial() = _Initial;
  const factory ScrabblerState.loading() = _Loading;
  const factory ScrabblerState.loaded({
    required List<ScrabblerWordItem> words,
    required List<ScrabblerCharItem> charItems,
  }) = _Loaded;
  const factory ScrabblerState.error({
    required String message,
  }) = _Error;
}
