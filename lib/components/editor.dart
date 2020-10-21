import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData iconData;
  Editor({
    this.controller,
    this.label,
    this.hint,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 24),
        decoration: InputDecoration(
            icon: iconData != null ? Icon(iconData) : null,
            labelText: label,
            hintText: hint),
      ),
    );
  }
}
