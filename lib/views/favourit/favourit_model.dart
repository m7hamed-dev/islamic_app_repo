class FavouritModel {
  // final int id;
  final String title;
  final String hsna;

  FavouritModel({
    // required this.id,
    required this.hsna,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    // used when inserting data to the database
    return <String, dynamic>{
      "title": title,
      "hsna": hsna,
    };
    // return <String, dynamic>{"id": id, "title": title};
  }

  factory FavouritModel.fromJson(Map json) {
    return FavouritModel(
      title: json['title'],
      hsna: json['hsna'],
    );
    // return FavouritModel(id: json['id'], title: json['title']);
  }
}
