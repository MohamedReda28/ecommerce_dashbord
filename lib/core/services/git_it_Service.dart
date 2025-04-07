import 'package:dartz/dartz.dart';
import 'package:fruit_dashbord/core/repos/image_repo/image_repo.dart';
import 'package:fruit_dashbord/core/repos/image_repo/image_repo_implement.dart';
import 'package:fruit_dashbord/core/repos/product_repo/product_repo.dart';
import 'package:fruit_dashbord/core/repos/product_repo/product_repo_implement.dart';
import 'package:fruit_dashbord/core/services/DataBase_Serveces.dart';
import 'package:fruit_dashbord/core/services/fireStore_Servece.dart';
import 'package:fruit_dashbord/core/services/storge_service.dart';
import 'package:get_it/get_it.dart';
import '../repos/order_reop/order_repo.dart';
import '../repos/order_reop/order_repo_Imple.dart';
import 'SupabaseStorgeService.dart';

final getIt = GetIt.instance;

void setupGitit() {
  getIt.registerSingleton<StorgeService>(SupabaseStorgeService());
  getIt.registerSingleton<DataBaseServeces>(FirestoerServeces());
  getIt.registerSingleton<ImageRepo>(
      ImageRepoImplement(getIt.get<StorgeService>()));
  getIt.registerSingleton<ProductRepo>(
      ProductRepoImplement(getIt.get<DataBaseServeces>()));
  getIt.registerSingleton<OrderRepo>(
      OrderRepoImplment(getIt.get<DataBaseServeces>()));
}
