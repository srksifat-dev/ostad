class AddToCartResponse {
  String? status;
  Data? data;

  AddToCartResponse({this.status, this.data});

  AddToCartResponse.fromJson(Map<String, dynamic> json) {
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
  String? productName;
  String? productCode;
  String? img;
  String? unitPrice;
  String? qty;
  String? totalPrice;
  String? createdDate;
  String? sId;

  Data(
      {this.productName,
        this.productCode,
        this.img,
        this.unitPrice,
        this.qty,
        this.totalPrice,
        this.createdDate,
        this.sId});

  Data.fromJson(Map<String, dynamic> json) {
    productName = json['ProductName'];
    productCode = json['ProductCode'];
    img = json['Img'];
    unitPrice = json['UnitPrice'];
    qty = json['Qty'];
    totalPrice = json['TotalPrice'];
    createdDate = json['CreatedDate'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ProductName'] = productName;
    data['ProductCode'] = productCode;
    data['Img'] = img;
    data['UnitPrice'] = unitPrice;
    data['Qty'] = qty;
    data['TotalPrice'] = totalPrice;
    data['CreatedDate'] = createdDate;
    data['_id'] = sId;
    return data;
  }
}
