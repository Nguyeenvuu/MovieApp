class Movie {
  int _id;
  String _title;
  String _overview;
  double _popularity;
  String _posterPath;
  int _budget;
  List<dynamic> _genres;
  List<dynamic> _productionCompanies;
  String _releaseDate;
  int _revenue;
  int _runtime;
  List<String> _casts;
  String _director;
  String _backDropPath;
  double _voteAverage;
  Movie(
      this._id,
      this._title,
      this._overview,
      this._popularity,
      this._posterPath,
      this._budget,
      this._genres,
      this._productionCompanies,
      this._releaseDate,
      this._revenue,
      this._runtime,
      this._casts,
      this._director,
      this._backDropPath,
      this._voteAverage);

  int get id => this._id;
  String get title => this._title;
  String get overview => this._overview;
  double get popularity => this._popularity;
  String get posterPath => this._posterPath;
  int get budget => this._budget;
  List<dynamic> get genres => this._genres;
  List<dynamic> get productionCompanies => this._productionCompanies;
  String get releaseDate => this._releaseDate;
  int get revenue => this._revenue;
  int get runtime => this.runtime;
  List<String> get casts => this._casts;
  String get director => this._director;
  String get backDropPath => this._backDropPath;
  double get voteAverage => this._voteAverage;

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      json['id'],
      json['original_title'],
      json['overview'],
      json['popularity'],
      json['poster_path'],
      json['budget'],
      json['genres'],
      json['production_companies'],
      json['release_date'],
      json['revenue'],
      json['runtime'],
      [],
      "",
      json['backdrop_path'],
      json['vote_average']
    );
  }
}
