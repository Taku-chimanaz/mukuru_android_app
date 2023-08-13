import "package:flutter/material.dart";
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
      margin: EdgeInsets.all(0),
      color: Colors.white,
      shadowColor: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
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
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.account_balance_wallet,
          color: Colors.grey,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(6.0, 0, 0, 0),
          child: Text(
            '\$${widget.balance}',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 12.0),
          ),
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
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
              child: Text(
                'Welcome ${firstname[0]} $surname',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
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
