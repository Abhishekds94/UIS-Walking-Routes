 class Post {
  final int cod;
  final List<dynamic> weather;
  Map<String, dynamic> main;
 String name;
  Post({this.cod,   this.weather,this.name,this.main});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      cod: json['cod'],
      weather: json['weather'],
      name: json['city'],
      main: json['main']
    );
  }
}
