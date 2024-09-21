

import '../../domain/entities/cart_entity.dart';

class CartResponse{
  String? status;
  List<CartModel>? carts;

  CartResponse({this.status,this.carts,});

  CartResponse.fromJson(Map<String,dynamic> json){
    status = json["status"];
    if(json["data"] != null){
      carts = <CartModel>[];
      json["data"].forEach((d){
        carts!.add(CartModel.fromJson(d));
      });
    }
  }
}


class CartModel extends CartEntity {
  String? cartID;
  String? productName;
  String? productCode;
  String? imgUrl;
  String? unitPrice;
  String? quantity;
  String? totalPrice;
  String? createdDate;

  CartModel({
    this.cartID,
    this.productName,
    this.productCode,
    this.imgUrl,
    this.unitPrice,
    this.quantity,
    this.totalPrice,
    this.createdDate,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CartModel &&
          runtimeType == other.runtimeType &&
          cartID == other.cartID &&
          productName == other.productName &&
          productCode == other.productCode &&
          imgUrl == other.imgUrl &&
          unitPrice == other.unitPrice &&
          quantity == other.quantity &&
          totalPrice == other.totalPrice &&
          createdDate == other.createdDate);

  @override
  int get hashCode =>
      cartID.hashCode ^
      productName.hashCode ^
      productCode.hashCode ^
      imgUrl.hashCode ^
      unitPrice.hashCode ^
      quantity.hashCode ^
      totalPrice.hashCode ^
      createdDate.hashCode;

  CartModel copyWith({
    String? cartID,
    String? productName,
    String? productCode,
    String? imgUrl,
    String? unitPrice,
    String? quantity,
    String? totalPrice,
    String? createdDate,
  }) {
    return CartModel(
      cartID: cartID ?? this.cartID,
      productName: productName ?? this.productName,
      productCode: productCode ?? this.productCode,
      imgUrl: imgUrl ?? this.imgUrl,
      unitPrice: unitPrice ?? this.unitPrice,
      quantity: quantity ?? this.quantity,
      totalPrice: totalPrice ?? this.totalPrice,
      createdDate: createdDate ?? this.createdDate,
    );
  }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'cartID': this.cartID,
  //     'productName': this.productName,
  //     'productCode': this.productCode,
  //     'imgUrl': this.imgUrl,
  //     'unitPrice': this.unitPrice,
  //     'quantity': this.quantity,
  //     'totalPrice': this.totalPrice,
  //     'createdDate': this.createdDate,
  //   };
  // }

  factory CartModel.fromJson(Map<String, dynamic> map) {
    return CartModel(
      cartID: map['_id'] ?? "",
      productName: map['ProductName'] ?? "",
      productCode: map['ProductCode'] ?? "",
      imgUrl: map['Img'] ?? "",
      unitPrice: map['UnitPrice'] ?? "",
      quantity: map['Qty'] ?? "",
      totalPrice: map['TotalPrice'] ?? "",
      createdDate: map['CreatedDate'] ?? "",
    );
  }

  CartEntity toEntity(){
    return CartEntity(
      cartID: cartID,
      productName: productName,
      productCode: productCode,
      imgUrl: imgUrl,
      unitPrice: unitPrice,
      quantity: quantity,
      totalPrice: totalPrice,
      createdDate: createdDate,
    );
  }

}
