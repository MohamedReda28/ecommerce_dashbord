import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruit_dashbord/core/erroes/Failur.dart';

abstract class ImageRepo 
{
    
    Future<Either<Failur,String>> uploadImage(File image);

}