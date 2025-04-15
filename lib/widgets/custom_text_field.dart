import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key, this.onSubmitted, required this.labelText});
  final ValueChanged<String>? onSubmitted;
  final String labelText;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      onSaved: (value) {
        controller.clear();
        widget.onSubmitted!(value!);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        labelText: widget.labelText,
      ),
    );
  }
}
