import 'package:flutter/material.dart';

class profile extends StatelessWidget {
  final String title;
  final String subtitle;
  profile(
      {super.key,
      // required this.sizedBox,
      required this.title,
      required this.subtitle});
  // final SizedBox sizedBox;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: Flexible(
            child: TextFormField(
              cursorColor: Colors.blue,
              decoration: InputDecoration(
                  focusColor: Colors.blue,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.blue), // Change color when focused
                  ),
                  hintText: subtitle,
                  labelText: title,
                  labelStyle: TextStyle(color: Colors.blue)),
            ),
          ),
        ),
      ],
    );
  }
}
