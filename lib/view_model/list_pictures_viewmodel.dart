import 'dart:ui';

import 'package:tuto_mvvm/models/picsum_model.dart';
import 'package:tuto_mvvm/services/services.dart';

class ListPicturesViewModel {
  List<PicturesViewModel>? pictures;
  Future<void> fetchPictures() async{
    final apiResult = await Services().fetchPictureAPI();
    this.pictures = apiResult.map((e)=> PicturesViewModel(e)).toList();
  
  }

}

class PicturesViewModel {
  final PicsumModel? picsumModel;
  PicturesViewModel(this.picsumModel);

}