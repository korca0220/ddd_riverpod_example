import 'package:ddd_riverpod_example/application/search/search_event.dart';
import 'package:ddd_riverpod_example/application/search/search_notifier.dart';
import 'package:ddd_riverpod_example/application/search/search_state.dart';
import 'package:ddd_riverpod_example/providers/character_datas_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchProvider =
    StateNotifierProvider.autoDispose<SearchNotifier, SearchState>(
  (ref) {
    final characterModelList =
        ref.watch(charactersDatasProvider).whenOrNull(data: (data) => data);

    return SearchNotifier()
      ..mapEventsToState(
        UpdateListItems(
          characterModelList: characterModelList ?? [],
        ),
      );
  },
);
