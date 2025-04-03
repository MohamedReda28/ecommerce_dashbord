import 'package:flutter/material.dart';
import 'package:fruit_dashbord/features/get%20orders/presentation/views/get_orders_view.dart';

import '../../features/addProdut/presintatin/view/AddProductView.dart';
import '../../features/dashord/views/dashbrd view.dart';



Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DashBordView.routName:
      return MaterialPageRoute(builder: (context) => const DashBordView());
    case AddProductView.routName:
      return MaterialPageRoute(builder: (context) => const AddProductView());
    case GetOrders.routName:
      return MaterialPageRoute(builder: (context) => const GetOrders ());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
