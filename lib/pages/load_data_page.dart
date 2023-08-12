import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mukuru_app/projects/BottomAppBar.dart';
import 'package:mukuru_app/projects/providers/user_provider.dart';
import 'package:mukuru_app/states.dart';
import 'package:provider/provider.dart';

class LoadData extends StatefulWidget {
  const LoadData({super.key});

  @override
  State<LoadData> createState() => _LoadDataState();
}

class _LoadDataState extends State<LoadData> {
  late final BuildContext widgetContext;
  late final VouchersProvider bindingInstance =
      Provider.of<VouchersProvider>(context, listen: false);
  late final UserProvider userBindingInstance =
      Provider.of<UserProvider>(context, listen: false);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (bindingInstance.vouchers == null) {
        bindingInstance.setVouchers(
            context, userBindingInstance.user!['user']['_id']);
      } else {
        context.go('/home');
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<VouchersProvider>(
        builder: (context, vouchersProviderModel, child) {
          if (vouchersProviderModel.vouchers == null) {
            return Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Loading data,please wait...'),
                SizedBox(
                  height: 20,
                ),
                CircularProgressIndicator()
              ],
            ));
          } else {
            return Center(
              child: Text('Something went wrong,try again'),
            );
          }
        },
      ),
      bottomNavigationBar: BottomBar(
        activePage: 'home',
      ),
    );
  }

  void redirectScreen() {
    context.go('/home');
  }
}
