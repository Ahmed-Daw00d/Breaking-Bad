import 'package:train_bloc/Data/model/character_quote.dart';
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

  Future<List<Quote>> getQuotesCharater(String charName) async {
    final quote = await charactersApi.getQuotesCharacters(charName);
    return quote.map((charQuote) => Quote.fromJson(charQuote)).toList();
  }
}
