import 'package:ddd_riverpod_example/application/search/search_event.dart';
import 'package:ddd_riverpod_example/application/search/search_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier() : super(SearchState.empty());

  void mapEventsToState(SearchEvent event) {
    event.map(searchedTextChanged: ((searchedTextChangedEvent) {
      final characterList = [...state.characterList];
      final searchedCharacterList = characterList
          .where((characterModel) => characterModel.characterName
              .toLowerCase()
              .contains(searchedTextChangedEvent.text.toLowerCase().trimLeft()))
          .toList();
      state = state.copyWith(characterList: searchedCharacterList);
    }), updateListItems: (updateListItemEvent) {
      state = state.copyWith(
        characterList: updateListItemEvent.characterModelList,
      );
    });
  }
}
