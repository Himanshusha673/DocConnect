part of 'vaccinations_bloc.dart';

class VaccinationsState {
  final List<Vaccine> vaccineList;
  final DropDownItem? vaccineName;
  final String? date;
  final File? image;
  List<DropDownItem> vaccineOptions = const [
    DropDownItem(name: 'Vaccine 1'),
    DropDownItem(name: 'Vaccine 1'),
    DropDownItem(name: 'Vaccine 3'),
  ];
  VaccinationsState({
    this.date,
    this.vaccineList = const [],
    this.vaccineName,
    this.image,
  });
  VaccinationsState copyWith({
    List<Vaccine>? vaccineList,
    DropDownItem? vaccineName,
    String? date,
    File? image,
  }) {
    return VaccinationsState(
      date: date ?? this.date,
      vaccineList: vaccineList ?? this.vaccineList,
      vaccineName: vaccineName ?? this.vaccineName,
      image: image ?? this.image,
    );
  }
}

class VaccinationCreated extends VaccinationsState {}

class VaccinationCreateFailed extends VaccinationsState {}
