class RecievedResponse {
  var responsePayload;
  String responseMessage;
  var responseCode;
  RecievedResponse(
      {required this.responsePayload,
      required this.responseCode,
      required this.responseMessage});

  factory RecievedResponse.fromJson(Map<String, dynamic> json) {
    return RecievedResponse(
        responsePayload: json['responsePayload'],
        responseMessage: json['responseMessage'],
        responseCode: json['responseCode']);
  }
}
