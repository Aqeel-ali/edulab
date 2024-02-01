import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class CoustomerField extends ConsumerWidget {
  const CoustomerField(this.myController, this.textlabel, this.prefixIcon,
      {this.suffixIcon = null, super.key});

  final TextEditingController myController;
  final String textlabel;
  final Icon prefixIcon;
  final Icon? suffixIcon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
        controller: myController,
        keyboardType: TextInputType.emailAddress,
        onSaved: (value) {
          myController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          filled: true,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.all(25),
          label: Text(
            textlabel,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15),
          ),
        ));
    ;
  }
}
