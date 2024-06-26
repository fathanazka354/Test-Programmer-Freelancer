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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          const SizedBox(
            height: 8,
          ),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              // label: Text(label),
              border: const OutlineInputBorder(),
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey.shade400)
            ),
            keyboardType: keyboardType,
            onChanged: onChanged,
          )
        ],
      ),
    );
  }
}
