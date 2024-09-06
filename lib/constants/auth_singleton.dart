class AuthTokenSingleton {
  // Private constructor
  AuthTokenSingleton._privateConstructor();

  // The single instance of the class
  static final AuthTokenSingleton _instance =
      AuthTokenSingleton._privateConstructor();

  // Factory constructor to return the same instance
  factory AuthTokenSingleton() {
    return _instance;
  }

  // The authToken field
  String? _authToken;

  // Getter for the authToken
  String? get authToken => _authToken;

  // Setter for the authToken
  set authToken(String? token) {
    _authToken = token;
  }

  // Method to clear the authToken
  void clearAuthToken() {
    _authToken = null;
  }
}
