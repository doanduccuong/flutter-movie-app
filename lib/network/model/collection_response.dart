import 'package:flutter_base/network/model/movie_content.dart';
import 'package:json_annotation/json_annotation.dart';

part 'collection_response.g.dart';

@JsonSerializable()
class CollectionResponse {
  @JsonKey(name: "poster_path") String? posterPath;
  @JsonKey(name: "backdrop_path") String? backdropPath;
  List<MovieContent?>? part;
  CollectionResponse({this.posterPath});

  factory CollectionResponse.fromJson(Map<String, dynamic> json) => _$CollectionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionResponseToJson(this);
}