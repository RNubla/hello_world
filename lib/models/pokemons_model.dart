class PokemonsModel {
  final String name;
  final String url;

  PokemonsModel({required this.name, required this.url});

  factory PokemonsModel.fromJson(Map<String, dynamic> json) {
    return PokemonsModel(name: json['name'], url: json['url']);
  }
}
