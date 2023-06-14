import 'package:flutter/material.dart';

class BookmarkButton extends StatefulWidget {
  final void onButtonSelected;
  final void onButtonUnselected;

  const BookmarkButton({
    Key? key,
    this.onButtonSelected,
    this.onButtonUnselected,
  }) : super(key: key);

  @override
  State<BookmarkButton> createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          if (isSelected) {
            widget.onButtonSelected;
          } else {
            widget.onButtonUnselected;
          }
          isSelected = !isSelected;
        });
      },
      icon: isSelected ? const Icon(Icons.bookmark_outlined) : const Icon(Icons.bookmark_border_outlined),
    );
  }
}
