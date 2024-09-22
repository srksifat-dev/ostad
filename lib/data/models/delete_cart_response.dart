class DeleteCartResponse {
  String? status;
  Data? data;

  DeleteCartResponse({this.status, this.data});

  DeleteCartResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  bool? acknowledged;
  int? deletedCount;

  Data({this.acknowledged, this.deletedCount});

  Data.fromJson(Map<String, dynamic> json) {
    acknowledged = json['acknowledged'];
    deletedCount = json['deletedCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['acknowledged'] = acknowledged;
    data['deletedCount'] = deletedCount;
    return data;
  }
}
