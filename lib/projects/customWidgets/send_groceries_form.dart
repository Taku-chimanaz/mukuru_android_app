import 'package:flutter/material.dart';
import 'package:mukuru_app/projects/colors.dart';
import 'package:mukuru_app/projects/customWidgets/checkFullnameErrorText.dart';
import 'package:mukuru_app/projects/snippets/SendMoneyFormSnippets.dart';
import 'package:mukuru_app/projects/providers/user_provider.dart';
import 'package:mukuru_app/projects/snippets/send_groceries_snippets.dart';
import 'package:mukuru_app/states.dart';
import 'package:provider/provider.dart';

class SendGroceriesForm extends StatefulWidget {
  const SendGroceriesForm({super.key});

  @override
  State<SendGroceriesForm> createState() => _SendGroceriesFormState();
}

class _SendGroceriesFormState extends State<SendGroceriesForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final recipientTextFieldController = TextEditingController();
  late final UserProvider UserProviderBindingInstance =
      Provider.of<UserProvider>(context, listen: false);
  late final VouchersProvider VoucherProviderBindingInstance =
      Provider.of<VouchersProvider>(context, listen: false);
  final List<String> groceriesVouchers = <String>['\$30', '\$50', '\$100'];
  late String selectedVoucher;

  @override
  void initState() {
    super.initState();
    selectedVoucher = groceriesVouchers.first;
  }

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

  resetTheFormFields() {
    setState(() {
      recipientTextFieldController.text = "";
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
                  value, UserProviderBindingInstance.user!.email),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Select Voucher Amount: ',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            DropdownMenu<String>(
                width: MediaQuery.of(context).size.width - 32,
                initialSelection: groceriesVouchers.first,
                onSelected: (value) {
                  setState(() {
                    selectedVoucher = value!;
                  });
                },
                dropdownMenuEntries: groceriesVouchers
                    .map<DropdownMenuEntry<String>>((String voucher) {
                  return DropdownMenuEntry(value: voucher, label: voucher);
                }).toList()),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => {
                      if (_formKey.currentState!.validate())
                        {
                          SendGroceriesSnippets.sendGroceries(
                              user: UserProviderBindingInstance.user,
                              resetTheFormFields: resetTheFormFields,
                              addVoucherToList: VoucherProviderBindingInstance
                                  .addVoucherToList,
                              updateUserBalance:
                                  UserProviderBindingInstance.updateUserBalance,
                              setLoading: setLoading,
                              recipientEmail: recipientTextFieldController.text,
                              amount: selectedVoucher.split('\$')[1],
                              context: context)
                        }
                    },
                child: Text('Send'),
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    backgroundColor: MyAppColors.themeColor)),
          ],
        ));
  }
}
