import "package:flutter/material.dart";

class UserDetails extends StatelessWidget {
  const UserDetails({
    super.key,
  });

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
              children: [UserName(), SizedBox(height: 15), UserFinances()],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            )
          ],
        ),
      ),
    );
  }
}

class UserFinances extends StatelessWidget {
  const UserFinances({
    super.key,
  });

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
            '\$40',
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
  const UserName({
    super.key,
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
                'Welcome Takudzwa',
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
