import 'package:flutter/material.dart';

class CheckFullnameErrorText extends StatelessWidget {
  const CheckFullnameErrorText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 5.0),
      child: Text(
        'Please enter firstname and surname e.g John Doe',
        style: TextStyle(fontSize: 12.0, color: Colors.red),
      ),
    );
  }
}
