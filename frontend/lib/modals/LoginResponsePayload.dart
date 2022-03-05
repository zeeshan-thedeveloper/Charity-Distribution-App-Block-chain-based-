class LoginResponsePayloadOfUser {
  String blockchainAccountAddress;

  String email, firstName, lastName, userUid, accountCatagory;

  LoginResponsePayloadOfUser(
      {this.blockchainAccountAddress = "",
      this.email = "",
      this.firstName = "",
      this.lastName = "",
      this.userUid = "",
      this.accountCatagory = ""});

  LoginResponsePayloadOfUser.fromJson(Map<String, dynamic> json)
      : blockchainAccountAddress = json['blockchainAccountAddress'],
        email = json['email'],
        firstName = json['firstName'],
        lastName = json['lastName'],
        accountCatagory = json['accountCatagory'],
        userUid = json['userUid'];

  Map<String, dynamic> toJson() => {
        'blockchainAccountAddress': blockchainAccountAddress,
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'userUid': userUid,
        'accountCatagory': accountCatagory
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
