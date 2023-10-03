import "package:flutter/material.dart";
import "package:mukuru_app/projects/colors.dart";

class SelectTimeRangeHeader extends StatelessWidget {
  const SelectTimeRangeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
          border: BorderDirectional(
              bottom: BorderSide(width: 1, color: MyAppColors.borderColor))),
      child: Row(
        children: [
          Text(
            'Select Time Range',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          )
        ],
      ),
    );
  }
}
