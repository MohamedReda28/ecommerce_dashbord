import 'package:bloc/bloc.dart';
import 'package:fruit_dashbord/core/repos/image_repo/image_repo.dart';
import 'package:fruit_dashbord/core/repos/product_repo/product_repo.dart';
import 'package:fruit_dashbord/features/addProdut/domains/entitys/ProductEntity.dart';
import 'package:meta/meta.dart';
part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imageRepo, this.productRepo)
      : super(AddProductInitial());

  final ImageRepo imageRepo;
  final ProductRepo productRepo;
  Future<void> addProduct(ProductEntity product) async {
    emit(AddProductLoading());
    var result = await imageRepo.uploadImage(product.image);
    result.fold(
      (f) {
        emit(AddProductFailur(f.toString()));
      },
      (url) async {
        product.imageUrl = url;
        var result = await productRepo.addProduct(product);
        result.fold(
          (f) {
            emit(AddProductFailur(f.toString()));
          },
          (r) {
            emit(AddProductSuccess());
          },
        );
      },
    );
  }
}
