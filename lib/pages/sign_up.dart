import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mukuru_app/projects/colors.dart';
import 'package:mukuru_app/projects/providers/user_provider.dart';
import 'package:mukuru_app/projects/snippets/SignUpSnippets.dart';
import 'package:provider/provider.dart';
import '../projects/snippets/create_user.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstnameController = TextEditingController();
  final surnameController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  late final UserProvider UserProviderBindingInstance =
      Provider.of<UserProvider>(context, listen: false);

  bool showPassword = false;
  bool showConfirmPassword = false;
  bool isLoading = false;

  void toggleViewPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  void toggleViewConfirmPassword() {
    setState(() {
      showConfirmPassword = !showConfirmPassword;
    });
  }

  setLoading(bool loadingState) {
    setState(() {
      isLoading = loadingState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: MyAppColors.whiteSmokeColor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Create An Account',
                  style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Enjoy convience from anywhere',
                  style: TextStyle(
                      color: MyAppColors.borderColor,
                      fontWeight: FontWeight.w200,
                      fontSize: 12),
                ),
                SizedBox(height: 40.0),
                if (isLoading)
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      alignment: Alignment.center,
                      child: Text(
                        'Signing user up....please wait',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500),
                      )),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            return SignupSnippets.validateFirstname(value);
                          },
                          controller: firstnameController,
                          decoration: InputDecoration(
                            labelText: 'Firstname',
                            contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                            labelStyle: TextStyle(fontSize: 12.0),
                            border: OutlineInputBorder(),
                            prefixIcon: Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          width: 1,
                                          color: MyAppColors.borderColor))),
                              child: Icon(
                                Icons.person,
                                color: MyAppColors.primaryColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          validator: (value) {
                            return SignupSnippets.validateSurname(value);
                          },
                          controller: surnameController,
                          decoration: InputDecoration(
                            labelText: 'Surname',
                            contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                            labelStyle: TextStyle(fontSize: 12.0),
                            border: OutlineInputBorder(),
                            prefixIcon: Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          width: 1,
                                          color: MyAppColors.borderColor))),
                              child: Icon(
                                Icons.person,
                                color: MyAppColors.primaryColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                              prefixIcon: Container(
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1,
                                            color: MyAppColors.borderColor))),
                                child: Icon(
                                  Icons.email,
                                  color: MyAppColors.primaryColor,
                                ),
                              ),
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                              labelText: 'Email',
                              labelStyle: TextStyle(fontSize: 12.0)),
                          validator: (value) {
                            return SignupSnippets.validateEmail(value);
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          validator: (value) {
                            return SignupSnippets.validatePassword(
                                passwordController.text,
                                confirmPasswordController.text);
                          },
                          controller: passwordController,
                          obscureText: !showPassword,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                              labelStyle: TextStyle(fontSize: 12.0),
                              border: OutlineInputBorder(),
                              prefixIcon: Container(
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1,
                                            color: MyAppColors.borderColor))),
                                child: Icon(
                                  Icons.lock,
                                  color: MyAppColors.primaryColor,
                                ),
                              ),
                              suffixIcon: IconButton(
                                icon: !showPassword
                                    ? Icon(
                                        Icons.remove_red_eye,
                                        color: MyAppColors.themeColor,
                                      )
                                    : Icon(
                                        Icons.hide_source,
                                        color: MyAppColors.themeColor,
                                      ),
                                onPressed: () => {toggleViewPassword()},
                              )),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          validator: (value) {
                            return SignupSnippets.validatePassword(
                                confirmPasswordController.text,
                                passwordController.text);
                          },
                          controller: confirmPasswordController,
                          obscureText: !showConfirmPassword,
                          decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                              labelStyle: TextStyle(fontSize: 12.0),
                              border: OutlineInputBorder(),
                              prefixIcon: Container(
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1,
                                            color: MyAppColors.borderColor))),
                                child: Icon(
                                  Icons.lock,
                                  color: MyAppColors.primaryColor,
                                ),
                              ),
                              suffixIcon: IconButton(
                                icon: !showConfirmPassword
                                    ? Icon(
                                        Icons.remove_red_eye,
                                        color: MyAppColors.themeColor,
                                      )
                                    : Icon(
                                        Icons.hide_source,
                                        color: MyAppColors.themeColor,
                                      ),
                                onPressed: () => {toggleViewConfirmPassword()},
                              )),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          onPressed: () => {
                            if (_formKey.currentState!.validate())
                              {
                                createUser(
                                    emailController.text,
                                    passwordController.text,
                                    firstnameController.text,
                                    surnameController.text,
                                    context,
                                    setLoading)
                              }
                          },
                          child: Text('Signup'),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              backgroundColor: MyAppColors.themeColor,
                              minimumSize: const Size.fromHeight(40)),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Row(
                            children: [
                              Text('Already have an account?',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal)),
                              TextButton(
                                  onPressed: () => {context.push('/login')},
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontSize: 12,
                                        color: MyAppColors.themeColor,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
