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
        data!.add(new CartModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartModel extends CartEntity {
  CartModel({
    String? sId,
    required String? productName,
    required String? productCode,
    required String? img,
    required String? unitPrice,
    required String? qty,
    required String? totalPrice,
    String? createdDate,
  }) : super(
          cartID: sId,
          productName: productName,
          productCode: productCode,
          imgUrl: img,
          unitPrice: unitPrice,
          quantity: qty,
          totalPrice: totalPrice,
          createdDate: createdDate,
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.cartID;
    data['ProductName'] = this.productName;
    data['ProductCode'] = this.productCode;
    data['Img'] = this.imgUrl;
    data['UnitPrice'] = this.unitPrice;
    data['Qty'] = this.quantity;
    data['TotalPrice'] = this.totalPrice;
    data['CreatedDate'] = this.createdDate;
    return data;
  }
}
