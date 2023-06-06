import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'upload_report_event.dart';
part 'upload_report_state.dart';

class UploadReportBloc extends Bloc<UploadReportEvent, UploaReportState> {
  UploadReportBloc() : super(const UploaReportState()) {
    // on<SelectImageEvent>((event, emit) => _mapSelectImageEventToState());
    on<SelectUploadDocEvent>((event, emit) => _mapUploadImageByGalleryEventToState);
  }

  Future<void> _mapUploadImageByGalleryEventToState(SelectUploadDocEvent event, Emitter<UploaReportState> emit) async {
    final FilePickerResult? pickedFile = event.repoerDoc;
    final String imageBytes;

    try {
      //imageBytes = await _getImageBytes(File(pickedFile!.path));

      ////make api call here

      emit(state.copyWith(image: event.repoerDoc));
    } catch (e) {
      print(e.toString());
    }
  }
}

Future<String> _getImageBytes(File imageFile) async {
  final bytes = await imageFile.readAsBytes();
  String img = base64Encode(bytes);
  return img;
}
