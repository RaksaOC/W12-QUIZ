/// Session Service (Singleton)
///
/// Manages application session state and authentication for doctors and managers.
library;

import 'package:quiz_app/model/quiz.dart';
import 'package:quiz_app/data/repository/users_repository.dart';

class SessionService {
  // Singleton boilerplate
  static final SessionService _instance = SessionService._internal();
  factory SessionService() => _instance;
  SessionService._internal();

  User? _currentUser;

  User? get currentUser => _currentUser;

  bool get isUserLoggedIn => _currentUser != null;

  /// Login as user using email/password
  /// Returns the authenticated User or null if invalid
  User? loginUser(String email, String password) {
    final trimmedEmail = email.trim();
    final trimmedPassword = password.trim();
    if (trimmedEmail.isEmpty || trimmedPassword.isEmpty) {
      return null;
    }

    final users = UsersRepository().loadAll();
    User? match;
    for (final u in users) {
      if (u.email == trimmedEmail && u.password == trimmedPassword) {
        match = u;
        break;
      }
    }
    if (match != null) {
      _currentUser = match;
    } else {
      _currentUser = null;
    }
    return _currentUser;
  }

  /// Clear current session (logout)
  void logout() {
    _currentUser = null;
  }
}
