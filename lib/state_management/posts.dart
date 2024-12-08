import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostsStates> {
  PostCubit() : super(PostsInitial());

  void fetchPosts() async {
    emit(PostsLoading());
    await Future.delayed(
      const Duration(seconds: 5),
    );
    emit(PostsLoaded());
    await Future.delayed(
      const Duration(seconds: 5),
    );
    emit(PostsError());
  }
}

//isolate
abstract class PostsStates {}

class PostsInitial extends PostsStates {}

class PostsLoading extends PostsStates {}

class PostsLoaded extends PostsStates {}

class PostsError extends PostsStates {}
