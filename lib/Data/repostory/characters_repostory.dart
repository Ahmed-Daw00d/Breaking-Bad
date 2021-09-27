import 'package:train_bloc/Data/model/characters.dart';
import 'package:train_bloc/Data/wep_api/api.dart';

class CharactersRepostory {
  final CharactersApi charactersApi;

  CharactersRepostory(this.charactersApi);
  Future<List<Character>> getAllCharacters() async {
    final characters = await charactersApi.getAllCharacters();
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }
}
