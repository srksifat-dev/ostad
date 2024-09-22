import "package:dio/dio.dart";
import 'package:ostad/core/constants/strings.dart';
import 'package:ostad/data/models/delete_cart_response.dart';
import 'package:ostad/data/models/get_cart_response.dart';
import 'package:ostad/data/models/update_cart_response.dart';
import 'package:retrofit/retrofit.dart';

part 'cart_datasource.g.dart';

@RestApi(baseUrl: cartBaseUrl)
abstract class CartDataSource{
  factory CartDataSource(Dio dio) = _CartDataSource;

  @POST(addCartProduct)
  Future<dynamic>addProduct({
    @Field("Img") required String img,
    @Field("ProductCode") required String productCode,
    @Field("ProductName") required String productName,
    @Field("Qty") required String qty,
    @Field("TotalPrice") required String totalPrice,
    @Field("UnitPrice") required String unitPrice,
});

  @GET(getAllCartProducts)
  Future<HttpResponse<List<CartModel>>> getCarts();
  
  @POST("$updateCartProduct/{id}")
  Future<UpdateCartResponse>updateProduct({
    @Path("id") required String id,
    @Field("Img") required String img,
    @Field("ProductCode") required String productCode,
    @Field("ProductName") required String productName,
    @Field("Qty") required String qty,
    @Field("TotalPrice") required String totalPrice,
    @Field("UnitPrice") required String unitPrice,
});

  @GET("$deleteCartProducts/{id}")
  Future<DeleteCartResponse> deleteProduct({@Path("id") required String id});
}