class User {
  final String id;
  final String fullName;
  final String? username;
  final String email;
  final String? phone;
  final String? phoneCountry;
  final String country;
  final String? avatar;

  User({
    required this.id,
    required this.fullName,
    this.username,
    required this.email,
    this.phone,
    this.phoneCountry,
    required this.country,
    this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      fullName: json['full_name'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      phoneCountry: json['phone_country'],
      country: json['country'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'username': username,
      'email': email,
      'phone': phone,
      'phone_country': phoneCountry,
      'country': country,
      'avatar': avatar,
    };
  }

  @override
  String toString() {
    return 'User(id: $id, fullName: $fullName, username: $username, email: $email, phone: $phone, phoneCountry: $phoneCountry, country: $country, avatar: $avatar)';
  }
}
