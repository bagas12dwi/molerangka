class AchievementQuiz {
  int id;
  int userId;
  int score;

  AchievementQuiz({
    required this.id,
    required this.userId,
    required this.score
  });

  factory AchievementQuiz.fromJson(Map<String, dynamic> json) {
    return AchievementQuiz(
        id: (json['id']??"") as int,
        userId: (json['user_id']??"") as int,
        score: (json['score']??"") as int
    );
  }
}
