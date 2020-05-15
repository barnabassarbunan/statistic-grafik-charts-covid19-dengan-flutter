class Posts{
  final String provinsi;
  final int kasusPosi;
  final int kasusSemb;
  final int kasusMeni;

  Posts({this.provinsi, this.kasusPosi, this.kasusSemb, this.kasusMeni});

  factory Posts.fromJson(Map<dynamic, dynamic>json){
    return new Posts(
        provinsi: json['provinsi'],
        kasusPosi: (json['kasusPosi']),
        kasusSemb: (json['kasusSemb']),
        kasusMeni: (json['kasusMeni'])
    );
  }

}