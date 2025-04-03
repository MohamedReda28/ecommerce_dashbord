import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:fruit_dashbord/core/erroes/Failur.dart';
import 'package:fruit_dashbord/features/addProdut/domains/entitys/ProductEntity.dart';

abstract class ProductRepo {

  Future<Either<Failur,void>> addProduct(ProductEntity product);
}