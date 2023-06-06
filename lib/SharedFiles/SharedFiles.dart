import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../common_components/widgets/common_drawer.dart';
import '../utils/constants/color_konstants.dart';
import '../utils/constants/image_konstants.dart';

class SharedFiles extends StatefulWidget {
  const SharedFiles({Key? key}) : super(key: key);

  @override
  State<SharedFiles> createState() => _SharedFilesState();
}

class _SharedFilesState extends State<SharedFiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Shared Files'),
          centerTitle: false,
        ),
        drawer: const CommonDrawer(),
        body: Container(
            height: MediaQuery.of(context).size.height * 0.22,
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Material(
                  clipBehavior: Clip.hardEdge,
                  color: ColorKonstants.cardBackgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                        width: 0.5,
                        color: ColorKonstants.primarySwatch.shade100),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.16,
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            MedilineDetail(),
                            const SizedBox(
                              height: 10,
                            ),
                            MedilineDescription(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}

Widget MedilineDetail() {
  return Row(
    children: [
      CircleAvatar(
        radius: 24,
        backgroundColor:
            Colors.grey.shade200, // Set the background color of the circle
        child: SvgPicture.asset(
          ImagesConstants.medilineDrawer,
        ),
      ),
      const SizedBox(width: 8),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Full Mediline',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    // fontSize: 18,
                    color: ColorKonstants.headingTextColor,
                  ),
                ),
                // verifiedTag(context),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Shared 3 days ago',
              style: TextStyle(
                  fontSize: 12,
                  color: ColorKonstants.subHeadingTextColor.withOpacity(0.6)),
            ),
          ],
        ),
      )
    ],
  );
}

Widget MedilineDescription() {
  return Padding(
      padding: EdgeInsets.all(8),
      child: Row(children: [
        const SizedBox(
          width: 50,
        ),
        const CircleAvatar(
          radius: 16,
          backgroundImage: AssetImage(ImagesConstants.doctor),
        ),
        const SizedBox(width: 8),
        Text(
          "Dr. Neetu Sharma",
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: TextStyle(
              color: ColorKonstants.headingTextColor,
              fontWeight: FontWeight.bold),
        ),
      ]));
}
