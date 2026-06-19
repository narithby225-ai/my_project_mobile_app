import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  final SharedPreferences prefs;
  bool _isLoggedIn = false;
  bool _isAdmin = false;
  String _username = '';

  // Hardcoded admin credentials (same as HTML)
  static const String adminUsername = 'admin_narith';
  static const String adminPassword = 'admin123';

  AuthProvider(this.prefs) {
    _loadAuthState();
  }

  bool get isLoggedIn => _isLoggedIn;
  bool get isAdmin => _isAdmin;
  String get username => _username;

  Future<void> _loadAuthState() async {
    _isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    _isAdmin = prefs.getBool('isAdmin') ?? false;
    _username = prefs.getString('username') ?? '';
    notifyListeners();
  }

  Future<bool> login(String username, String password) async {
    if (username == adminUsername && password == adminPassword) {
      _isLoggedIn = true;
      _isAdmin = true;
      _username = username;

      await prefs.setBool('isLoggedIn', true);
      await prefs.setBool('isAdmin', true);
      await prefs.setString('username', username);

      notifyListeners();
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    _isLoggedIn = false;
    _isAdmin = false;
    _username = '';

    await prefs.remove('isLoggedIn');
    await prefs.remove('isAdmin');
    await prefs.remove('username');

    notifyListeners();
  }
}
