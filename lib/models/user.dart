import 'dart:convert';

class User {
  int _userId;
  String _name;
  String _email;
  String _address;
  String _birthday;
  String _genres;
  User(this._userId, this._name, this._email, this._address, this._birthday,
      this._genres);

  int get userId => this._userId;
  String get name => this._name;
  String get email => this._email;
  String get address => this._address;
  String get birthday => this._birthday;
  String get genres => this._genres;
  factory User.fromJson(Map<String, dynamic> json) {
    return User(json['user_id'], json['name'], json['email'], json['address'],
        json['birthday'], json['genres']);
  }
}
