import 'package:houlala/models/create_order/create_order.dart';
import 'package:houlala/models/order/order_model.dart';
import 'package:http/http.dart';

abstract class OrderRepositoryInterface {
  Future<Response> addProductToCart(CreateOrder order);

  Future<Response> deleteProductFromCart(String orderNumber, String productSku);

  Future<Response> changeItemQuantity(
      String orderNumber, String productSku, String url);

  Future<List<OrderModel>> fetchUsersOrder();

  Future<OrderModel> addToCart(CreateOrder order);

  Future<Response> confirmOrders(String userId, int paymentMethodId, String sellerEmail);
}
