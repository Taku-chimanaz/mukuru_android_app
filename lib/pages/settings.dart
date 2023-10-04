import 'package:flutter/material.dart';
import 'package:mukuru_app/projects/BottomAppBar.dart';
import 'package:mukuru_app/projects/colors.dart';
import 'package:mukuru_app/projects/providers/user_provider.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool editable = false;
  bool showIsLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  late final UserProvider userProvider = Provider.of<UserProvider>(context);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    firstnameController.text = userProvider.user!['user']['firstname'];
    lastnameController.text = userProvider.user!['user']['surname'];
    emailController.text = userProvider.user!['user']['email'];
    mobileController.text = userProvider.user!['user']['phoneNumber'];
  }

  void toggleEditable() {
    setState(() {
      editable = !editable;
    });
  }

  setLoading(bool loadingState) {
    setState(() {
      showIsLoading = loadingState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: MyAppColors.backgroundColor,
          padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
          child: Column(children: [
            Text(
              'My Profile',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: toggleEditable,
                  child: Text(editable ? 'Read Only' : 'Edit'),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      backgroundColor: MyAppColors.borderColor),
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            if (showIsLoading)
              Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  alignment: Alignment.center,
                  child: Text(
                    'Updating details...please wait',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500),
                  )),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: firstnameController,
                      readOnly: !editable,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(15.0, 0, 0, 0),
                        labelText: 'Firstname',
                        hintStyle: TextStyle(fontSize: 12.0),
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(fontSize: 12.0),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: lastnameController,
                      keyboardType: TextInputType.text,
                      readOnly: !editable,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(15.0, 0, 0, 0),
                        labelText: 'Lastname',
                        hintStyle: TextStyle(fontSize: 12.0),
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(fontSize: 12.0),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: emailController,
                      readOnly: !editable,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(15.0, 0, 0, 0),
                        labelText: 'Email',
                        hintStyle: TextStyle(fontSize: 12.0),
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(fontSize: 12.0),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: mobileController,
                      readOnly: !editable,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(15.0, 0, 0, 0),
                        labelText: 'Mobile Number',
                        hintStyle: TextStyle(fontSize: 12.0),
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(fontSize: 12.0),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () => {
                            userProvider.updateUser(
                                userProvider.user!['user']['_id'],
                                emailController.text,
                                mobileController.text,
                                firstnameController.text,
                                lastnameController.text,
                                context,
                                setLoading)
                          },
                          child: Text('Update'),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: MyAppColors.themeColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              padding: EdgeInsets.fromLTRB(25, 18, 25, 18)),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        ElevatedButton(
                          onPressed: () => {
                            userProvider.deleteUser(
                                userProvider.user!['user']['_id'],
                                setLoading,
                                context)
                          },
                          child: Text('Delete'),
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 104, 9, 2),
                              padding: EdgeInsets.fromLTRB(25, 18, 25, 18),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                        )
                      ],
                    )
                  ],
                ))
          ]),
        ),
        bottomNavigationBar: BottomBar(
          activePage: 'Profile',
        ),
      ),
    );
  }
}
