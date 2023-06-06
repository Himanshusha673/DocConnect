import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
part 'upload_profile_pic_event.dart';
part 'upload_profile_pic_state.dart';

class UploadProfilePicBloc
    extends Bloc<UploadProfilePicEvent, UploadProfilePicState> {
  UploadProfilePicBloc() : super(const UploadProfilePicState()) {
    on<onSelectProfileImageEvent>((_onSelectMultipleImages));
    on<onUnSelectProfileImageEvent>((_onUnSelectMultipleImages));
  }
  Future<void> _onSelectMultipleImages(onSelectProfileImageEvent event,
      Emitter<UploadProfilePicState> emit) async {
    emit(state.copyWith(image: event.profileImage));
  }

  Future<void> _onUnSelectMultipleImages(onUnSelectProfileImageEvent event,
      Emitter<UploadProfilePicState> emit) async {
    emit(state.copyWith(image: null));
  }
}
