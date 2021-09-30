import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:train_bloc/Data/repostory/characters_repostory.dart';
import 'package:train_bloc/Data/wep_api/api.dart';
import 'package:train_bloc/bussines_logic/cubit/characters_cubit.dart';
import 'package:train_bloc/presentaation/screen/characters_details.dart';
import 'package:train_bloc/presentaation/screen/characters_screen.dart';
import 'Data/model/characters.dart';
import 'constants/string.dart';

class AppRouter {
  late CharactersRepostory charactersRepostory;

  late CharactersCubit charactersCubit;
  AppRouter() {
    charactersRepostory = CharactersRepostory(CharactersApi());
    charactersCubit = CharactersCubit(charactersRepostory);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CharacterScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: const CharactersScreen(),
          ),
        );
      case CharactersDetailsRout:
        final charcter = settings.arguments as Character;
        return MaterialPageRoute(
            builder: (_) => CharacterDetailsScreen(character: charcter));
    }
  }
}
