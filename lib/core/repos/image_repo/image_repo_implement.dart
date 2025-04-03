import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:fruit_dashbord/core/erroes/Failur.dart';
import 'package:fruit_dashbord/core/repos/image_repo/image_repo.dart';
import 'package:fruit_dashbord/core/services/storge_service.dart';
import 'package:fruit_dashbord/core/uitels/backend%20Impoint.dart';

class ImageRepoImplement implements ImageRepo{
  final StorgeService storgeService;

  ImageRepoImplement( this.storgeService);
  
  @override
  Future<Either<Failur, String>> uploadImage(File image) async{
    try {
      String url = await storgeService.UploadFile(image, BackEndImpoint.images);
      return right(url);
    }  catch (e) {
         return left(ServerFailure('Failed to uploade image'));
    }
  }
}