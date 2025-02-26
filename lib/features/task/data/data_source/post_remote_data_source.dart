import 'package:dio/dio.dart';
import 'package:ysolultion/core/app_constants/app_constants.dart';
import 'package:ysolultion/core/error/exceptions.dart';
import 'package:ysolultion/core/network/error_message_model.dart';
import 'package:ysolultion/features/task/data/models/post_model.dart';
import 'package:ysolultion/features/task/domain/entities/post_entities.dart';

abstract class BasePostRemoteDataSource {
  Future<List<PostEntities>> getPosts();
}

class PostRemoteDataSource extends BasePostRemoteDataSource {
  PostRemoteDataSource({required this.dio});
  final Dio dio;
  @override
  Future<List<PostEntities>> getPosts() async {
    try {
      Response response = await dio.get(ApiConstants.postBaseUrl);

      if (response.statusCode == 200) {
        return List.from(
          (response.data).map((element) => PostModel.fromJson(element)),
        );
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } catch (e) {
      throw ServerException(
        errorMessageModel: ErrorMessageModel(
          statusCode: -1,
          statusMessage: e.toString(),
        ),
      );
    }
  }
}
