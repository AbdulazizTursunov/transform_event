class GamingName {
  GamingName({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.shortDescription,
    required this.gameUrl,
    required this.genre,
    required this.platform,
    required this.publisher,
    required this.developer,
    required this.releaseDate,
    required this.freetogameProfileUrl,
  });

  GamingName.initial():this(
    id:0,
    title:'',
    thumbnail:'',
    shortDescription:'',
    gameUrl:'',
    platform:'',
    publisher:'',
    developer:'',
    releaseDate:'',
    freetogameProfileUrl:'',
    genre:'',
  );

  GamingName copyWith({
    int? id,
    String? title,
    String? thumbnail,
    String? shortDescription,
    String? gameUrl,
    String? platform,
    String? publisher,
    String? developer,
    String? releaseDate,
    String? freetogameProfileUrl,
    String? genre,
  }) =>
      GamingName(
        id: id ?? this.id,
        title: title ?? this.title,
        thumbnail: thumbnail ?? this.thumbnail,
        shortDescription: shortDescription ?? this.shortDescription,
        gameUrl: gameUrl ?? this.gameUrl,
        genre: genre ?? this.genre,
        platform: platform ?? this.platform,
        publisher: publisher ?? this.publisher,
        developer: developer ?? this.developer,
        releaseDate: releaseDate ?? this.releaseDate,
        freetogameProfileUrl: freetogameProfileUrl ?? this.freetogameProfileUrl,
      );

  factory GamingName.fromJson(Map<String, dynamic> json) => GamingName(
        id: json['id'] as int? ?? 0,
        title: json['title'] as String? ?? '',
        thumbnail: json['thumbnail'] as String? ?? '',
        shortDescription: json['short_description'] as String? ?? '',
        gameUrl: json['game_url'] as String? ?? '',
        genre: json['genre'] as String? ?? '',
        platform: json['platform'] as String? ?? '',
        publisher: json['publisher'] as String? ?? '',
        developer: json['developer'] as String? ?? '',
        releaseDate: json['release_date'] as String? ?? '',
        freetogameProfileUrl: json['freetogame_profile_url'] as String? ?? '',
      );

  final int id;
  final String title;
  final String thumbnail;
  final String shortDescription;
  final String gameUrl;
  final String platform;
  final String publisher;
  final String developer;
  final String releaseDate;
  final String freetogameProfileUrl;
  final String genre;
}
