import 'package:flutter/material.dart';
import 'package:mukuru_app/projects/colors.dart';
import 'package:mukuru_app/projects/customWidgets/update_form.dart';

class ProfileOutline extends StatelessWidget {
  final user;
  const ProfileOutline({super.key, this.user});

  void _openUpdateForm(BuildContext ctx) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        context: ctx,
        builder: (_) {
          return FractionallySizedBox(
            heightFactor: .7,
            child: UpdateUserForm(userProvider: user),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.zero,
              topRight: Radius.zero,
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      color: MyAppColors.primaryColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
        child: Column(children: [
          Container(
            color: MyAppColors.primaryColor1,
            padding: EdgeInsets.fromLTRB(12, 22, 12, 22),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Name: ', style: TextStyle(color: Colors.white)),
                  Text(
                    '${user.user!['user']['firstname']} ${user.user!['user']['surname']}',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Email: ', style: TextStyle(color: Colors.white)),
                  Text(
                    '${user.user!['user']['email']}',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Nationality: ', style: TextStyle(color: Colors.white)),
                  Text(
                    user.user!['user']['nationality'] != ''
                        ? '${user.user!['user']['nationality']}'
                        : 'N/A',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Phone Number: ', style: TextStyle(color: Colors.white)),
                  Text(
                    user.user!['user']['phoneNumber'] != ''
                        ? '${user.user!['user']['phoneNumber']}'
                        : 'N/A',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ]),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              TextButton(
                  onPressed: () => _openUpdateForm(context),
                  child: Text(
                    'Edit',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(MyAppColors.themeColor),
                  ))
            ],
          )
        ]),
      ),
    );
  }
}
