import 'package:flutter/material.dart';
import 'package:fruit_dashbord/features/addProdut/presintatin/view/AddProductView.dart';
import 'package:fruit_dashbord/features/get%20orders/presentation/views/get_orders_view.dart';

import '../../../../core/widget/Custom_Botton.dart';

class Dashbordviewbody extends StatelessWidget {
  const Dashbordviewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomBotton(title: 'Add Data', ontap: () {
            Navigator.pushNamed(context, AddProductView.routName);
          },),
          SizedBox(height: 20),
          CustomBotton(title: 'get orders', ontap: () {
             Navigator.pushNamed(context, GetOrders.routName);
          })

        ],
      ),
    );
  }
}
