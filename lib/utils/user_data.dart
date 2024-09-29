class UserData {
  static const List<Map<String, String>> users = [
    {'username': '123210022', 'password': '123210022'},
    {'username': '123210181', 'password': '123210181'},
    {'username': '123210131', 'password': '123210131'},
  ];

  static bool authenticate(String username, String password) {
    return users.any((user) =>
        user['username'] == username && user['password'] == password);
  }
}
