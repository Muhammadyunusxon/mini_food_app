import 'package:flutter/material.dart';


class CustomTextFormField extends StatelessWidget {
  final String? label;

  const CustomTextFormField({Key? key, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style:
          Theme.of(context).textTheme.labelMedium,
      decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(),
          errorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.error))),
    );
  }
}
