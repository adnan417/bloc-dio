import 'dart:convert';

import 'package:bloc_dio/data/models/post_model.dart';
import 'package:bloc_dio/data/repositories/api/api.dart';
import 'package:dio/dio.dart';

class PostRepository {
  API api = API();

  Future<List<PostModel>> fetchPosts() async {
    try {
      final Response response = await api.sendRequest.get('/posts');
      if (response.statusCode == 200) {
        return postModelFromJson(response.data.toString());
      } else {
        throw Exception(response.data.toString());
      }
    } on DioException catch (error) {
      throw Exception(error.message);
    }
  }
}
