import 'package:flutter_test/flutter_test.dart';
import 'package:interviewapp/modules/posts/infra/contracts/post_datasource.dart';
import 'package:interviewapp/modules/posts/infra/models/post_model.dart';
import 'package:interviewapp/modules/posts/infra/repositories/post_repository_impl.dart';
import 'package:mockito/mockito.dart';

class PostDataSourceMock extends Mock implements PostDataSource {}

main() {
  final dataSource = PostDataSourceMock();
  final repository = PostRepositoryImpl(dataSource);

  test('Add Should return PostModel', () async {
    when(dataSource.add(any, any, any)).thenAnswer((_) async => PostModel());

    final result = await repository.add('teste', 'testeId', DateTime.now());

    expect(result, isA<PostModel>());
  });

  test('Update Should return PostModel', () async {
    when(dataSource.update(any, any, any)).thenAnswer((_) async => PostModel());

    final result = await repository.update('teste', 'testeId', DateTime.now());

    expect(result, isA<PostModel>());
  });

  test('Delete Should return PostModel', () async {
    when(dataSource.delete(any)).thenAnswer((_) async => true);

    final result = await repository.delete('testeId');

    expect(result, true);
  });

  test('GetAll Should return List<PostModel>', () async {
    when(dataSource.getAll()).thenAnswer((_) async => <PostModel>[]);

    final result = await repository.getAll();

    expect(result, isA<List<PostModel>>());
  });
}
