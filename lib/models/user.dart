class UserModel {

  final String userID;
  final String fullName;
  final String email;

  UserModel({
    this.userID,
    this.fullName,
    this.email
  });

  UserModel.fromJson(Map<String, dynamic> data):
      userID = data['userID'],
      fullName = data['fullName'],
      email = data['email'];

  Map<String, dynamic> toJson(){
    return {
      'userID': userID,
      'fullName': fullName,
      'email': email
    };
  }

}