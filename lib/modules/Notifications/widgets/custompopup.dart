import 'package:flutter/material.dart';

class CustomPopupContent extends StatelessWidget {
  const CustomPopupContent({super.key});

  @override
  Widget build(BuildContext context) {
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
                height: MediaQuery.of(context).size.height * 0.68,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const Text("Provide Feedback on your online consulation"),
                    const SizedBox(
                      height: 40,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 10),
                    //   child: CircleAvatar(
                    //     radius: 18, // set the radius of the circle
                    //     backgroundImage: AssetImage(
                    //         'assets/images/image.png'), // set the image path
                    //   ),
                    // ), CODE TO ADD CIRCULAR IMAGE LATER WHEN ASSET IS PROVIDED.
                    const Padding(
                      padding: EdgeInsets.only(right: 100),
                      child: Text("Jaiyush Malagi"),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 130),
                      child: Text("MBBS MD"),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis viverra commodo metus, ut volutpat augue gravida posuere. In a augue vel felis fringilla fringilla non ac ex. Nam vehicula neque a dolor cursus, dapibus fermentum justo sodales. Maecenas at malesuada eros, et mattis augue."),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 82),
                          child: Text(
                            "DOCTORS PERFORMANCE * * * * *",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 162),
                          child: Text(
                            "CALL QUALITY * * * * *",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 140),
                          child: Text(
                            "WAS IT HELPFUL? * * * * *",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
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
                          // do something
                        },
                        child: const Text("Submit"),
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "I'll Provide later.",
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
            child: const CircleAvatar(
              radius: 30,
              backgroundColor: Colors.green,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.done,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// REMARKS:- ASSETS ARE MISSING AND IMAGE IS MISSING
