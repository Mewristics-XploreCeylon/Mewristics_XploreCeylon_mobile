class User {
  String? token;

  // Private constructor
  User._privateConstructor();

  // Singleton instance
  static final User _instance = User._privateConstructor();

  // Factory constructor to return the same instance
  factory User() {
    return _instance;
  }
}
