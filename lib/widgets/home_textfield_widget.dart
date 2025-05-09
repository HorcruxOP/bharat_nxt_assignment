import 'package:flutter/material.dart';

class HomeTextfieldWidget extends StatelessWidget {
  const HomeTextfieldWidget({
    super.key,
    this.onChanged,
    this.onCrossButton,
    required this.controller,
  });
  final void Function(String value)? onChanged;
  final void Function()? onCrossButton;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: Colors.grey,
      ),
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        controller: controller,
        cursorColor: Colors.black,
        onChanged: onChanged,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: onCrossButton,
            child: Icon(
              Icons.cancel,
            ),
          ),
          hintText: "Type to search ...",
          border: border,
          enabledBorder: border,
          focusedBorder: border,
          focusedErrorBorder: border,
          errorBorder: border,
        ),
      ),
    );
  }
}
