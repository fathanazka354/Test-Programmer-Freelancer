import 'package:flutter/material.dart';

class FormSection extends StatelessWidget {
  const FormSection(
      {super.key,
      required this.title,
      required this.controller,
      required this.label,
      required this.hintText,
      this.keyboardType,
      this.onChanged});
  final String title;
  final TextEditingController controller;
  final String label;
  final String hintText;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Text(title),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              label: Text(label),
              hintText: hintText,
            ),
            keyboardType: keyboardType,
            onChanged: onChanged,
          )
        ],
      ),
    );
  }
}
