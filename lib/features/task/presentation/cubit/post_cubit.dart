import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ysolultion/core/error/failure.dart';
import 'package:ysolultion/core/use_case/use_case.dart';
import 'package:ysolultion/features/task/domain/entities/post_entities.dart';
import 'package:ysolultion/features/task/domain/usecases/get_posts_usecase.dart';

part 'post_state.dart';

class PostCubit extends Cubit<AllPostsState> {
  final GetPostsUsecase getPostsUsecase;
  PostCubit(this.getPostsUsecase) : super(PostInitial());

  Future<void> fetchPost() async {
    emit(PostLoading());

    final failureOrPostList = await getPostsUsecase(NoParams());

    emit(await _eitherLoadedOrErrorState(failureOrPostList));
  }
}

Future<AllPostsState> _eitherLoadedOrErrorState(
  Either<Failure, List<PostEntities>> failureOrPostList,
) async {
  return failureOrPostList.fold((failure) => Error(message: failure.message), (
    postList,
  ) {
    return PostLoaded(postList: postList);
  });
}
