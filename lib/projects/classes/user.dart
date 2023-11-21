import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mukuru_app/app_constants.dart';

class User {
  User(
      {required String id,
      required String firstname,
      required String surname,
      required double balance,
      required String nationality,
      required String email,
      required String phoneNumber})
      : _id = id,
        _firstname = firstname,
        _surname = surname,
        _balance = balance,
        _nationality = nationality,
        _email = email,
        _phoneNumber = phoneNumber;

  factory User.fromJson(Map<String, dynamic> json) {
    final jsonid = json['_id'] as String;
    final jsonFirstname = json['firstname'] as String;
    final jsonSurname = json['surname'] as String;
    final jsonBalance = json['balance'] as double;
    final jsonNationality = json['nationality'] as String;
    final jsonEmail = json['email'] as String;
    final jsonPhoneNumber = json['phoneNumber'] as String;
    return User(
        id: jsonid,
        firstname: jsonFirstname,
        surname: jsonSurname,
        balance: jsonBalance,
        nationality: jsonNationality,
        email: jsonEmail,
        phoneNumber: jsonPhoneNumber);
  }

  User.placeholderUser()
      : this(
            id: '0',
            firstname: 'place',
            surname: 'holder',
            balance: 0,
            nationality: 'anonymous',
            email: 'email',
            phoneNumber: '0');

  String _id;
  String _firstname;
  String _surname;
  double _balance;
  String _nationality;
  String _email;
  String _phoneNumber;

  // getters

  String get id => _id;
  String get email => _email;
  double get balance => _balance;
  String get firstname => _firstname;
  String get surname => _surname;
  String get nationality => _nationality;
  String get phoneNumber => _phoneNumber;

  // setters

  set balance(double newBalance) => _balance = newBalance;

  // methods

  Future<String> updateUser(String id, String email, String phoneNumber,
      String firstname, String surname, Function setLoading) async {
    final payload = jsonEncode({
      "id": id,
      "email": email,
      "phoneNumber": phoneNumber,
      "firstname": firstname,
      "surname": surname
    });

    try {
      final responseJson = await http.put(
          Uri.parse(MyAppConstants.apiUrl + '/api/users/update-user'),
          headers: MyAppConstants.headers,
          body: payload);

      if (responseJson.statusCode == 200) {
        _email = email;
        _phoneNumber = phoneNumber;
        _firstname = firstname;
        _surname = surname;
        return 'user updated';
      } else {
        return 'Internal server error,try again';
      }
    } catch (e) {
      return 'An unexpected error occured,please try again';
    }
  }
}
