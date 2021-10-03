import 'package:flutter_http_sample/data/remote/dto/post_request.dart';
import 'package:flutter_http_sample/data/remote/dto/post_response.dart';
import 'package:flutter_http_sample/data/remote/posts_service_impl.dart';
import 'package:http/http.dart';

abstract class PostsService {
  Future<List<PostResponse>> getPosts();

  Future<PostResponse?> createPost(PostRequest postRequest);

  factory PostsService.create() {
    return PostsServiceImpl(Client());
  }
}
