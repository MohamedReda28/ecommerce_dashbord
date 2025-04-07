import 'package:dartz/dartz.dart';
import 'package:fruit_dashbord/core/erroes/Failur.dart';
import 'package:fruit_dashbord/core/repos/order_reop/order_repo.dart';
import 'package:fruit_dashbord/core/services/DataBase_Serveces.dart';
import 'package:fruit_dashbord/core/uitels/backend%20Impoint.dart';
import 'package:fruit_dashbord/features/get%20orders/data/models/order%20model.dart';
import 'package:fruit_dashbord/features/get%20orders/domins/entitys/order%20entity.dart';

class OrderRepoImplment implements OrderRepo{
  final DataBaseServeces dataBaseServeces;

  OrderRepoImplment(this.dataBaseServeces);
  @override
 Stream<Either<Failur, List<OrderEntity>>> getOrders() async* {
  try {
    await for (var (data as List<Map<String,dynamic>>) in dataBaseServeces.getDataStream(path: BackEndImpoint.getOedersData)) {
    
     //dataBaseServeces.getDataStream(path: BackEndImpoint.getOedersData) as List<Map<String, dynamic>>;
    List<OrderModel> orderModel = data.map((e) => OrderModel.fromJson(e)).toList();
    List<OrderEntity> ordersEntit = orderModel.map((e) => e.toEntity()).toList();
    yield right(ordersEntit);

    }

     
  } catch (e) {
    yield left(ServerFailure(e.toString()));
  }
}

}