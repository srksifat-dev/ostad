class UpdateCartResponse {
  String? status;
  Data? data;

  UpdateCartResponse({this.status, this.data});

  UpdateCartResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  bool? acknowledged;
  int? modifiedCount;
  dynamic upsertedId;
  int? upsertedCount;
  int? matchedCount;

  Data(
      {this.acknowledged,
        this.modifiedCount,
        this.upsertedId,
        this.upsertedCount,
        this.matchedCount});

  Data.fromJson(Map<String, dynamic> json) {
    acknowledged = json['acknowledged'];
    modifiedCount = json['modifiedCount'];
    upsertedId = json['upsertedId'];
    upsertedCount = json['upsertedCount'];
    matchedCount = json['matchedCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['acknowledged'] = this.acknowledged;
    data['modifiedCount'] = this.modifiedCount;
    data['upsertedId'] = this.upsertedId;
    data['upsertedCount'] = this.upsertedCount;
    data['matchedCount'] = this.matchedCount;
    return data;
  }
}
