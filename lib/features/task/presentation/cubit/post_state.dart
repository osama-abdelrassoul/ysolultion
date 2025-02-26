part of 'post_cubit.dart';

abstract class AllPostsState extends Equatable {
  @override
  List<Object> get props => [];
}

class PostInitial extends AllPostsState {}

class PostLoading extends AllPostsState {}

class PostLoaded extends AllPostsState {
  final List<PostEntities> postList;
  PostLoaded({required this.postList});

  @override
  List<Object> get props => [postList];
}

class Error extends AllPostsState {
  final String message;

  Error({required this.message});
  @override
  List<Object> get props => [message];
}
