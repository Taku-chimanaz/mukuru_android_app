import 'package:flutter/material.dart';
import 'package:mukuru_app/projects/colors.dart';
import 'package:mukuru_app/projects/providers/user_provider.dart';

class UpdateUserForm extends StatefulWidget {
  final UserProvider userProvider;
  UpdateUserForm({super.key, required this.userProvider});

  @override
  State<UpdateUserForm> createState() => _UpdateUserFormState();
}

class _UpdateUserFormState extends State<UpdateUserForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final firstnameController = TextEditingController();

  final lastnameController = TextEditingController();

  final emailController = TextEditingController();

  final mobileController = TextEditingController();
  bool showIsLoading = false;

  setLoading(bool loadingState) {
    setState(() {
      showIsLoading = loadingState;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    firstnameController.text = widget.userProvider.user.firstname;
    lastnameController.text = widget.userProvider.user.surname;
    emailController.text = widget.userProvider.user.email;
    mobileController.text = widget.userProvider.user.phoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.only(top: 60.0),
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            children: [
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
              TextFormField(
                controller: firstnameController,
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
                      widget.userProvider.updateUser(
                          widget.userProvider.user.id,
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
                ],
              )
            ],
          ),
        ));
  }
}
