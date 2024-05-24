import 'package:bloc/bloc.dart';
import 'package:bloc_dio/data/models/post_model.dart';
import 'package:bloc_dio/data/repositories/post_repository.dart';
import 'package:bloc_dio/logic/bloc/post_state.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostLoadingState()) {
    // add(PostFetchEvent());
    on<PostFetchEvent>((event, emit) async {
      try {
        final posts = await PostRepository().fetchPosts();
        emit(PostLoadedState(posts));
      } catch (error) {
        emit(PostErrorState(error.toString()));
      }
    });
  }
}
