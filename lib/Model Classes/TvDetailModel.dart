/// adult : false
/// backdrop_path : "/7q448EVOnuE3gVAx24krzO7SNXM.jpg"
/// created_by : []
/// episode_run_time : [32,23]
/// first_air_date : "2021-09-03"
/// genres : [{"id":10764,"name":"Reality"}]
/// homepage : "https://www.hulu.com/series/the-damelio-show-ad993806-7961-4eb3-9f92-e7b9a349ae22"
/// id : 130392
/// in_production : true
/// languages : ["en"]
/// last_air_date : "2021-09-03"
/// last_episode_to_air : {"air_date":"2021-09-03","episode_number":8,"id":3154389,"name":"Here’s to 17!","overview":"It’s Charli’s 17th birthday, and her family plans a surprise. Dixie releases her new song after a pep talk from music legend LA Reid. At her birthday party, Charli reflects on the highs and lows of the past year.","production_code":"","season_number":1,"still_path":"/uZgwKC56kMLfdRBw0h2YSbJI2qS.jpg","vote_average":9.667,"vote_count":63}
/// name : "The D'Amelio Show"
/// next_episode_to_air : null
/// networks : [{"name":"Hulu","id":453,"logo_path":"/pqUTCleNUiTLAVlelGxUgWn1ELh.png","origin_country":"US"}]
/// number_of_episodes : 8
/// number_of_seasons : 1
/// origin_country : ["US"]
/// original_language : "en"
/// original_name : "The D'Amelio Show"
/// overview : "From relative obscurity and a seemingly normal life, to overnight success and thrust into the Hollywood limelight overnight, the D’Amelios are faced with new challenges and opportunities they could not have imagined."
/// popularity : 15.608
/// poster_path : "/z0iCS5Znx7TeRwlYSd4c01Z0lFx.jpg"
/// production_companies : [{"id":83966,"logo_path":"/q2BuooxLm16EvWcUY4CMJo3PSNo.png","name":"The Intellectual Property Corporation","origin_country":"US"},{"id":165537,"logo_path":null,"name":"The D'Amelios","origin_country":"US"}]
/// production_countries : [{"iso_3166_1":"US","name":"United States of America"}]
/// seasons : [{"air_date":"2021-09-03","episode_count":8,"id":204453,"name":"Season 1","overview":"","poster_path":"/z0iCS5Znx7TeRwlYSd4c01Z0lFx.jpg","season_number":1}]
/// spoken_languages : [{"english_name":"English","iso_639_1":"en","name":"English"}]
/// status : "Returning Series"
/// tagline : "Followers come and go but family is forever."
/// type : "Reality"
/// vote_average : 9.4
/// vote_count : 2689

class TvDetailModel {
  TvDetailModel({
      bool? adult, 
      String? backdropPath, 
      List<dynamic>? createdBy, 
      List<int>? episodeRunTime, 
     // String? firstAirDate,
      List<Genres>? genres, 
      String? homepage, 
      int? id, 
      bool? inProduction, 
      List<String>? languages, 
      //String? lastAirDate,
      //LastEpisodeToAir? lastEpisodeToAir,
      String? name, 
      //dynamic nextEpisodeToAir,
      List<Networks>? networks, 
      int? numberOfEpisodes, 
      int? numberOfSeasons, 
      List<String>? originCountry, 
      String? originalLanguage, 
      String? originalName, 
      String? overview, 
      dynamic popularity,
      String? posterPath, 
      List<ProductionCompanies>? productionCompanies, 
      List<ProductionCountries>? productionCountries, 
      List<Seasons>? seasons, 
      List<SpokenLanguages>? spokenLanguages, 
      String? status, 
      String? tagline, 
      String? type, 
      dynamic voteAverage,
      int? voteCount,}){
    _adult = adult;
    _backdropPath = backdropPath;
    _createdBy = createdBy;
    _episodeRunTime = episodeRunTime;
   // _firstAirDate = firstAirDate;
    _genres = genres;
    _homepage = homepage;
    _id = id;
    _inProduction = inProduction;
    _languages = languages;
    //_lastAirDate = lastAirDate;
    //_lastEpisodeToAir = lastEpisodeToAir;
    _name = name;
   // _nextEpisodeToAir = nextEpisodeToAir;
    _networks = networks;
    _numberOfEpisodes = numberOfEpisodes;
    _numberOfSeasons = numberOfSeasons;
    _originCountry = originCountry;
    _originalLanguage = originalLanguage;
    _originalName = originalName;
    _overview = overview;
    _popularity = popularity;
    _posterPath = posterPath;
    _productionCompanies = productionCompanies;
    _productionCountries = productionCountries;
    _seasons = seasons;
    _spokenLanguages = spokenLanguages;
    _status = status;
    _tagline = tagline;
    _type = type;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
}

  TvDetailModel.fromJson(dynamic json) {
    _adult = json['adult'];
    _backdropPath = json['backdrop_path'];
    if (json['created_by'] != null) {
      _createdBy = [];
      json['created_by'].forEach((v) {
       // _createdBy?.add(Dynamic.fromJson(v));
      });
    }
    _episodeRunTime = json['episode_run_time'] != null ? json['episode_run_time'].cast<int>() : [];
   // _firstAirDate = json['first_air_date'];
    if (json['genres'] != null) {
      _genres = [];
      json['genres'].forEach((v) {
        _genres?.add(Genres.fromJson(v));
      });
    }
    _homepage = json['homepage'];
    _id = json['id'];
    _inProduction = json['in_production'];
    _languages = json['languages'] != null ? json['languages'].cast<String>() : [];
    //_lastAirDate = json['last_air_date'];
   // _lastEpisodeToAir = json['last_episode_to_air'] != null ? LastEpisodeToAir.fromJson(json['lastEpisodeToAir']) : null;
    _name = json['name'];
    //_nextEpisodeToAir = json['next_episode_to_air'];
    if (json['networks'] != null) {
      _networks = [];
      json['networks'].forEach((v) {
        _networks?.add(Networks.fromJson(v));
      });
    }
    _numberOfEpisodes = json['number_of_episodes'];
    _numberOfSeasons = json['number_of_seasons'];
    _originCountry = json['origin_country'] != null ? json['origin_country'].cast<String>() : [];
    _originalLanguage = json['original_language'];
    _originalName = json['original_name'];
    _overview = json['overview'];
    _popularity = json['popularity'];
    _posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      _productionCompanies = [];
      json['production_companies'].forEach((v) {
        _productionCompanies?.add(ProductionCompanies.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      _productionCountries = [];
      json['production_countries'].forEach((v) {
        _productionCountries?.add(ProductionCountries.fromJson(v));
      });
    }
    if (json['seasons'] != null) {
      _seasons = [];
      json['seasons'].forEach((v) {
        _seasons?.add(Seasons.fromJson(v));
      });
    }
    if (json['spoken_languages'] != null) {
      _spokenLanguages = [];
      json['spoken_languages'].forEach((v) {
        _spokenLanguages?.add(SpokenLanguages.fromJson(v));
      });
    }
    _status = json['status'];
    _tagline = json['tagline'];
    _type = json['type'];
    _voteAverage = json['vote_average'];
    _voteCount = json['vote_count'];
  }
  bool? _adult;
  String? _backdropPath;
  List<dynamic>? _createdBy;
  List<int>? _episodeRunTime;
  //String? _firstAirDate;
  List<Genres>? _genres;
  String? _homepage;
  int? _id;
  bool? _inProduction;
  List<String>? _languages;
 // String? _lastAirDate;
 // LastEpisodeToAir? _lastEpisodeToAir;
  String? _name;
 // dynamic _nextEpisodeToAir;
  List<Networks>? _networks;
  int? _numberOfEpisodes;
  int? _numberOfSeasons;
  List<String>? _originCountry;
  String? _originalLanguage;
  String? _originalName;
  String? _overview;
  dynamic _popularity;
  String? _posterPath;
  List<ProductionCompanies>? _productionCompanies;
  List<ProductionCountries>? _productionCountries;
  List<Seasons>? _seasons;
  List<SpokenLanguages>? _spokenLanguages;
  String? _status;
  String? _tagline;
  String? _type;
  dynamic _voteAverage;
  int? _voteCount;

  bool? get adult => _adult;
  String? get backdropPath => _backdropPath;
  List<dynamic>? get createdBy => _createdBy;
  List<int>? get episodeRunTime => _episodeRunTime;
 // String? get firstAirDate => _firstAirDate;
  List<Genres>? get genres => _genres;
  String? get homepage => _homepage;
  int? get id => _id;
  bool? get inProduction => _inProduction;
  List<String>? get languages => _languages;
 // String? get lastAirDate => _lastAirDate;
 // LastEpisodeToAir? get lastEpisodeToAir => _lastEpisodeToAir;
  String? get name => _name;
  //dynamic get nextEpisodeToAir => _nextEpisodeToAir;
  List<Networks>? get networks => _networks;
  int? get numberOfEpisodes => _numberOfEpisodes;
  int? get numberOfSeasons => _numberOfSeasons;
  List<String>? get originCountry => _originCountry;
  String? get originalLanguage => _originalLanguage;
  String? get originalName => _originalName;
  String? get overview => _overview;
  dynamic get popularity => _popularity;
  String? get posterPath => _posterPath;
  List<ProductionCompanies>? get productionCompanies => _productionCompanies;
  List<ProductionCountries>? get productionCountries => _productionCountries;
  List<Seasons>? get seasons => _seasons;
  List<SpokenLanguages>? get spokenLanguages => _spokenLanguages;
  String? get status => _status;
  String? get tagline => _tagline;
  String? get type => _type;
  dynamic get voteAverage => _voteAverage;
  int? get voteCount => _voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = _adult;
    map['backdrop_path'] = _backdropPath;
    if (_createdBy != null) {
      map['created_by'] = _createdBy?.map((v) => v.toJson()).toList();
    }
    map['episode_run_time'] = _episodeRunTime;
   // map['first_air_date'] = _firstAirDate;
    if (_genres != null) {
      map['genres'] = _genres?.map((v) => v.toJson()).toList();
    }
    map['homepage'] = _homepage;
    map['id'] = _id;
    map['in_production'] = _inProduction;
    map['languages'] = _languages;
   // map['last_air_date'] = _lastAirDate;
   //  if (_lastEpisodeToAir != null) {
   //    map['last_episode_to_air'] = _lastEpisodeToAir?.toJson();
   //  }
    map['name'] = _name;
    //
    // map['next_episode_to_air'] = _nextEpisodeToAir;
    if (_networks != null) {
      map['networks'] = _networks?.map((v) => v.toJson()).toList();
    }
    map['number_of_episodes'] = _numberOfEpisodes;
    map['number_of_seasons'] = _numberOfSeasons;
    map['origin_country'] = _originCountry;
    map['original_language'] = _originalLanguage;
    map['original_name'] = _originalName;
    map['overview'] = _overview;
    map['popularity'] = _popularity;
    map['poster_path'] = _posterPath;
    if (_productionCompanies != null) {
      map['production_companies'] = _productionCompanies?.map((v) => v.toJson()).toList();
    }
    if (_productionCountries != null) {
      map['production_countries'] = _productionCountries?.map((v) => v.toJson()).toList();
    }
    if (_seasons != null) {
      map['seasons'] = _seasons?.map((v) => v.toJson()).toList();
    }
    if (_spokenLanguages != null) {
      map['spoken_languages'] = _spokenLanguages?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    map['tagline'] = _tagline;
    map['type'] = _type;
    map['vote_average'] = _voteAverage;
    map['vote_count'] = _voteCount;
    return map;
  }

}

/// english_name : "English"
/// iso_639_1 : "en"
/// name : "English"

class SpokenLanguages {
  SpokenLanguages({
      String? englishName, 
      String? iso6391, 
      String? name,}){
    _englishName = englishName;
    _iso6391 = iso6391;
    _name = name;
}

  SpokenLanguages.fromJson(dynamic json) {
    _englishName = json['english_name'];
    _iso6391 = json['iso_639_1'];
    _name = json['name'];
  }
  String? _englishName;
  String? _iso6391;
  String? _name;

  String? get englishName => _englishName;
  String? get iso6391 => _iso6391;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['english_name'] = _englishName;
    map['iso_639_1'] = _iso6391;
    map['name'] = _name;
    return map;
  }

}

/// air_date : "2021-09-03"
/// episode_count : 8
/// id : 204453
/// name : "Season 1"
/// overview : ""
/// poster_path : "/z0iCS5Znx7TeRwlYSd4c01Z0lFx.jpg"
/// season_number : 1

class Seasons {
  Seasons({
      String? airDate, 
      int? episodeCount, 
      int? id, 
      String? name, 
      String? overview, 
      String? posterPath, 
      int? seasonNumber,}){
    _airDate = airDate;
    _episodeCount = episodeCount;
    _id = id;
    _name = name;
    _overview = overview;
    _posterPath = posterPath;
    _seasonNumber = seasonNumber;
}

  Seasons.fromJson(dynamic json) {
    _airDate = json['air_date'];
    _episodeCount = json['episode_count'];
    _id = json['id'];
    _name = json['name'];
    _overview = json['overview'];
    _posterPath = json['poster_path'];
    _seasonNumber = json['season_number'];
  }
  String? _airDate;
  int? _episodeCount;
  int? _id;
  String? _name;
  String? _overview;
  String? _posterPath;
  int? _seasonNumber;

  String? get airDate => _airDate;
  int? get episodeCount => _episodeCount;
  int? get id => _id;
  String? get name => _name;
  String? get overview => _overview;
  String? get posterPath => _posterPath;
  int? get seasonNumber => _seasonNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['air_date'] = _airDate;
    map['episode_count'] = _episodeCount;
    map['id'] = _id;
    map['name'] = _name;
    map['overview'] = _overview;
    map['poster_path'] = _posterPath;
    map['season_number'] = _seasonNumber;
    return map;
  }

}

/// iso_3166_1 : "US"
/// name : "United States of America"

class ProductionCountries {
  ProductionCountries({
      String? iso31661, 
      String? name,}){
    _iso31661 = iso31661;
    _name = name;
}

  ProductionCountries.fromJson(dynamic json) {
    _iso31661 = json['iso_3166_1'];
    _name = json['name'];
  }
  String? _iso31661;
  String? _name;

  String? get iso31661 => _iso31661;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['iso_3166_1'] = _iso31661;
    map['name'] = _name;
    return map;
  }

}

/// id : 83966
/// logo_path : "/q2BuooxLm16EvWcUY4CMJo3PSNo.png"
/// name : "The Intellectual Property Corporation"
/// origin_country : "US"

class ProductionCompanies {
  ProductionCompanies({
      int? id, 
      String? logoPath, 
      String? name, 
      String? originCountry,}){
    _id = id;
    _logoPath = logoPath;
    _name = name;
    _originCountry = originCountry;
}

  ProductionCompanies.fromJson(dynamic json) {
    _id = json['id'];
    _logoPath = json['logo_path'];
    _name = json['name'];
    _originCountry = json['origin_country'];
  }
  int? _id;
  String? _logoPath;
  String? _name;
  String? _originCountry;

  int? get id => _id;
  String? get logoPath => _logoPath;
  String? get name => _name;
  String? get originCountry => _originCountry;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['logo_path'] = _logoPath;
    map['name'] = _name;
    map['origin_country'] = _originCountry;
    return map;
  }

}

/// name : "Hulu"
/// id : 453
/// logo_path : "/pqUTCleNUiTLAVlelGxUgWn1ELh.png"
/// origin_country : "US"

class Networks {
  Networks({
      String? name, 
      int? id, 
      String? logoPath, 
      String? originCountry,}){
    _name = name;
    _id = id;
    _logoPath = logoPath;
    _originCountry = originCountry;
}

  Networks.fromJson(dynamic json) {
    _name = json['name'];
    _id = json['id'];
    _logoPath = json['logo_path'];
    _originCountry = json['origin_country'];
  }
  String? _name;
  int? _id;
  String? _logoPath;
  String? _originCountry;

  String? get name => _name;
  int? get id => _id;
  String? get logoPath => _logoPath;
  String? get originCountry => _originCountry;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['id'] = _id;
    map['logo_path'] = _logoPath;
    map['origin_country'] = _originCountry;
    return map;
  }

}

/// air_date : "2021-09-03"
/// episode_number : 8
/// id : 3154389
/// name : "Here’s to 17!"
/// overview : "It’s Charli’s 17th birthday, and her family plans a surprise. Dixie releases her new song after a pep talk from music legend LA Reid. At her birthday party, Charli reflects on the highs and lows of the past year."
/// production_code : ""
/// season_number : 1
/// still_path : "/uZgwKC56kMLfdRBw0h2YSbJI2qS.jpg"
/// vote_average : 9.667
/// vote_count : 63

class LastEpisodeToAir {
  LastEpisodeToAir({
      String? airDate, 
      int? episodeNumber, 
      int? id, 
      String? name, 
      String? overview, 
      String? productionCode, 
      int? seasonNumber, 
      String? stillPath, 
      dynamic voteAverage,
      int? voteCount,}){
    _airDate = airDate;
    _episodeNumber = episodeNumber;
    _id = id;
    _name = name;
    _overview = overview;
    _productionCode = productionCode;
    _seasonNumber = seasonNumber;
    _stillPath = stillPath;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
}

  LastEpisodeToAir.fromJson(dynamic json) {
    _airDate = json['air_date'];
    _episodeNumber = json['episode_number'];
    _id = json['id'];
    _name = json['name'];
    _overview = json['overview'];
    _productionCode = json['production_code'];
    _seasonNumber = json['season_number'];
    _stillPath = json['still_path'];
    _voteAverage = json['vote_average'];
    _voteCount = json['vote_count'];
  }
  String? _airDate;
  int? _episodeNumber;
  int? _id;
  String? _name;
  String? _overview;
  String? _productionCode;
  int? _seasonNumber;
  String? _stillPath;
  dynamic _voteAverage;
  int? _voteCount;

  String? get airDate => _airDate;
  int? get episodeNumber => _episodeNumber;
  int? get id => _id;
  String? get name => _name;
  String? get overview => _overview;
  String? get productionCode => _productionCode;
  int? get seasonNumber => _seasonNumber;
  String? get stillPath => _stillPath;
  dynamic get voteAverage => _voteAverage;
  int? get voteCount => _voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['air_date'] = _airDate;
    map['episode_number'] = _episodeNumber;
    map['id'] = _id;
    map['name'] = _name;
    map['overview'] = _overview;
    map['production_code'] = _productionCode;
    map['season_number'] = _seasonNumber;
    map['still_path'] = _stillPath;
    map['vote_average'] = _voteAverage;
    map['vote_count'] = _voteCount;
    return map;
  }

}

/// id : 10764
/// name : "Reality"

class Genres {
  Genres({
      int? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Genres.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  int? _id;
  String? _name;

  int? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}