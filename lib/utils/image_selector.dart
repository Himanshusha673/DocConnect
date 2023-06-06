import 'package:image_picker/image_picker.dart';

class ImageSelector {
  Future<XFile?> selectImageFromGallery() async {
    return await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  Future<XFile?> selectImageFromCamera() async {
    return await ImagePicker().pickImage(source: ImageSource.camera);
  }
}
