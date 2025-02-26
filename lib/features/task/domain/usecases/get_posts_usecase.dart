import 'package:dartz/dartz.dart';
import 'package:ysolultion/core/error/failure.dart';
import 'package:ysolultion/core/use_case/use_case.dart';
import 'package:ysolultion/features/task/domain/repositories/base_posts_repository.dart';
import 'package:ysolultion/features/task/domain/entities/post_entities.dart';

class GetPostsUsecase extends BaseUseCase<List<PostEntities>, NoParams> {
  final BasePostsRepository basePostsRepository;
  GetPostsUsecase(this.basePostsRepository);

  @override
  Future<Either<Failure, List<PostEntities>>> call(NoParams noParams) {
    return basePostsRepository.getPosts();
  }
}
