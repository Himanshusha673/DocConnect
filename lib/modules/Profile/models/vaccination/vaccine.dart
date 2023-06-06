import 'dart:io';

class Vaccine {
  String vaccineName;
  String date;
  File image;
  String? imageurl;
  Vaccine({
    required this.date,
    required this.image,
    required this.vaccineName,
    this.imageurl,
  });
}
