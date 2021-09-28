import 'package:flutter/material.dart';
import 'package:train_bloc/Data/model/characters.dart';
import 'package:train_bloc/constants/my_colors.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  const CharacterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.all(8),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWight,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: MyColors.myGrey,
          child: character.image.isNotEmpty
              ? FadeInImage.assetNetwork(
                  height: double.infinity,
                  width: double.infinity,
                  placeholder: 'assets/images/loading1.gif',
                  image: character.image,
                  fit: BoxFit.cover,
                )
              : Image.asset('assets/images/error.gif'),
        ),
        footer: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text(
            '${character.name}',
            style: TextStyle(
              height: 1.3,
              fontSize: 16,
              color: MyColors.myWight,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
