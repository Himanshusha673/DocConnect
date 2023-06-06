import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DropDownWidget extends StatefulWidget {
  final String title;
  final String hint;
  final DropDownItem? selectedItem;
  final List<DropDownItem> options;
  final Function(DropDownItem) onChanged;
  final bool isMandatory;
  const DropDownWidget({
    super.key,
    this.title = "",
    this.hint = "",
    this.selectedItem,
    this.isMandatory = false,
    required this.options,
    required this.onChanged,
  });

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
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
                  top: buttonPosition.dy + buttonSize.height + 4,
                  left: buttonPosition.dx,
                  width: buttonSize.width,
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
        child: Padding(
          padding: const EdgeInsets.only(top:8 ,bottom:8 ,left:1),
          child: Column(
            children: [
              widget.title != ""
                  ? Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          widget.isMandatory
                              ? const Text(
                                  " *",
                                  style: TextStyle(color: Colors.red),
                                )
                              : Container()
                        ],
                      ),
                    )
                  : Container(),
              Container(
                key: _key,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey.withOpacity(0.6),
                      width: 0.5,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        widget.selectedItem?.iconData != null ? Icon(widget.selectedItem!.iconData) : Container(),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          widget.selectedItem == null ? "Select" : widget.selectedItem!.name,
                          style: const TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    const Icon(Icons.keyboard_arrow_down_rounded)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget dropDown() {
    return widget.options.length < 4
        ? Column(
            children: widget.options.map((e) {
            return ListTile(
              leading: e.iconData != null ? Icon(e.iconData) : null,
              title: Text(e.name),
              onTap: () {
                closeMenu();
                widget.onChanged(e);
                scrollController.animateToItem(widget.options.indexOf(e), duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                setState(() {});
              },
            );
          }).toList())
        : SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width / 3,
            child: SingleChildScrollView(
              child: Column(
                  children: widget.options.map((e) {
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 7,
                  ),
                  leading: e.iconData != null ? Icon(e.iconData) : null,
                  title: Text(
                    e.name,
                    overflow: TextOverflow.clip,
                    style: const TextStyle(fontSize: 14),
                  ),
                  onTap: () {
                    closeMenu();
                    widget.onChanged(e);
                    scrollController.animateToItem(widget.options.indexOf(e), duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                    setState(() {});
                  },
                );
              }).toList()),
            ),
          );
  }
}

class DropDownItem {
  final String name;
  final IconData? iconData;
  const DropDownItem({required this.name, this.iconData});
}
