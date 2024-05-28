import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houlala/helper/user_token.helper.dart';
import 'package:houlala/models/cart_item/cart_item.dart';
import 'package:houlala/models/create_order/create_order.dart';
import 'package:houlala/models/order/order_model.dart';
import 'package:houlala/repositories/order/order_repository.dart';
import 'package:houlala/services/toster_service.dart';
import 'package:houlala/shared_widgets/my_app.dart';
import 'package:houlala/state/order/order_model.state.dart';
import 'package:http/http.dart';

final orderRepositoryProvider =
    Provider<OrderRepository>((ref) => OrderRepository());

final orderStateNotifierProvider =
    StateNotifierProvider<OrderStateNotifier, OrderModelState>(
        (ref) => OrderStateNotifier(ref.watch(orderRepositoryProvider)));

class OrderStateNotifier extends StateNotifier<OrderModelState> {
  final OrderRepository orderRepository;

  OrderStateNotifier(this.orderRepository) : super(OrderModelState()) {
    fetchUsersOrders();
  }

  Future<void> addProductToCarts(CreateOrder order,
      {SimpleLocation? location}) async {
    try {
      OrderModel result = await orderRepository.addToCart(order);
      bool existing = false;
      for (var element in _unConfirmedOrders) {
        if (element.orderNumber == result.orderNumber) {
          existing = true;
        }
      }

      if (existing == false) {
        state = state.copyWith(orderList: [...state.orderList, result]);
      } else {
        List<OrderModel> updatedOrderList = [
          for (OrderModel existingOrder in List.from(_unConfirmedOrders))
            if (existingOrder.orderNumber == result.orderNumber)
              existingOrder.copyWith(
                  items: result.items,
                  totalPrice: result.totalPrice,
                  totalQuantityOfItems: result.totalQuantityOfItems)
            else
              existingOrder
        ];

        state = state.copyWith(orderList: updatedOrderList);
      }
      ToasterService.openToasterOnSuccess(
          "Le produit a ete ajoute dans votre panier avec succes");
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      state = state.copyWith(
          error: true,
          errorMessage: "impossible d'ajouter le produit dans le panier.");
    }
  }

  Future<void> decreaseItemQuantity(
      String orderNumber, String productSku) async {
    try {
      Response response = await orderRepository.changeItemQuantity(
          orderNumber, productSku, 'decrease');

      List<OrderModel> updatedList = [];

      if (response.statusCode == HttpStatus.noContent) {
        OrderModel existingOrder = getExistingOrder(orderNumber);

        var items = [
          for (CartItem element in List.from(existingOrder.items!))
            if (element.productSku == productSku)
              element.copyWith(
                  quantity: element.quantity! - 1,
                  price: element.price! - element.initialPrice!)
            else
              element
        ];

        updatedList = [
          for (OrderModel orderModel in List.from(_unConfirmedOrders))
            if (orderModel.orderNumber == existingOrder.orderNumber)
              orderModel.copyWith(
                  items: items,
                  totalPrice: _calcaluteTotalPrice(items),
                  totalQuantityOfItems: _calculateTotalQuantity(items))
            else
              orderModel
        ];

        state = state.copyWith(orderList: updatedList);
      }
    } catch (e) {
      state = state.copyWith(
          error: true,
          errorMessage: "impossible d'ajouter le produit dans le panier.");
    }
  }

  Future<void> increaseItemQuantity(
      String orderNumber, String productSku) async {
    try {
      Response response = await orderRepository.changeItemQuantity(
          orderNumber, productSku, 'increase');

      if (response.statusCode == HttpStatus.noContent) {
        OrderModel existingOrder = getExistingOrder(orderNumber);

        var items = [
          for (CartItem element in List.from(existingOrder.items!))
            if (element.productSku == productSku)
              element.copyWith(
                  quantity: element.quantity! + 1,
                  price: element.price! + element.initialPrice!)
            else
              element
        ];

        var updatedList = [
          for (OrderModel ordermodel in List.from(_unConfirmedOrders))
            if (ordermodel.orderNumber == existingOrder.orderNumber)
              ordermodel.copyWith(
                  items: items,
                  totalPrice: _calcaluteTotalPrice(items),
                  totalQuantityOfItems: _calculateTotalQuantity(items))
            else
              ordermodel
        ];

        state = state.copyWith(orderList: updatedList);
      }
    } catch (e) {
      state = state.copyWith(
          error: true,
          loading: false,
          errorMessage: "impossible d'ajouter le produit dans le panier.");
    }
  }

  Future<void> confirmOrders(String userId, String sellerEmail) async {
    try {
      Response response =
          await orderRepository.confirmOrders(userId, 1, sellerEmail);

      if (response.statusCode == HttpStatus.noContent) {
        var updatedLists = [
          for (OrderModel orderModel in List.from(_unConfirmedOrders))
            orderModel.copyWith(confirmed: true)
        ];
        state = state.copyWith(orderList: updatedLists);
        navigatorKey.currentState!.pushReplacementNamed('/successful');
      }
    } catch (e) {
      state = state.copyWith(
          error: true,
          loading: false,
          errorMessage: "impossible d'ajouter le produit dans le panier.");
      rethrow;
    }
  }

  Future<void> deleteProductFromCart(
      String orderNumber, String productSku) async {
    try {
      Response response =
          await orderRepository.deleteProductFromCart(orderNumber, productSku);

      List<OrderModel> updatedOrderList = [];

      if (response.statusCode == HttpStatus.noContent) {
        OrderModel existingOrder = getExistingOrder(orderNumber);

        var items = [
          for (CartItem element in List.from(existingOrder.items!))
            if (element.productSku != productSku) element
        ];

        if (items.length > 1) {
          updatedOrderList = [
            for (OrderModel orderModel in List.from(_unConfirmedOrders))
              if (orderModel.orderNumber == existingOrder.orderNumber)
                orderModel.copyWith(
                    items: items,
                    totalPrice: _calcaluteTotalPrice(items),
                    totalQuantityOfItems: _calculateTotalQuantity(items))
              else
                orderModel
          ];
        } else {
          updatedOrderList = [
            for (OrderModel orderModel in List.from(_unConfirmedOrders))
              if (orderModel.orderNumber != existingOrder.orderNumber)
                orderModel
          ];
        }
        state = state.copyWith(orderList: updatedOrderList);
      }
    } catch (e) {
      state = state.copyWith(
          error: true,
          errorMessage: "impossible d'ajouter le produit dans le panier.");
    }
  }

  Future<void> fetchUsersOrders() async {
    try {
      List<OrderModel> orders = [];
      state = state.copyWith(loading: true);
      if (UserTokenHelper.getUserToken() != null) {
        orders = await orderRepository.fetchUsersOrder();
      }
      state = state.copyWith(loading: false, orderList: orders);
    } catch (e) {
      state = state.copyWith(
          error: true,
          errorMessage: "impossible d'ajouter le produit dans le panier.");
    }
  }

  OrderModel getExistingOrder(String orderNumber) {
    return List.from(_unConfirmedOrders)
        .where((element) => element.orderNumber == orderNumber)
        .first;
  }

  List<OrderModel> get _unConfirmedOrders {
    return List.from(
      state.orderList.where((element) => element.confirmed == false),
    );
  }

  int _calcaluteTotalPrice(List<CartItem> items) {
    int totalPrice = 0;
    for (var item in items) {
      totalPrice += item.price!;
    }
    return totalPrice;
  }

  int _calculateTotalQuantity(List<CartItem> items) {
    int totalQuantity = 0;
    for (var item in items) {
      totalQuantity += item.quantity!;
    }
    return totalQuantity;
  }
}
