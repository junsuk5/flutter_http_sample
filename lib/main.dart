import 'package:flutter/material.dart';
import 'package:flutter_http_sample/data/remote/dto/post_response.dart';
import 'package:flutter_http_sample/data/remote/posts_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final service = PostsService.create();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Http 통신'),
      ),
      body: FutureBuilder<List<PostResponse>>(
          future: service.getPosts(),
          initialData: const [],
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container();
            }

            final posts = snapshot.data!;

            return ListView(
              children: posts.map((e) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(e.title, style: const TextStyle(fontSize: 20)),
                      const SizedBox(height: 4),
                      Text(e.body, style: const TextStyle(fontSize: 14)),
                    ],
                  ),
                );
              }).toList(),
            );
          }),
    );
  }
}
