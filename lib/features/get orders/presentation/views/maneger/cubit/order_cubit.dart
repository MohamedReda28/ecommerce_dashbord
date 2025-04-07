import 'package:bloc/bloc.dart';
import 'package:fruit_dashbord/core/repos/order_reop/order_repo.dart';
import 'package:fruit_dashbord/features/get%20orders/domins/entitys/order%20entity.dart';
import 'package:meta/meta.dart';
part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this.orderRepo) : super(OrderInitial());
  final OrderRepo orderRepo;

  Future<void> getOrders() async {
  emit(OrderLoading());
  await for (var result in orderRepo.getOrders()) {
     result.fold(
      (failure) =>emit (OrderFailure(message: failure.message)),
      (orders) => emit (OrderSuccess(orders: orders)),
    );
  }
}
}
