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

  void toggleViewPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome Back',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 40.0),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) => SignupSnippets.validateEmail(
                              emailController.text),
                          controller: emailController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email,
                                  color: MyAppColors.lighterThemeColor),
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
                              prefixIcon: Icon(
                                Icons.security,
                                color: MyAppColors.lighterThemeColor,
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
                                loginUser(emailController.text,
                                    passwordController.text, context)
                              }
                          },
                          child: Text('Login'),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: MyAppColors.themeColor,
                              minimumSize: const Size.fromHeight(40)),
                        ),
                        Row(
                          children: [
                            Text(
                              'Do not have an account?',
                            ),
                            TextButton(
                                onPressed: () => {context.push('/signup')},
                                child: Text(
                                  'Signup',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.black,
                                  ),
                                ))
                          ],
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
