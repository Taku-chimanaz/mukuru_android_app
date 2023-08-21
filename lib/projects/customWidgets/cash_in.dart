import "package:flutter/material.dart";
import "package:mukuru_app/projects/colors.dart";
import "package:mukuru_app/projects/providers/user_provider.dart";
import "package:mukuru_app/states.dart";
import "package:provider/provider.dart";

class CashInVoucher extends StatefulWidget {
  final String voucherID;
  const CashInVoucher({
    super.key,
    required this.voucherID,
  });

  @override
  State<CashInVoucher> createState() => _CashInVoucherState();
}

class _CashInVoucherState extends State<CashInVoucher> {
  late final voucherProvider =
      Provider.of<VouchersProvider>(context, listen: false);
  late final userProvider = Provider.of<UserProvider>(context, listen: false);
  bool isCashingIn = false;

  setIsCashingIn(bool cashingInState) {
    setState(() {
      isCashingIn = cashingInState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: !isCashingIn
          ? () => {
                voucherProvider.cashInVoucher(
                    userID: userProvider.user!['user']['_id'],
                    voucherID: widget.voucherID,
                    context: context,
                    updateUserInfo: userProvider.updateUserInfo,
                    setIsCashingIn: setIsCashingIn)
              }
          : null,
      child: Row(
        children: [
          if (!isCashingIn)
            Icon(
              Icons.account_balance_wallet,
              color: Colors.white,
            ),
          Text(!isCashingIn ? 'Cash-In' : 'Cashing-In')
        ],
      ),
      style: ElevatedButton.styleFrom(backgroundColor: MyAppColors.themeColor),
    );
  }
}
