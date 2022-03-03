class TransactionSent {
  String tranHash, ammount, toHash;
  TransactionSent(
      {required this.tranHash, required this.toHash, required this.ammount});

  factory TransactionSent.fromJson(Map<String, dynamic> json) {
    return TransactionSent(
        tranHash: json['tranHash'],
        ammount: json['ammount'],
        toHash: json['toHash']);
  }
}

class TransactionRecieved {
  String tranHash, ammount, fromHash;
  TransactionRecieved(
      {required this.tranHash, required this.fromHash, required this.ammount});

  factory TransactionRecieved.fromJson(Map<String, dynamic> json) {
    return TransactionRecieved(
        tranHash: json['tranHash'],
        ammount: json['ammount'],
        fromHash: json['fromHash']);
  }
}
