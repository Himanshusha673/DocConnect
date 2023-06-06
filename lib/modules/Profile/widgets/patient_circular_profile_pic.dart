import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jatya_patient_mobile/modules/Profile/bloc/upload_profile_pic_bloc/upload_profile_pic_bloc.dart';
import 'package:jatya_patient_mobile/modules/Profile/widgets/image_selector_tile_widget.dart';

import '../../../utils/constants/color_konstants.dart';
import '../../../utils/constants/image_konstants.dart';
import '../../../utils/enums.dart';

class PatientCircularProfilePic extends StatelessWidget {
  const PatientCircularProfilePic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final uploadProfilePicBloc = BlocProvider.of<UploadProfilePicBloc>(context);

    return BlocBuilder<UploadProfilePicBloc, UploadProfilePicState>(
        builder: (context, state) {
      return InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (dialogContext) {
                  return Dialog(
                    child: Container(
                      width: size.width * 0.8,
                      height: size.width * 0.8,
                      color: ColorKonstants.primarySwatch.shade500,
                      child: Stack(
                        children: [
                          Center(
                              child: state.profileImage == null
                                  ? CircleAvatar(
                                radius: 30,
                                //backgroundColor: Colors.grey,
                                backgroundImage: const AssetImage(ImagesConstants.profileimage),
                                backgroundColor: Colors.transparent,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 4.0,
                                    ),
                                  ),
                                ),
                                // child: Padding(
                                //   padding: EdgeInsets.all(8.0),
                                //   child: Icon(
                                //     Icons.camera_enhance,
                                //     color: Colors.white,
                                //     size: 35,
                                //   ),
                                // ),
                              )
                                  : Image.file(File(state.profileImage!.path))),
                          Positioned(
                              right: 10,
                              top: 10,
                              child: InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (bottomSheetContext) {
                                          return SizedBox(
                                            height: size.height * .3,
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 50,
                                                  width: size.width,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  color: ColorKonstants
                                                      .primaryColor,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20),
                                                  child: const Text(
                                                    "Change profile picture",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18),
                                                  ),
                                                ),
                                                Wrap(
                                                  children: [
                                                    ImageSelectorTileWidget(
                                                      type: ImageSelectorType
                                                          .gallery,
                                                      uploadProfilePicBloc:
                                                          uploadProfilePicBloc,
                                                    ),
                                                    ImageSelectorTileWidget(
                                                      type: ImageSelectorType
                                                          .camera,
                                                      uploadProfilePicBloc:
                                                          uploadProfilePicBloc,
                                                    ),
                                                    ListTile(
                                                      onTap: () async {
                                                        uploadProfilePicBloc.add(
                                                            onSelectProfileImageEvent(
                                                                profileImage:
                                                                    null));
                                                        Navigator.of(context)
                                                            .pop();
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      leading: Icon(
                                                        Icons.delete,
                                                        color: ColorKonstants
                                                            .errorColor,
                                                      ),
                                                      title: const Text(
                                                          'Delete profile picture'),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                  child: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ))),
                        ],
                      ),
                    ),
                  );
                });
          },
          child: CircleAvatar(
            backgroundImage: state.profileImage != null
                ? FileImage(File(state.profileImage!.path))
                : null,
            child: state.profileImage != null
                ? null
                : CircleAvatar(
              radius: 30,
              //backgroundColor: Colors.grey,
              backgroundImage: const AssetImage(ImagesConstants.profileimage),
              backgroundColor: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 4.0,
                  ),
                ),
              ),
              // child: Padding(
              //   padding: EdgeInsets.all(8.0),
              //   child: Icon(
              //     Icons.camera_enhance,
              //     color: Colors.white,
              //     size: 35,
              //   ),
              // ),
            ),
          ));
    });
  }
}
