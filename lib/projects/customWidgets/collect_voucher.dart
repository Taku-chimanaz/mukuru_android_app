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
          Text('Collect')
        ],
      ),
      style: ElevatedButton.styleFrom(backgroundColor: MyAppColors.themeColor),
    );
  }
}
