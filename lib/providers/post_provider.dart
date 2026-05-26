import 'package:flutter/material.dart';
import 'package:pertemuan8/services/post_services.dart';
import '../models/post_model.dart';
import '../services/photo_services.dart';

class PostProvider extends ChangeNotifier {
  List<PostModel> posts = [];
  bool isLoading = false;
  String errorMessage = '';

  Future<void> getPosts() async {
    try {
      isLoading = true;
      notifyListeners();
      posts = await PostService.getPosts();
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
