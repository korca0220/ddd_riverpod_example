import 'package:ddd_riverpod_example/domain/character/character.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  factory SearchState({
    required List<CharacterModel> characterList,
  }) = _SearchState;
  const SearchState._();

  factory SearchState.empty() => SearchState(
        characterList: [],
      );
}
