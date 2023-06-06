import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:doc_connect/modules/Profile/bloc/upload_profile_pic_bloc/upload_profile_pic_bloc.dart';

import '../../../utils/constants/color_konstants.dart';
import '../../../utils/enums.dart';
import '../../../utils/image_selector.dart';

class ImageSelectorTileWidget extends StatelessWidget {
  ImageSelectorType type;
  UploadProfilePicBloc uploadProfilePicBloc;
  ImageSelectorTileWidget(
      {Key? key, required this.type, required this.uploadProfilePicBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        final image = type == ImageSelectorType.gallery
            ? await ImageSelector().selectImageFromGallery()
            : await ImageSelector().selectImageFromCamera();
        if (image != null) {
          CroppedFile? croppedFile = await ImageCropper().cropImage(
            sourcePath: image.path,
            aspectRatioPresets: [
              CropAspectRatioPreset.square,
            ],
            uiSettings: [
              AndroidUiSettings(
                  toolbarTitle: '',
                  toolbarColor: ColorKonstants.primaryColor,
                  toolbarWidgetColor: Colors.white,
                  initAspectRatio: CropAspectRatioPreset.original,
                  lockAspectRatio: false),
              IOSUiSettings(
                title: '',
              ),
            ],
          );
          uploadProfilePicBloc.add(onSelectProfileImageEvent(
              profileImage: XFile(croppedFile!.path)));
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        }
      },
      leading: Icon(
        type == ImageSelectorType.gallery ? Icons.image : Icons.camera_alt,
        color: Colors.blue,
      ),
      title: Text(type == ImageSelectorType.gallery ? 'Gallery' : 'Camera'),
    );
  }
}
