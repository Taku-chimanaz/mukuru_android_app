import 'package:flutter/material.dart';
import 'package:mukuru_app/projects/colors.dart';
import 'package:mukuru_app/projects/providers/user_provider.dart';
import 'package:provider/provider.dart';

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({super.key});

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  late final UserProvider userProvider =
      Provider.of<UserProvider>(context, listen: false);
  bool isLoading = false;

  void setLoading(bool state) {
    setState(() {
      isLoading = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.zero,
              topRight: Radius.zero,
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      color: MyAppColors.primaryColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                'Delete Account',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              color: MyAppColors.primaryColor1,
              padding: EdgeInsets.fromLTRB(12, 18, 12, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'This action cannot be reversed.',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                      onPressed: () => {
                            userProvider.deleteUser(
                                userProvider.user!['user']['_id'],
                                setLoading,
                                context)
                          },
                      child: Text(
                        'Delete',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 174, 18, 7)),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
