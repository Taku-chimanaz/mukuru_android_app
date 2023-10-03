import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mukuru_app/projects/snippets/SignUpSnippets.dart';
import 'package:mukuru_app/projects/snippets/loginSnippets.dart';
import 'package:provider/provider.dart';
import 'package:mukuru_app/projects/colors.dart';
import 'package:mukuru_app/projects/providers/user_provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late final UserProvider UserProviderBindingInstance =
      Provider.of<UserProvider>(context, listen: false);
  late final Function loginUser = UserProviderBindingInstance.loginUser;
  bool showPassword = false;
  bool isLoading = false;

  void toggleViewPassword() {
    setState(() {
      showPassword = !showPassword;
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
        backgroundColor: MyAppColors.whiteSmokeColor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome back',
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Login to continue using our services',
                  style: TextStyle(
                      color: MyAppColors.borderColor,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w200),
                ),
                SizedBox(height: 65.0),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        if (isLoading)
                          Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              alignment: Alignment.center,
                              child: Text(
                                'Authenticating user....please wait',
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w500),
                              )),
                        TextFormField(
                          validator: (value) => SignupSnippets.validateEmail(
                              emailController.text),
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
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          validator: (value) => LoginSnippets.validatePassword(
                              passwordController.text),
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
                        ElevatedButton(
                          onPressed: () => {
                            if (_formKey.currentState!.validate())
                              {
                                loginUser(
                                    emailController.text,
                                    passwordController.text,
                                    context,
                                    setLoading)
                              }
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: MyAppColors.themeColor,
                              padding: EdgeInsets.all(15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              minimumSize: const Size.fromHeight(40)),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                          child: Row(
                            children: [
                              Text(
                                'Do not have an account?',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                              ),
                              Container(
                                child: TextButton(
                                    onPressed: () => {context.push('/signup')},
                                    child: Text(
                                      'Register',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontSize: 12,
                                          color: MyAppColors.themeColor,
                                          fontWeight: FontWeight.bold),
                                    )),
                              )
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
