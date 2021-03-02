import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:interviewapp/modules/news/datasources/news_ds_impl.dart';
import 'package:interviewapp/modules/news/domain/contracts/news_repository.dart';
import 'package:interviewapp/modules/news/domain/usecases/get_news.dart';
import 'package:interviewapp/modules/news/infra/contracts/news_datasource.dart';
import 'package:interviewapp/modules/news/infra/repositories/news_repository_impl.dart';
import 'package:interviewapp/modules/posts/datasources/post_ds_fake_api_impl.dart';
import 'package:interviewapp/modules/posts/domain/contracts/post_repository.dart';
import 'package:interviewapp/modules/posts/domain/usecases/add_post.dart';
import 'package:interviewapp/modules/posts/domain/usecases/delete_post.dart';
import 'package:interviewapp/modules/posts/domain/usecases/get_posts.dart';
import 'package:interviewapp/modules/posts/domain/usecases/update_post.dart';
import 'package:interviewapp/modules/posts/infra/contracts/post_datasource.dart';
import 'package:interviewapp/modules/posts/infra/repositories/post_repository_impl.dart';
import 'package:interviewapp/modules/users/datasources/users_ds_fake_api_impl.dart';
import 'package:interviewapp/modules/users/domain/contracts/user_repository.dart';
import 'package:interviewapp/modules/users/domain/usecases/create_user.dart';
import 'package:interviewapp/modules/users/domain/usecases/get_logged_user.dart';
import 'package:interviewapp/modules/users/domain/usecases/login.dart';
import 'package:interviewapp/modules/users/infra/contracts/user_datasource.dart';
import 'package:interviewapp/modules/users/infra/repositories/user_repository_impl.dart';

void main() {
  runApp(MyApp());
}

void setup() {
  // DI
  GetIt.I
      .registerLazySingleton<NewsDataSource>(() => NewsDataSourceImpl(Dio()));
  GetIt.I.registerLazySingleton<NewsRepository>(
      () => NewsRepositoryImpl(GetIt.I<NewsDataSource>()));
  GetIt.I.registerLazySingleton<GetNews>(
      () => GetNewsImpl(GetIt.I<NewsRepositoryImpl>()));

  GetIt.I.registerLazySingleton<PostDataSource>(
    () => PostDataSourceImpl(),
  );
  GetIt.I.registerLazySingleton<PostRepository>(
      () => PostRepositoryImpl(GetIt.I<PostDataSource>()));
  GetIt.I.registerLazySingleton<AddPost>(() => AddPostImpl(
        GetIt.I<PostRepository>(),
        GetIt.I<UserRepository>(),
      ));
  GetIt.I.registerLazySingleton<DeletePost>(() => DeletePostImpl(
        GetIt.I<PostRepository>(),
        GetIt.I<UserRepository>(),
      ));
  GetIt.I.registerLazySingleton<GetPosts>(
      () => GetPostsImpl(GetIt.I<PostRepository>()));
  GetIt.I.registerLazySingleton<UpdatePost>(() => UpdatePostImpl(
        GetIt.I<PostRepository>(),
        GetIt.I<UserRepository>(),
      ));

  GetIt.I.registerLazySingleton<UserDataSource>(
      () => UserDataSourceFakeApiImpl(FlutterSecureStorage()));
  GetIt.I.registerLazySingleton<UserRepository>(() => UserRespositoryImpl(
        FlutterSecureStorage(),
        GetIt.I<UserDataSource>(),
      ));

  GetIt.I.registerLazySingleton<CreateUser>(() => CreateUserImpl(
        GetIt.I<UserRepository>(),
      ));
  GetIt.I.registerLazySingleton<GetLoggedUser>(() => GetLoggedUserImpl(
        GetIt.I<UserRepository>(),
      ));
  GetIt.I.registerLazySingleton<Login>(() => LoginImpl(
        GetIt.I<UserRepository>(),
      ));
  GetIt.I.registerLazySingleton<GetLoggedUser>(() => GetLoggedUserImpl(
        GetIt.I<UserRepository>(),
      ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
