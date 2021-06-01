import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  String firstName;
  String lastName;
  String email;

  UserData({
    this.email,
    this.firstName,
    this.lastName,
  });

  factory UserData.fromDocumentSnapshot(DocumentSnapshot doc) => UserData(
        firstName: doc.data()["FirstName"],
        email: doc.data()["Email"],
        lastName: doc.data()["LastName"],
      );

  Map<String, dynamic> toMap() => {
        "FirstName": firstName,
        "Email": email,
        "LastName": lastName,
      };
}
