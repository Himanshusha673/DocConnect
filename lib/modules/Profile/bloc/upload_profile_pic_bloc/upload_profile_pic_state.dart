part of 'upload_profile_pic_bloc.dart';

class UploadProfilePicState {
  final XFile? profileImage;
  const UploadProfilePicState({this.profileImage});
  UploadProfilePicState copyWith({XFile? image}) {
    return UploadProfilePicState(profileImage: image);
  }
}
