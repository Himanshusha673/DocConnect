import 'package:flutter/material.dart';
import 'package:doc_connect/utils/constants/image_konstants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Positioned(
          left: 50.0,
          child: CircleAvatar(
            radius: 20.0,
            backgroundImage: AssetImage(ImagesConstants.clinicPlaceholder),
          ),
        ),
        Positioned(
          left: 25.0,
          child: CircleAvatar(
            radius: 20.0,
            backgroundImage: AssetImage(ImagesConstants.circleavatar2),
          ),
        ),
        Positioned(
          top: 12,
          left: 100.0,
          child: Text(
            "Visit types goes here",
            style: TextStyle(fontSize: 19, color: Colors.white),
          ),
        ),
        Positioned(
            top: 35,
            left: 100.0,
            child: Text(
              "Oct 01, 2020",
              style: TextStyle(fontSize: 12, color: Colors.white60),
            )),

        // IconButton(
        //     onPressed: () {},
        //     icon: const Icon(
        //       Icons.more_vert,
        //       color: Colors.white,
        //     ))
        // PopupMenuButton(
        //   icon: const Icon(
        //     Icons.more_vert,
        //     color: Colors.white,
        //   ),
        //   itemBuilder: (BuildContext context) {
        //     return [
        //       PopupMenuItem(
        //         value: 'item1',
        //         child: ListTile(
        //           selected: true,
        //           onTap: () {},
        //           leading: const Padding(
        //             padding: EdgeInsets.only(right: 18.0),
        //             child: Icon(Icons.menu_sharp,
        //                 color: ColorKonstants.primarySwatch),
        //           ),
        //           title: const Text(
        //             'Summary View',
        //             style: TextStyle(color: Colors.black26),
        //           ),
        //         ),
        //       ),
        //       PopupMenuItem(
        //         value: 'item2',
        //         child: ListTile(
        //           selected: true,
        //           onTap: () {},
        //           leading: const Padding(
        //             padding: EdgeInsets.only(right: 18.0),
        //             child: Icon(Icons.credit_card,
        //                 color: ColorKonstants.primarySwatch),
        //           ),
        //           title: const Text(
        //             'Detailed View',
        //             style: TextStyle(color: Colors.black),
        //           ),
        //         ),
        //       ),
        //       PopupMenuItem(
        //         value: 'item3',
        //         child: ListTile(
        //           selected: true,
        //           onTap: () {},
        //           leading: const Padding(
        //             padding: EdgeInsets.only(right: 18.0),
        //             child: Icon(Icons.share,
        //                 color: ColorKonstants.primarySwatch),
        //           ),
        //           title: const Text(
        //             'Share Details with…',
        //             style: TextStyle(color: Colors.black),
        //           ),
        //         ),
        //       ),
        //       PopupMenuItem(
        //         value: 'item4',
        //         child: ListTile(
        //           selected: true,
        //           onTap: () {},
        //           leading: const Padding(
        //             padding: EdgeInsets.only(right: 18.0),
        //             child: Icon(Icons.file_download,
        //                 color: ColorKonstants.primarySwatch),
        //           ),
        //           title: const Text(
        //             'Download Prescription',
        //             style: TextStyle(color: Colors.black),
        //           ),
        //         ),
        //       ),
        //     ];
        //   },
        // ),
      ],

      // ),
    );
  }
}
