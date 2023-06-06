class UpdateUserModel {
    String name;
    String photo;
    String phoneNumber;
    String address;
    String city;
    String state;
    String country;
    String pinCode;
    DateTime dateOfBirth;
    String gender;

    UpdateUserModel({
        required this.name,
        required this.photo,
        required this.phoneNumber,
        required this.address,
        required this.city,
        required this.state,
        required this.country,
        required this.pinCode,
        required this.dateOfBirth,
        required this.gender,
    });

    factory UpdateUserModel.fromJson(Map<String, dynamic> json) => UpdateUserModel(
        name: json["name"],
        photo: json["photo"],
        phoneNumber: json["phoneNumber"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        pinCode: json["pinCode"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        gender: json["gender"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "photo": photo,
        "phoneNumber": phoneNumber,
        "address": address,
        "city": city,
        "state": state,
        "country": country,
        "pinCode": pinCode,
        "dateOfBirth": dateOfBirth.toIso8601String(),
        "gender": gender,
    };
}