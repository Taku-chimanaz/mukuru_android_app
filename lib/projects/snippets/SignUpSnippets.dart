class SignupSnippets {
  static validatePassword(String password, String comparedToPassword) {
    print('password ran');
    if (password.isEmpty || comparedToPassword.isEmpty) {
      return 'Password is required';
    }

    if (password != comparedToPassword) {
      return 'Passwords must match';
    }
    return null;
  }

  static validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      print('email $email');
      return 'Email is required';
    }

    if (!email.contains('@')) {
      return 'Please enter a valid email';
    }

    return null;
  }

  static validateFirstname(String? firstname) {
    if (firstname == null || firstname.isEmpty) {
      print('firstname $firstname');
      return 'Firstname is required';
    }

    return null;
  }

  static validateSurname(String? surname) {
    if (surname == null || surname.isEmpty) {
      print('surname $surname');
      return 'Surname is required';
    }
    return null;
  }
}
