class User {
  int? id;
  String? name;
  String email;
  String? userClass;
  String? role;
  String? imgPath;
  String password;


  User({
    required this.id,
    required this.name,
    required this.email,
    required this.userClass,
    required this.role,
    required this.imgPath,
    required this.password
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: (json['id']??"") as int,
        name: (json['name']??"") as String,
        email: (json['email']??"") as String,
        userClass: (json['class']??"") as String,
        imgPath: (json['img_path']??"") as String,
        role: (json['role']??"") as String,
        password: (json['password']??"") as String
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'id': id,
      'name': name,
      'email': email,
      'class': userClass,
      'password' : password
    };
  }

}
