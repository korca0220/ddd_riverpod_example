import 'package:ddd_riverpod_example/domain/character/character.dart';
import 'package:ddd_riverpod_example/providers/api_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final charactersDatasProvider = FutureProvider.autoDispose<List<CharacterModel>>(
  (ref) {
    return ref.read(apiProvider).getCharactersDatas().then(
      (characters) {
        final List<CharacterModel> characterList = [];
        for (var i = 0; i < 10; i++) {
          characterList.add(
            CharacterModel(
              characterName: characters[i]["name"],
              characterImgUrl: characters[i]["image"],
            ),
          );
        }
        return characterList;
      },
    );
  },
);