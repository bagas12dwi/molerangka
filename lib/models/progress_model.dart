class ProgressModel {
  int allTask;
  int taskDone;
  int persentase;
  String msg;

  ProgressModel({
    required this.allTask,
    required this.taskDone,
    required this.persentase,
    required this.msg,
  });

  factory ProgressModel.fromJson(Map<String, dynamic> json) {
    return ProgressModel(
        allTask: (json['allTask']??0) as int,
        taskDone: (json['taskDone']??0) as int,
        persentase: (json['persentase']??0) as int,
        msg: (json['msg']??'') as String
    );
  }

}