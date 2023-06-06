import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doc_connect/modules/Mediline/models/get_appointmens_response.dart';
import 'package:doc_connect/modules/Mediline/services/mediline_repository.dart';

import '../../../NewAppointment/model/get_clinic_detail_response.dart';

part 'mediline_search_event.dart';
part 'mediline_search_state.dart';

class MedilineSearchBloc
    extends Bloc<MedilineSearchEvent, MedilineSearchState> {
  MedilineSearchBloc() : super(MedilineSearchState()) {
    on<MedilineGetSearchEvent>((event, emit) async {
      emit(MedilineSearchloadingState());
      GetAppointmentResponse? res = await MedilineRepository()
          .getAppointmentsSearch(search: event.searchQuery);
      emit(MedilineSearchResultState(appointmentList: res?.data ?? []));
    });
    // on<MedilineGetSearchEvent>((event, emit) async {});
  }
}
