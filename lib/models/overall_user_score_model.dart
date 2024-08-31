class OverallUserScore {
  int userId;
  int score;

  OverallUserScore({
    required this.userId,
    required this.score
  });

  factory OverallUserScore.fromJson(Map<String, dynamic> json) {
    return OverallUserScore(
        userId: (json['user_id']??"") as int,
        score: (json['score']??"") as int
    );
  }

}
