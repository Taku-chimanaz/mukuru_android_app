import 'package:flutter/material.dart';
import 'package:mukuru_app/projects/colors.dart';
import 'package:mukuru_app/projects/customWidgets/checkFullnameErrorText.dart';
import 'package:mukuru_app/projects/snippets/SendMoneyFormSnippets.dart';

class SendMoneyForm extends StatefulWidget {
  const SendMoneyForm({super.key});

  @override
  State<SendMoneyForm> createState() => _SendMoneyFormState();
}

class _SendMoneyFormState extends State<SendMoneyForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final recipientTextFieldController = TextEditingController();
  final amountTextFieldController = TextEditingController();

  bool isNotFullname = false;

  updateIsNotFullname() {
    setState(() {
      isNotFullname = !isNotFullname;
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
                  suffixIcon: IconButton(
                    color: MyAppColors.themeColor,
                    onPressed: () => SendMoneyFormSnippets.checkIfFullName(
                        recipientTextFieldController.text, updateIsNotFullname),
                    icon: Icon(Icons.search),
                  )),
              validator: (value) => SendMoneyFormSnippets.validateFormRecipient(
                  value, 'recipient'),
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
