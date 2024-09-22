import 'package:ostad/domain/entities/cart_entity.dart';

class GetCartResponse {
  String? status;
  List<CartModel>? data;

  GetCartResponse({this.status, this.data});

  GetCartResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <CartModel>[];
      json['data'].forEach((v) {
        data!.add(CartModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartModel extends CartEntity {
  CartModel({
    String? sId,
    required super.productName,
    required super.productCode,
    required String? img,
    required super.unitPrice,
    required String? qty,
    required super.totalPrice,
    super.createdDate,
  }) : super(
          cartID: sId,
          imgUrl: img,
          quantity: qty,
        );

  CartModel.fromJson(Map<String, dynamic> json) {
    cartID = json['_id'];
    productName = json['ProductName'];
    productCode = json['ProductCode'];
    imgUrl = json['Img'];
    unitPrice = json['UnitPrice'];
    quantity = json['Qty'];
    totalPrice = json['TotalPrice'];
    createdDate = json['CreatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = cartID;
    data['ProductName'] = productName;
    data['ProductCode'] = productCode;
    data['Img'] = imgUrl;
    data['UnitPrice'] = unitPrice;
    data['Qty'] = quantity;
    data['TotalPrice'] = totalPrice;
    data['CreatedDate'] = createdDate;
    return data;
  }
}
