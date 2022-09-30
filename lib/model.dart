class Model {
  String name;
  String email;
  String password;
  String dob;
  int mobile;

  Model(
      {required this.name,
      required this.email,
      required this.password,
      required this.dob,
      required this.mobile});

  factory Model.fromJson(Map<String, dynamic> map) {
    return Model(
        name: map['name'],
        email: map['email'],
        password: map['password'],
        dob: map['dob'],
        mobile: map['dob']);
  }

  Map<String, dynamic> tomap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'dob': dob,
      'mobile': mobile
    };
  }
}
