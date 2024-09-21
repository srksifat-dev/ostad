import "package:dio/dio.dart";
import 'package:ostad/core/constants/strings.dart';
import 'package:ostad/data/models/cart_response.dart';
import 'package:retrofit/retrofit.dart';

part 'cart_datasource.g.dart';

@RestApi(baseUrl: cartBaseUrl)
abstract class CartDataSource{
  factory CartDataSource(Dio dio) = _CartDataSource;
  
  @GET("/${getAllCartProducts}")
  Future<HttpResponse<List<CartModel>>> getCarts();
}