import "package:flutter/material.dart";
import "package:mukuru_app/projects/colors.dart";
import "package:mukuru_app/projects/providers/user_provider.dart";
import "package:mukuru_app/states.dart";
import "package:provider/provider.dart";

class RevokeVoucher extends StatefulWidget {
  final String voucherID;
  const RevokeVoucher({super.key, required this.voucherID});

  @override
  State<RevokeVoucher> createState() => _RevokeVoucherState();
}

class _RevokeVoucherState extends State<RevokeVoucher> {
  late final voucherProvider =
      Provider.of<VouchersProvider>(context, listen: false);
  late final userProvider = Provider.of<UserProvider>(context, listen: false);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {
        voucherProvider.revokeVoucher(
            voucherID: widget.voucherID,
            context: context,
            userID: userProvider.user!['user']['_id'],
            updateUserInfo: userProvider.updateUserInfo),
      },
      child: Row(
        children: [
          Icon(
            Icons.delete,
            color: Colors.white,
          ),
          Text('Revoke')
        ],
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: MyAppColors.themeColor,
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
    );
  }
}
