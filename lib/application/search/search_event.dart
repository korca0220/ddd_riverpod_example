import 'package:ddd_riverpod_example/domain/character/character.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_event.freezed.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.searchedTextChanged({required String text}) =
      SearchedTextChanged;
  const factory SearchEvent.updateListItems(
      {required List<CharacterModel> characterModelList}) = UpdateListItems;
}
