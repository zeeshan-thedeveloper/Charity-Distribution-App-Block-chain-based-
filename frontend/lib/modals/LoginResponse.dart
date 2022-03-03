class LoginResponse {
  var responsePayload;
  String responseMessage;
  int responseCode;
  LoginResponse(
      {required this.responsePayload,
      required this.responseCode,
      required this.responseMessage});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        responsePayload: json['responsePayload'],
        responseMessage: json['responseMessage'],
        responseCode: json['responseCode']);
  }
}

class LoginResponsePayloadOfUser {
  String blockchainAccountAddress;

  String email, firstName, lastName, userUid;

  LoginResponsePayloadOfUser(
      {this.blockchainAccountAddress = "",
      this.email = "",
      this.firstName = "",
      this.lastName = "",
      this.userUid = ""});

  LoginResponsePayloadOfUser.fromJson(Map<String, dynamic> json)
      : blockchainAccountAddress = json['blockchainAccountAddress'],
        email = json['email'],
        firstName = json['firstName'],
        lastName = json['lastName'],
        userUid = json['userUid'];

  Map<String, dynamic> toJson() => {
        'blockchainAccountAddress': blockchainAccountAddress,
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'userUid': userUid
      };
}

class LoginResponsePayloadOfOrganization {
  String blockchainAccountAddress;

  String email, description, title, userUid;

  LoginResponsePayloadOfOrganization(
      {this.blockchainAccountAddress = "",
      this.email = "",
      this.description = "",
      this.title = "",
      this.userUid = ""});

  LoginResponsePayloadOfOrganization.fromJson(Map<String, dynamic> json)
      : blockchainAccountAddress = json['blockchainAccountAddress'],
        email = json['email'],
        description = json['description'],
        title = json['title'],
        userUid = json['userUid'];

  Map<String, dynamic> toJson() => {
        'blockchainAccountAddress': blockchainAccountAddress,
        'email': email,
        'description': description,
        'title': title,
        'userUid': userUid
      };
}
