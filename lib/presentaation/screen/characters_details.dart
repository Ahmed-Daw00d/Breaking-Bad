import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:train_bloc/Data/model/characters.dart';
import 'package:train_bloc/bussines_logic/cubit/characters_cubit.dart';
import 'package:train_bloc/constants/my_colors.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailsScreen({Key? key, required this.character})
      : super(key: key);
  buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.nickname,
          style: const TextStyle(color: MyColors.myWight),
          textAlign: TextAlign.start,
        ),
        background: Hero(
          tag: character.charid,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
                color: MyColors.myWight,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
                color: MyColors.myWight,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: Colors.red,
      height: 30,
      endIndent: endIndent,
      thickness: 2,
    );
  }

  Widget checkifQuotesloaded(CharactersState state) {
    if (state is Quotesloaded) {
      return displayRandomQuoteOrEmptySpace(state);
    } else {
      return ShowProgressIndicator();
    }
  }

  Widget displayRandomQuoteOrEmptySpace(state) {
    var quotes = (state).quotes;

    if (quotes.length != 0) {
      int randomQuoteIndex = Random().nextInt(quotes.length - 1);
      //todo
      return Container(
        child: Center(
          child: DefaultTextStyle(
            textAlign: TextAlign.center,
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                //TextAnimation
                FlickerAnimatedText(quotes[randomQuoteIndex].quote),
                ColorizeAnimatedText(
                  quotes[randomQuoteIndex].quote,
                  textStyle: TextStyle(
                    fontSize: 50.0,
                    fontFamily: 'Horizon',
                  ),
                  colors: [
                    Colors.purple,
                    Colors.blue,
                    Colors.yellow,
                    Colors.red,
                  ],
                ),
              ],
            ),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: MyColors.myWight,
              shadows: [
                Shadow(
                  blurRadius: 7.0,
                  color: Colors.white,
                  offset: Offset(0, 0),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget ShowProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharactersCubit>(context).getQuotes(character.name);
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo('Job : ', character.jops.join(' / ')),
                      buildDivider(3),
                      characterInfo('Appeared In : ', character.category),
                      buildDivider(3),
                      character.appearance.isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                characterInfo('Seasons : ',
                                    character.appearance.join(' / ')),
                                buildDivider(3),
                              ],
                            )
                          : Container(),
                      characterInfo('Status : ', character.status),
                      buildDivider(3),
                      character.betterCallSaulAppearance.isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                characterInfo(
                                    'Better call Saul Season : ',
                                    character.betterCallSaulAppearance
                                        .join(' / ')),
                                buildDivider(3),
                              ],
                            )
                          : Container(),
                      characterInfo('Actor/Actress : ', character.actorname),
                      buildDivider(3),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<CharactersCubit, CharactersState>(
                        builder: (context, state) {
                          return checkifQuotesloaded(state);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
