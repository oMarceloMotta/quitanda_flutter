import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      required this.icon,
      required this.label,
      this.isSecret = false,
      this.inputFormatters,
      this.initialValue,
      this.readOnly = false,
      this.controller,
      this.validator,
      this.textInputType,
      this.onSaved});
  final bool readOnly;
  final String? initialValue;
  final IconData icon;
  final String label;
  final bool isSecret;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final void Function(String?)? onSaved;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;

  @override
  void initState() {
    super.initState();
    isObscure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: widget.controller,
        initialValue: widget.initialValue,
        readOnly: widget.readOnly,
        inputFormatters: widget.inputFormatters,
        obscureText: isObscure,
        validator: widget.validator,
        onSaved: widget.onSaved,
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.isSecret
              ? IconButton(
                  icon:
                      Icon(isObscure ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(
                      () {
                        isObscure = !isObscure;
                      },
                    );
                  },
                )
              : null,
          isDense: true,
          labelText: widget.label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
