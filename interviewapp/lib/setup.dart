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
import 'package:dio/dio.dart';
import 'package:interviewapp/pages/createAccount/create_account_controller.dart';
import 'package:interviewapp/pages/home/home_controller.dart';
import 'package:interviewapp/pages/home/subpages/news/news_controller.dart';
import 'package:interviewapp/pages/home/subpages/post/posts_controller.dart';
import 'package:interviewapp/pages/login/login_controller.dart';

void setup() {
  // DI
  GetIt.I.registerLazySingleton<Dio>(() => Dio());
  GetIt.I.registerLazySingleton<FlutterSecureStorage>(
      () => FlutterSecureStorage());

  GetIt.I.registerLazySingleton<NewsDataSource>(
    () => NewsDataSourceImpl(
      GetIt.I<Dio>(),
    ),
  );
  GetIt.I.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImpl(
      GetIt.I<NewsDataSource>(),
    ),
  );
  GetIt.I.registerLazySingleton<GetNews>(
    () => GetNewsImpl(
      GetIt.I<NewsRepository>(),
    ),
  );

  GetIt.I.registerLazySingleton<PostDataSource>(
    () => PostDataSourceImpl(),
  );
  GetIt.I.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(
      GetIt.I<PostDataSource>(),
    ),
  );
  GetIt.I.registerLazySingleton<AddPost>(
    () => AddPostImpl(
      GetIt.I<PostRepository>(),
      GetIt.I<UserRepository>(),
    ),
  );
  GetIt.I.registerLazySingleton<DeletePost>(
    () => DeletePostImpl(
      GetIt.I<PostRepository>(),
      GetIt.I<UserRepository>(),
    ),
  );
  GetIt.I.registerLazySingleton<GetPosts>(
      () => GetPostsImpl(GetIt.I<PostRepository>()));
  GetIt.I.registerLazySingleton<UpdatePost>(
    () => UpdatePostImpl(
      GetIt.I<PostRepository>(),
      GetIt.I<UserRepository>(),
    ),
  );

  GetIt.I.registerLazySingleton<UserDataSource>(
      () => UserDataSourceFakeApiImpl(GetIt.I<FlutterSecureStorage>()));
  GetIt.I.registerLazySingleton<UserRepository>(
    () => UserRespositoryImpl(
      GetIt.I<FlutterSecureStorage>(),
      GetIt.I<UserDataSource>(),
    ),
  );

  GetIt.I.registerLazySingleton<CreateUser>(
    () => CreateUserImpl(
      GetIt.I<UserRepository>(),
    ),
  );
  GetIt.I.registerLazySingleton<GetLoggedUser>(
    () => GetLoggedUserImpl(
      GetIt.I<UserRepository>(),
    ),
  );
  GetIt.I.registerLazySingleton<Login>(
    () => LoginImpl(
      GetIt.I<UserRepository>(),
    ),
  );

  GetIt.I.registerLazySingleton<LoginController>(
    () => LoginController(
      GetIt.I<Login>(),
    ),
  );

  GetIt.I.registerLazySingleton<CreateAccountController>(
    () => CreateAccountController(
      GetIt.I<CreateUser>(),
    ),
  );

  GetIt.I.registerLazySingleton<HomeController>(
    () => HomeController(
      GetIt.I<AddPost>(),
      GetIt.I<GetPosts>(),
      GetIt.I<GetNews>(),
    ),
  );

  GetIt.I.registerLazySingleton<PostsController>(
    () => PostsController(
      GetIt.I<GetPosts>(),
    ),
  );

  GetIt.I.registerLazySingleton<NewsController>(
    () => NewsController(
      GetIt.I<GetNews>(),
    ),
  );
}
