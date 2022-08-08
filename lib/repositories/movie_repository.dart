import 'package:flutter_base/configs/app_configs.dart';
import 'package:flutter_base/models/entities/movie_entity.dart';
import 'package:flutter_base/models/response/array_response.dart';
import 'package:flutter_base/network/api_client.dart';
import 'package:flutter_base/network/model/collection_response.dart';

abstract class MovieRepository {
  Future<ArrayResponse<MovieEntity>> getMovies({required int page});

  Future<MovieEntity> getMovie(int id);

  Future<CollectionResponse?> getCollectionData({required String collectionId});
}

class MovieRepositoryImpl extends MovieRepository {
  ApiClient apiClient;

  MovieRepositoryImpl({required this.apiClient});

  @override
  Future<MovieEntity> getMovie(int id) {
    throw UnimplementedError();
  }

  @override
  Future<ArrayResponse<MovieEntity>> getMovies({required int page}) async {
    return apiClient.getMovies(MovieAPIConfig.apiKey, page);
  }

  @override
  Future<CollectionResponse?> getCollectionData(
      {required String collectionId}) async {
    return await apiClient.getTestResponse(collectionId, MovieAPIConfig.apiKey);
  }

// Future<CollectionResponse?> getCollectionData(String collectionId) async {
//   return apiClient.getTestResponse(collectionId, MovieAPIConfig.apiKey);
// }
}
