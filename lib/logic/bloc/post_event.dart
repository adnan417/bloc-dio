part of 'post_bloc.dart';

abstract class PostEvent {}

class PostFetchEvent extends PostEvent {
  PostFetchEvent();
}
