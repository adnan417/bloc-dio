import 'package:bloc_dio/logic/bloc/post_bloc.dart';
import 'package:bloc_dio/logic/bloc/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PostLoadedState) {
            return ListView.builder(
              itemBuilder: (context, index) => Text(state.posts[index].title!),
            );
          }

          return const Center(
            child: Text('An error occured'),
          );
        },
      ),
    );
  }
}
