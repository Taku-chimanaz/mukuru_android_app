import "package:flutter/material.dart";
import 'package:mukuru_app/projects/colors.dart';
import 'package:mukuru_app/projects/customWidgets/UserDetailsDialog.dart';
import 'package:mukuru_app/projects/providers/user_provider.dart';
import 'package:provider/provider.dart';

class UserDetails extends StatefulWidget {
  UserDetails({
    super.key,
  });

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  late final UserProvider UserProviderBindingInstance =
      Provider.of<UserProvider>(context);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      margin: EdgeInsets.all(0),
      color: MyAppColors.primaryColor,
      shadowColor: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18.0, 25.0, 18.0, 20.0),
        child: Column(
          children: [
            Row(
              children: [
                UserName(
                  firstname: UserProviderBindingInstance.user!['user']
                      ['firstname'],
                  surname: UserProviderBindingInstance.user!['user']['surname'],
                ),
                SizedBox(height: 15),
                UserFinances(
                  balance: UserProviderBindingInstance.user!['user']['balance'],
                )
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            )
          ],
        ),
      ),
    );
  }
}

class UserFinances extends StatefulWidget {
  final double balance;
  const UserFinances({
    super.key,
    required this.balance,
  });

  @override
  State<UserFinances> createState() => _UserFinancesState();
}

class _UserFinancesState extends State<UserFinances> {
  late final UserProvider UserProviderBindingInstance =
      Provider.of<UserProvider>(context);

  void _openUserDetailsBottomSheet(BuildContext ctx) {
    showModalBottomSheet(
        backgroundColor: MyAppColors.primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.0),
          ),
        ),
        context: ctx,
        builder: (_) {
          return UserDetailsDialog(
              balance: widget.balance,
              userEmail: UserProviderBindingInstance.user!['user']['email']);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () => {_openUserDetailsBottomSheet(context)},
          child: Row(
            children: [
              Icon(
                Icons.wallet,
                color: Colors.white,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(6.0, 0, 0, 0),
                child: Text(
                  '\$${widget.balance}',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.0),
                ),
              )
            ],
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: MyAppColors.themeColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
        )
      ],
    );
  }
}

class UserName extends StatelessWidget {
  final String firstname;
  final String surname;
  const UserName({
    super.key,
    required this.firstname,
    required this.surname,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
              child: Text(
                'Welcome ${firstname[0]} $surname',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 12.0),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
