class TransactionModel {
  int? amount;
  String? note;
  DateTime? createdAt;
  String? type;

  TransactionModel({this.amount, this.note, this.createdAt, this.type});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    note = json['note'];
    createdAt = json['createdAt'];
    type = json['type'];
  }
  addAmount(int amount) {
    this.amount = (this.amount! + amount);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['note'] = this.note;
    data['createdAt'] = this.createdAt;
    data['type'] = this.type;
    return data;
  }
}
