import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_dashbord/core/helpes_function/BuildSnakBar.dart';
import 'package:fruit_dashbord/core/repos/image_repo/image_repo.dart';
import 'package:fruit_dashbord/core/services/git_it_Service.dart';
import 'package:fruit_dashbord/features/addProdut/presintatin/view/maneger/cubit/add_product_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../core/repos/product_repo/product_repo.dart';
import 'Widget/Add Product ViewB ody.dart';
import '../../../../core/widget/build appbar.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const routName = 'AddProduct';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Add Product'),
      body: BlocProvider(
        create: (context) => AddProductCubit(
          getIt.get<ImageRepo>(),
          getIt.get<ProductRepo>(),
        ),
        child: Builder(builder: (context) {
          return BlocConsumer<AddProductCubit, AddProductState>(
              builder: (BuildContext context, AddProductState state) {
            return ModalProgressHUD(
                inAsyncCall: state is AddProductLoading,
                child: AddProductViewBody());
          }, listener: (BuildContext context, AddProductState state) {
            if (state is AddProductSuccess) {
              return BuildSnakBar(context, 'Add Product Seccessfully');
            }
            if (state is AddProductFailur) {
              return BuildSnakBar(context, state.errorMassage);
            }
          });
        }),
      ),
    );
  }
}
