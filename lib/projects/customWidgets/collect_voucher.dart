import "package:flutter/material.dart";
import "package:mukuru_app/projects/colors.dart";

class CollectVoucher extends StatelessWidget {
  final String voucherID;
  const CollectVoucher({
    super.key,
    required this.voucherID,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {},
      child: Row(
        children: [
          Icon(
            Icons.account_balance_wallet,
            color: Colors.white,
          ),
          Text('Collect', style: TextStyle(fontSize: 12))
        ],
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: MyAppColors.themeColor,
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
    );
  }
}
