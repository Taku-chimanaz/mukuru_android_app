import 'package:flutter/material.dart';
import 'package:mukuru_app/projects/colors.dart';
import 'package:mukuru_app/projects/customWidgets/checkFullnameErrorText.dart';
import 'package:mukuru_app/projects/snippets/SendMoneyFormSnippets.dart';
import 'package:mukuru_app/projects/providers/user_provider.dart';
import 'package:provider/provider.dart';

class SendMoneyForm extends StatefulWidget {
  const SendMoneyForm({super.key});

  @override
  State<SendMoneyForm> createState() => _SendMoneyFormState();
}

class _SendMoneyFormState extends State<SendMoneyForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final recipientTextFieldController = TextEditingController();
  final amountTextFieldController = TextEditingController();
  late final UserProvider UserProviderBindingInstance =
      Provider.of<UserProvider>(context, listen: false);

  bool isNotFullname = false;
  bool showIsLoading = false;

  updateIsNotFullname() {
    setState(() {
      isNotFullname = !isNotFullname;
    });
  }

  setLoading(bool loadingState) {
    setState(() {
      showIsLoading = loadingState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isNotFullname) CheckFullnameErrorText(),
            if (showIsLoading)
              Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  alignment: Alignment.center,
                  child: Text(
                    'Processing your transaction....please wait',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500),
                  )),
            TextFormField(
              controller: recipientTextFieldController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(15.0, 0, 0, 0),
                labelText: 'Recipient',
                hintText: 'Enter email  of recipient',
                hintStyle: TextStyle(fontSize: 12.0),
                border: OutlineInputBorder(),
                labelStyle: TextStyle(fontSize: 12.0),
              ),
              validator: (value) => SendMoneyFormSnippets.validateFormRecipient(
                  value, UserProviderBindingInstance.user!['user']['email']),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: amountTextFieldController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(15.0, 0, 0, 0),
                labelText: 'Amount',
                border: OutlineInputBorder(),
                labelStyle: TextStyle(fontSize: 12.0),
              ),
              validator: (value) =>
                  SendMoneyFormSnippets.validateFormAmount(value, 'amount'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => {
                      if (_formKey.currentState!.validate())
                        {
                          SendMoneyFormSnippets.sendMoney(
                              user: UserProviderBindingInstance.user!['user'],
                              setLoading: setLoading,
                              recipientEmail: recipientTextFieldController.text,
                              amount: amountTextFieldController.text,
                              context: context)
                        }
                    },
                child: Text('Send'),
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(40),
                    backgroundColor: MyAppColors.themeColor))
          ],
        ));
  }
}
