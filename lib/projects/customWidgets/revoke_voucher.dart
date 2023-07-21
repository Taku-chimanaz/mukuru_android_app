import "package:flutter/material.dart";
import "package:mukuru_app/projects/colors.dart";

class RevokeVoucher extends StatelessWidget {
  const RevokeVoucher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {},
      child: Row(
        children: [
          Icon(
            Icons.delete,
            color: Colors.white,
          ),
          Text('Revoke')
        ],
      ),
      style: ElevatedButton.styleFrom(backgroundColor: MyAppColors.themeColor),
    );
  }
}
