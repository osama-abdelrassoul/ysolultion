import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ysolultion/core/app_constants/app_constants.dart';
import 'package:ysolultion/core/services/injection_container.dart';
import 'package:ysolultion/features/task/presentation/cubit/post_cubit.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PostCubit>()..fetchPost(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Post Details"),
          backgroundColor: AppColors.appGreemColor,
        ),
        body: BlocBuilder<PostCubit, AllPostsState>(
          builder: (context, state) {
            if (state is PostLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is Error) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: AppColors.appBlackColor),
                ),
              );
            } else if (state is PostLoaded) {
              final posts = state.postList;

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];

                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "User ID: ${post.userId}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.appGreyColor,
                              ),
                            ),
                            Text(
                              "Post ID: ${post.id}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.appGreyColor,
                              ),
                            ),
                            const Divider(),
                            Text(
                              post.title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              post.body,
                              style: const TextStyle(
                                fontSize: 16,
                                color: AppColors.appBlackColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
            return const Center(child: Text("Unexpected State"));
          },
        ),
      ),
    );
  }
}
