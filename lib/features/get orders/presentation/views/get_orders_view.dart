import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruit_dashbord/features/get%20orders/presentation/views/widgets/getOrdersBody.dart';

class GetOrders extends StatelessWidget {
  const GetOrders({super.key});
static const routName='GetOrders';

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: GetOrdersBody(),
    );
  }
}