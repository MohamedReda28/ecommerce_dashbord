
import 'package:dartz/dartz.dart';
import 'package:fruit_dashbord/core/erroes/Failur.dart';
import 'package:fruit_dashbord/core/repos/product_repo/product_repo.dart';
import 'package:fruit_dashbord/core/services/DataBase_Serveces.dart';
import 'package:fruit_dashbord/core/uitels/backend%20Impoint.dart';
import 'package:fruit_dashbord/features/addProdut/data/productModel.dart';
import 'package:fruit_dashbord/features/addProdut/domains/entitys/ProductEntity.dart';

class ProductRepoImplement implements ProductRepo {
  final DataBaseServeces dataBaseServeces;

  ProductRepoImplement(this.dataBaseServeces);
  @override
  Future<Either<Failur, void>> addProduct(ProductEntity addProductInputEntity) async {
    try {
     await dataBaseServeces.addData(
      path: BackEndImpoint.addProduct,
      data: ProductModel.fromEntity(addProductInputEntity).toMap());
      return const Right(null);
    }  catch (e) {
      return Left(ServerFailure('Failed to add product'));
    }
  }
}
