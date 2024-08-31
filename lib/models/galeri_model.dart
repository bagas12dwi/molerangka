class Galeri {
  int id;
  String caption;
  String imgPath;
  String link;


  Galeri({
    required this.id,
    required this.caption,
    required this.imgPath,
    required this.link
  });

  factory Galeri.fromJson(Map<String, dynamic> json) {
    return Galeri(
        id: (json['id']??0) as int,
        caption: (json['caption']??'') as String,
        imgPath: (json['img_path']??'') as String,
        link: (json['link']??'') as String
    );
  }

}
