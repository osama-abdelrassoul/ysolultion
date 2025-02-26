import 'package:dartz/dartz.dart';
import 'package:ysolultion/core/error/failure.dart';
import 'package:ysolultion/features/task/data/data_source/post_remote_data_source.dart';
import 'package:ysolultion/features/task/domain/entities/post_entities.dart';
import 'package:ysolultion/features/task/domain/repositories/base_posts_repository.dart';

class PostRepository extends BasePostsRepository {
  final BasePostRemoteDataSource basePostRemoteDataSource;

  PostRepository(this.basePostRemoteDataSource);
  @override
  Future<Either<Failure, List<PostEntities>>> getPosts() async {
    try {
      final List<PostEntities> result =
          await basePostRemoteDataSource.getPosts();
      return Right(result);
    } catch (failure) {
      return Left(ServerFailure(failure.toString()));
    }
  }
}
