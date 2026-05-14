import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/photo_model.dart';

class PhotoService {
  static Future<List<PhotoModel>> getPhotos() async {
    final response = await http.get(Uri.parse('https://picsum.photos/v2/list?page=2&limit=10'));
    
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((photo) => PhotoModel.fromJson(photo)).toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }
}
