import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SentVouchers extends StatelessWidget {
  final Response? vouchers;
  const SentVouchers({super.key, this.vouchers});

  @override
  Widget build(BuildContext context) {
    print(vouchers);
    return Text('Hie Moron');
  }
}
