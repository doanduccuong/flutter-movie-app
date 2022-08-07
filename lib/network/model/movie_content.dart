import 'package:json_annotation/json_annotation.dart';

part 'movie_content.g.dart';

@JsonSerializable()
class MovieContent {
  String? adult;
  @JsonKey(name: "genre_ids")
  List<int>? genreIds;
  List<MovieContent?>? part;
  @JsonKey(name: "original_language")
  String? originalLanguage;

  MovieContent({this.adult, this.genreIds, this.originalLanguage});

  factory MovieContent.fromJson(Map<String, dynamic> json) =>
      _$MovieContentFromJson(json);

  Map<String, dynamic> toJson() => _$MovieContentToJson(this);
}
