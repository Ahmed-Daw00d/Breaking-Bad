import 'package:flutter/material.dart';
import 'package:train_bloc/Data/model/characters.dart';
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

  @override
  Widget build(BuildContext context) {
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
                          ? characterInfo(
                              'Seasons : ', character.appearance.join(' / '))
                          : Container(),
                      buildDivider(3),
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
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 500,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
