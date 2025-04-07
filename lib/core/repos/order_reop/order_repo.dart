
import 'package:dartz/dartz.dart';
import 'package:fruit_dashbord/core/erroes/Failur.dart';
import 'package:fruit_dashbord/features/get%20orders/domins/entitys/order%20entity.dart';

abstract class OrderRepo{

  Stream<Either<Failur,List<OrderEntity>>> getOrders();
}