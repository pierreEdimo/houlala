import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/order/order_model.dart';

part 'order_model.state.freezed.dart';

@freezed
class OrderModelState with _$OrderModelState{
  factory OrderModelState({
    @Default([]) List<OrderModel>  orderList,
    @Default(false) bool loading,
    @Default('') String errorMessage,
    @Default(false) bool error,
    @Default(null) OrderModel? selectedOrder,
}) = _OrderModelState;
}