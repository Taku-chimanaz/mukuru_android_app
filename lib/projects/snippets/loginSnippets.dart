class LoginSnippets {
  static validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required.';
    }
  }
}
