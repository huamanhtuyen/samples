import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../utils/result.dart';

class ImageRepository {
  final SupabaseClient _supabaseClient = Supabase.instance.client;
  final ImagePicker _picker = ImagePicker();

  Future<Result<String?>> pickAndUploadImage() async {
    // Ensure the client is authenticated
    if (_supabaseClient.auth.currentUser == null) {
      // Handle unauthenticated state, e.g., prompt user to log in
      return Result.error(Exception('You are unauthenticated'));;
    }

    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    final bucketName = 'anhcacloai';
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      // Ensure the file name is valid
      final fileName = file.path.split('/').last.replaceAll(RegExp(r'[^\w\s.-]'), '_').replaceAll(' ', '_');
      try {
        final localBucketPath = await _supabaseClient.storage.from(bucketName).upload(fileName, file);
        if (localBucketPath.isNotEmpty) {
          final imageUrl = _supabaseClient.storage.from(bucketName).getPublicUrl(fileName);         
          return Result.ok(imageUrl);
        } else {
             return Result.error(Exception('Failed to upload image. Please check your network and try again'));
        }
     
      } on Exception catch (e) {
        return Result.error(e);
      }
    }
    return Result.error(Exception('No file picked'));
  }
}
