class Movies {
  Movies({
    required this.averageRating,
    required this.backdropPath,
    required this.description,
    required this.id,
    required this.iso_3166_1,
    required this.iso_639_1,
    required this.name,
    required this.page,
    required this.posterPath,
    required this.public,
    required this.listMovies,
    required this.revenue,
    required this.runtime,
    required this.sortBy,
    required this.totalPages,
    required this.totalResults,
  });
  late final double averageRating;
  late final String backdropPath;
  late final String description;
  late final int id;
  late final String iso_3166_1;
  late final String iso_639_1;
  late final String name;
  late final int page;
  late final String posterPath;
  late final bool public;
  late final List<Movie> listMovies;
  late final int revenue;
  late final int runtime;
  late final String sortBy;
  late final int totalPages;
  late final int totalResults;

  static Movies fromJson(Map json) {
    return Movies(
      averageRating: json['average_rating'] as double,
      backdropPath: json['backdrop_path'],
      description: json['description'],
      id: json['id'] as int,
      iso_3166_1: json['iso_3166_1'],
      iso_639_1: json['iso_639_1'],
      name: json['name'],
      page: json['page'] as int,
      posterPath: json['poster_path'],
      public: json['public'] as bool,
      listMovies: List.from(json['results'])
          .map((e) => Movie.fromJson(e))
          .toList(),
      revenue: json['revenue'] as int,
      runtime: json['runtime'] as int,
      sortBy: json['sort_by'],
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
    );
  }

  Map toJson() {
    return {
      'average_rating': averageRating,
      'backdrop_path': backdropPath,
      'description': description,
      'id': id,
      'iso_3166_1': iso_3166_1,
      'iso_639_1': iso_639_1,
      'name': name,
      'page': page,
      'poster_path': posterPath,
      'public': public,
      'results': listMovies.map((e) => e.toJson()).toList(),
      'revenue': revenue,
      'runtime': runtime,
      'sort_by': sortBy,
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }  
}

class Movie {
  Movie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.mediaType,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
  late final bool adult;
  late final String backdropPath;
  late final List<int> genreIds;
  late final int id;
  late final String mediaType;
  late final String originalLanguage;
  late final String originalTitle;
  late final String overview;
  late final double popularity;
  late final String posterPath;
  late final String releaseDate;
  late final String title;
  late final bool video;
  late final double voteAverage;
  late final int voteCount;

  @override
  String toString() {
    return 'MovieDetailsEntity(adult: $adult, backdropPath: $backdropPath, genreIds: $genreIds, id: $id, mediaType: $mediaType, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount)';
  }

  Map toJson() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'genre_ids': genreIds,
      'id': id,
      'media_type': mediaType,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'title': title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

  static Movie fromJson(Map json) {
    return Movie(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds: List.castFrom<dynamic, int>(json['genre_ids']),
      id: json['id'],
      mediaType: json['media_type'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'].toDouble(),
      voteCount: json['vote_count'],
    );
  }

}

