part of 'upload_profile_pic_bloc.dart';

abstract class UploadProfilePicEvent {}

class onSelectProfileImageEvent extends UploadProfilePicEvent {
  final XFile? profileImage;

  onSelectProfileImageEvent({this.profileImage});
}

class onUnSelectProfileImageEvent extends UploadProfilePicEvent {}
