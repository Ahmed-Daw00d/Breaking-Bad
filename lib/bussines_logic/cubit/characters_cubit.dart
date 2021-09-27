import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:train_bloc/Data/model/characters.dart';
import 'package:train_bloc/Data/repostory/characters_repostory.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepostory charactersRepostory;
  List<Character> characters = [];
  CharactersCubit(this.charactersRepostory) : super(CharactersInitial());
  List<Character> getAllCharacters() {
    charactersRepostory.getAllCharacters().then((characters) {
      emit(Charactersloaded(characters));
      this.characters = characters;
    });
    return characters;
  }
}
