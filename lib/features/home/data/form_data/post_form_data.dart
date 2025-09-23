import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class PostFormData {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  XFile? imageFile;

  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    imageFile = null;
  }
}
