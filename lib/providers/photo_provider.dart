import 'package:flutter/material.dart';
import 'package:pertemuan8/services/photo_services.dart';
import '../models/photo_model.dart';

class PhotoProvider extends ChangeNotifier {
  List<PhotoModel> photos = [];
  bool isLoading = false;
  String errorMessage = '';

  Future<void> getPhotos() async {
    try {
      isLoading = true;
      notifyListeners();
      photos = await PhotoService.getPhotos();
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
