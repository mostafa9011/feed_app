import 'dart:io';
import 'package:dio/dio.dart';

import '../utils/functions/kprint.dart';

class CloudinaryService {
  static const String cloudName = "dx5wqosea";
  static const String uploadPreset = "unsigned_preset";

  static Future<String?> uploadImage(File imageFile) async {
    try {
      final dio = Dio();

      final url = "https://api.cloudinary.com/v1_1/$cloudName/image/upload";

      final formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(imageFile.path),
        "upload_preset": uploadPreset,
      });

      final response = await dio.post(url, data: formData);

      if (response.statusCode == 200) {
        final imageUrl = response.data["secure_url"];
        kprint("Image uploaded successfully: $imageUrl");
        return imageUrl; // url of the uploaded image
      } else {
        kprint("Upload failed: ${response.statusMessage}");
        return null;
      }
    } catch (e) {
      kprint("Error uploading to Cloudinary: $e");
      return null;
    }
  }
}
