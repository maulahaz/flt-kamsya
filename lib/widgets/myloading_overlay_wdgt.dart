import 'package:flutter/material.dart';
import 'package:kamsya/configs/all_configs.dart';

class MyLoadingOverlay extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  MyLoadingOverlay({this.isLoading = false, required this.child, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      print('isLoading--------');
      return Center(
        child: SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(strokeWidth: 2, color: kBlue)),
      );
    }
    return child;
  }
}
