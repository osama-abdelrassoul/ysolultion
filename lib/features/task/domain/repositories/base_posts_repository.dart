import 'package:dartz/dartz.dart';
import 'package:ysolultion/core/error/failure.dart';
import 'package:ysolultion/features/task/domain/entities/post_entities.dart';

abstract class BasePostsRepository {
  Future<Either<Failure, List<PostEntities>>> getPosts();
}
