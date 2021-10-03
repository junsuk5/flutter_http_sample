import 'dart:convert';

import 'package:flutter_http_sample/data/remote/dto/post_request.dart';
import 'package:flutter_http_sample/data/remote/dto/post_response.dart';
import 'package:flutter_http_sample/data/remote/http_routes.dart';
import 'package:flutter_http_sample/data/remote/posts_service.dart';
import 'package:http/http.dart';

class PostsServiceImpl implements PostsService {
  final Client _client;

  PostsServiceImpl(this._client);

  @override
  Future<PostResponse?> createPost(PostRequest postRequest) async {
    final response = await _client.post(
      Uri.parse(HttpRoutes.posts),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(postRequest.toJson()),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return PostResponse.fromJson(jsonResponse);
    } else if (response.statusCode >= 500) {
      print('Error: ${response.body.toString()}');
      return null;
    } else if (response.statusCode >= 400) {
      print('Error: ${response.body.toString()}');
      return null;
    } else if (response.statusCode >= 300) {
      print('Error: ${response.body.toString()}');
      return null;
    } else {
      print('Error: ${response.body.toString()}');
      return null;
    }
  }

  @override
  Future<List<PostResponse>> getPosts() async {
    final response = await _client.get(Uri.parse(HttpRoutes.posts));

    if (response.statusCode == 200) {
      Iterable jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((e) => PostResponse.fromJson(e)).toList();
    } else if (response.statusCode >= 500) {
      print('Error: ${response.body.toString()}');
      return [];
    } else if (response.statusCode >= 400) {
      print('Error: ${response.body.toString()}');
      return [];
    } else if (response.statusCode >= 300) {
      print('Error: ${response.body.toString()}');
      return [];
    } else {
      print('Error: ${response.body.toString()}');
      return [];
    }
  }
}
