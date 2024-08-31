class UserScore {
  int subMaterialId;
  int userId;
  int score;

  UserScore({
    required this.subMaterialId,
    required this.userId,
    required this.score
  });

  factory UserScore.fromJson(Map<String, dynamic> json) {
    return UserScore(
        subMaterialId: (json['sub_material_id']??"") as int,
        userId: (json['user_id']??"") as int,
        score: (json['score']??"") as int
    );
  }

}
