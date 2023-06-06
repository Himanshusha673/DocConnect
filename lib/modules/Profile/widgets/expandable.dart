import 'package:flutter/material.dart';
import 'package:doc_connect/modules/Profile/widgets/checkBoxListTile.dart';
import 'package:doc_connect/utils/constants/color_konstants.dart';

class ExpandableWidget extends StatefulWidget {
  final IconData icon;
  final String heading;
  List<String> checkedList;
  List<String> unCheckedList;
  Function(String title, bool val) onChanged;

  bool isExpanded;

  ExpandableWidget(
      {super.key,
      required this.checkedList,
      required this.unCheckedList,
      required this.heading,
      required this.icon,
      required this.isExpanded,
      required this.onChanged});

  @override
  State<ExpandableWidget> createState() => _FAQQuestionState();
}

class _FAQQuestionState extends State<ExpandableWidget> {
  late double width;

  List<MyCheckboxListTile> selectedItems = [];
  List<MyCheckboxListTile> notSelectedItems = [];
  List<MyCheckboxListTile> totalItems = [];

  @override
  void initState() {
    for (String allergy in widget.checkedList) {
      selectedItems.add(MyCheckboxListTile(
        title: allergy,
        checked: true,
        onChanged: (value) {},
      ));
    }
    for (String allergy in widget.unCheckedList) {
      notSelectedItems.add(MyCheckboxListTile(
        title: allergy,
        checked: false,
        onChanged: (value) {},
      ));
    }
    totalItems = [...selectedItems, ...notSelectedItems];
    totalItems.map((e) => print(e.title));
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ExpandableWidget oldWidget) {
    print(selectedItems);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              widget.isExpanded = !widget.isExpanded;
            });
          },
          child: Column(
            children: [
              headerRow(
                widget.icon,
                widget.heading,
                widget.isExpanded
                    ? Icons.remove_circle_outline
                    : Icons.add_circle_outline,
              ),
              widget.isExpanded ? data() : Container(),
            ],
          ),
        ),
      ],
    );
  }

  Widget headerRow(
      IconData? leadingIcon, String value, IconData? trailingIcon) {
    return Column(
      children: [
        Row(
          children: [
            // Icon(Icons.lunch_dining_outlined)
            Expanded(
              child: Row(
                children: [
                  Icon(
                    leadingIcon,
                    color: ColorKonstants.headingTextColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  customTextFieldBlack(value),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Icon(
                  trailingIcon,
                  color: ColorKonstants.primarySwatch,
                )),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 8.0,
          ),
          child: Divider(thickness: 2),
        ),
      ],
    );
  }

  Widget data() {
    return SizedBox(
        height: 150,
        width: width,
        child: GridView.builder(
          itemCount: totalItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Expanded(
                //   child: Row(
                //     children: [
                //       Checkbox(
                //         value: _checkedList2[index],
                //         onChanged: (newValue) {
                //           setState(() {
                //             _checkedList2[index] = newValue!;
                //           });
                //         },
                //       ),
                //       Text(widget.list[index]),
                //     ],
                //   ),
                // ),
                Expanded(
                  child: MyCheckboxListTile(
                      title: totalItems[index].title,
                      checked: totalItems[index].checked,
                      onChanged: (val) {
                        setState(() {
                          if (val == true) {
                            totalItems[index].checked = val;
                            selectedItems.add(totalItems[index]);
                            //widget.checkedList.add(totalItems[index].title);
                          } else {
                            selectedItems.remove(totalItems[index]);
                          }
                          widget.onChanged(totalItems[index].title, val);
                        });
                      }),
                )
              ],
            );
          },
        ));
  }

  Widget checkboxWithText(bool? value, String msg) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Checkbox(
            value: value,
            onChanged: (val) {
              setState(() {
                value = val;
              });
            }),
        Text(msg)
      ],
    );
  }

  Widget customTextFieldBlack(String value) {
    return Text(
      value,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black,
        height: 1.5,
      ),
    );
  }
}
