import 'package:flutter/material.dart';
import 'package:doc_connect/common_components/services/api_requests.dart';
import 'package:doc_connect/modules/Auth/model/login/login_response_model.dart';

import 'package:doc_connect/modules/Profile/models/get_specific_patient_by_id/get_sprecific_patient_by_id.dart';
import 'package:doc_connect/modules/Profile/screens/patient_update_profile.dart';
import 'package:doc_connect/utils/constants/image_konstants.dart';

class Welcomepopup extends StatelessWidget {
  Response<LoginResponseModel>? response;
  Welcomepopup({super.key, this.response});

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    // get the screen dimensions
    return Center(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 36.0),
            child: Material(
              borderRadius: BorderRadius.circular(8),
              clipBehavior: Clip.hardEdge,
              color: Colors.white,
              child: SizedBox(
                height: MediaQuery.of(context).size.height > 667
                    ? MediaQuery.of(context).size.height * 0.75
                    : MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      response!.response?.data.user.name ?? "Ehsaan Raaj",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 10),
                    //   child: CircleAvatar(
                    //     radius: 18, // set the radius of the circle
                    //     backgroundImage: AssetImage(
                    //         'assets/images/image.png'), // set the image path
                    //   ),
                    // ), CODE TO ADD CIRCULAR IMAGE LATER WHEN ASSET IS PROVIDED.
                    Padding(
                      padding: const EdgeInsets.only(left: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "UHID : ",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Expanded(
                            child: Text(
                              response!.response?.data.user.id ?? " ABC34343 ",
                              style: const TextStyle(
                                  color: Colors.grey,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text('\u2022',
                              style:
                                  TextStyle(fontSize: 26, color: Colors.grey)),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "JATYA ID :",
                            style: TextStyle(color: Colors.grey),
                          ),
                          const Text(
                            "  7943AA",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              response!.response?.data.user.phoneNumber ??
                                  "+91 917391 971910 ",
                              style: const TextStyle(color: Colors.grey)),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text('\u2022',
                              style:
                                  TextStyle(fontSize: 26, color: Colors.grey)),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                              response!.response?.data.user.email ??
                                  "  Ehsaan@gmail.com",
                              style: const TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 25),
                          child: Text(
                            "Demographics",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 110),
                          child: Text(
                            "Not Provided",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 25),
                          child: Text(
                            "Allergy Information",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 80),
                          child: Text(
                            "Not Provided",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 25),
                          child: Text(
                            "Vaccination",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 128),
                          child: Text(
                            "Not Provided",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 25),
                          child: Text(
                            "Previous Reports",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 95),
                          child: Text(
                            "Not Provided",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),

                    const SizedBox(
                      height: 25,
                    ),

                    const Padding(
                      padding: EdgeInsets.only(
                        left: 30,
                      ),
                      child: Text(
                          "Keeping your profile updated helps secure faster appointment bookings and less wait times at the clinic."),
                    ),
                    // Need to add image here the asset is missing.
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PatientUpdateDetails(
                                        allergy:
                                            GetSpecificPatientAllergydata(),
                                      )));
                        },
                        child: const Text("Update My Profile"),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Not now",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 8,
            left: MediaQuery.of(context).size.width * 0.38,
            child: CircleAvatar(
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
          ),
        ],
      ),
    );
  }
}

// REMARKS:- ASSETS ARE MISSING AND IMAGE IS MISSING