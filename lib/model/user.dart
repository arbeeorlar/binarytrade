



class User{

String id ;
String firstName;
String lastName;
String  email;
String gender;
String dateOfBirth;
String phoneNumber;

User({this.id,this.firstName,this.lastName,this.email,this.phoneNumber,this.gender,this.dateOfBirth});

factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      dateOfBirth: json['date_of_birth'],
      phoneNumber: json['phone_no'],
    );
  }

  Map<String, dynamic> toJson2() =>
    {
      'first_name': this.firstName,
      'last_name': this.lastName,
       'email': this.email,
      'date_of_birth': this.dateOfBirth,
       'phone_no': this.phoneNumber,
      'gender': this.gender,
    };

}

