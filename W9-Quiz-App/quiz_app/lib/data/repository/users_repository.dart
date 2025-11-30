import 'package:quiz_app/data/repository/repo_base.dart';
import 'package:quiz_app/model/quiz.dart';

class UsersRepository extends RepositoryBase<User> {
  UsersRepository() : super('users.json', assetPath: 'lib/data/db/users.json');

  @override
  User fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }

  @override
  Map<String, dynamic> toJson(User entity) {
    return {
      'id': entity.id,
      'name': entity.name,
      'email': entity.email,
      'password': entity.password,
    };
  }
}
