import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unit_test/model/user_model.dart';
import 'package:unit_test/repository/user_repository_impl.dart';

class MockHTTPClient extends Mock implements Client {}

void main() {
  late MockHTTPClient mockHTTPClient;
  late UserRepositoryImpl userRepositoryImpl;

  setUp(() {
    mockHTTPClient = MockHTTPClient();
    userRepositoryImpl = UserRepositoryImpl(mockHTTPClient);
  });

  group('UserRepositoy -', () {
    group('Get user function', () {
      test(
          'given UserRepositoryImpl class when getUser function called and status code 200 and success',
          () async {
        // ARRANGE
        when(() =>
                mockHTTPClient.get(Uri.parse('https://reqres.in/api/users/2')))
            .thenAnswer((invocation) async {
          return Response('''
            {"data":{"id":2,"email":"janet.weaver@reqres.in","first_name":"Janet","last_name":"Weaver","avatar":"https://reqres.in/img/faces/2-image.jpg"},"support":{"url":"https://reqres.in/#support-heading","text":"To keep ReqRes free, contributions towards server costs are appreciated!"}}
''', 200);
        });
        final user = await userRepositoryImpl.getUser();
        expect(user, isA<UserModel>());
      });

      test(
          'given UserRepositoryImpl class when getUser function called and throw exception',
          () async {
        when(() =>
                mockHTTPClient.get(Uri.parse('https://reqres.in/api/users/2')))
            .thenAnswer((invocation) async => Response('{}', 500));
        final user = userRepositoryImpl.getUser();
        expect(user, throwsException);
      });
    });
  });
}
