import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarDropDownMenu extends StatefulWidget {
  final bool isMandatory;
  const AppBarDropDownMenu({
    super.key,
    this.isMandatory = false,
  });

  @override
  State<AppBarDropDownMenu> createState() => _AppBarDropDownMenuState();
}

class _AppBarDropDownMenuState extends State<AppBarDropDownMenu> {
  final GlobalKey _key = LabeledGlobalKey("button_icon");
  bool isActive = false;
  late OverlayEntry _overlayEntry;
  late Size buttonSize;
  late Offset buttonPosition;

  bool isMenuOpen = false;
  late FixedExtentScrollController scrollController;

  findButton() {
    RenderBox renderBox = _key.currentContext?.findRenderObject() as RenderBox;
    buttonSize = renderBox.size;
    buttonPosition = renderBox.localToGlobal(Offset.zero);
  }

  @override
  void initState() {
    scrollController = FixedExtentScrollController();
    super.initState();
  }

  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(builder: (context) {
      return Container(
        color: Colors.transparent,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            closeMenu();
          },
          child: Stack(
            children: [
              Positioned(
                  top: buttonPosition.dy + buttonSize.height,
                  left: buttonPosition.dx - 170,
                  width: 180,
                  child: Container(
                      color: Colors.white,
                      child: Material(
                        color: Colors.white,
                        elevation: 10,
                        child: dropDown(),
                      )))
            ],
          ),
        ),
      );
    });
  }

  void openMenu() {
    findButton();
    _overlayEntry = _overlayEntryBuilder();
    Overlay.of(context).insert(_overlayEntry);
    isMenuOpen = !isMenuOpen;
  }

  void closeMenu() {
    _overlayEntry.remove();
    isMenuOpen = !isMenuOpen;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onLongPress: () {
          HapticFeedback.lightImpact();
          setState(() {
            isActive = true;
          });
        },
        onLongPressUp: () {
          setState(() {
            isActive = false;
          });
        },
        onTap: () {
          if (isMenuOpen) {
            closeMenu();
          } else {
            openMenu();
          }
        },
        child: Container(
          key: _key,
          // padding: const EdgeInsets.all(4),
          child: const Icon(Icons.more_vert),
        ),
      ),
    );
  }

  Widget dropDown() {
    return Column(children: [
      ListTile(
        dense: true,
        onTap: () {
          closeMenu();
          // showPopup(
          //   context: context,
          //   child: const ShareMedilinePopup(),
          // );
        },
        title: Row(
          children: [
            Icon(
              Icons.share,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(
              width: 8,
            ),
            const Text("Share Mediline with"),
          ],
        ),
      )
    ]);
  }
}
