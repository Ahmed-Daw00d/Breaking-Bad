class Character {
  late int charid;
  late String name;
  late String nickname;
  late String image;
  late List<dynamic> jops;
  late String status;
  late List<dynamic> appearance;
  late String actorname;
  late String category;
  late List<dynamic> betterCallSaulAppearance;

  Character.fromJson(Map<String, dynamic> json) {
    charid = json['char_id'];
    name = json['name'];
    nickname = json['nickname'];
    image = json['img'];
    jops = json['occupation'];
    status = json['status'];
    appearance = json['appearance'];
    actorname = json['portrayed'];
    category = json['category'];
    betterCallSaulAppearance = json['better_call_saul_appearance'];
  }
}
