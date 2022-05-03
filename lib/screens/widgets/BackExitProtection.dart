import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackExitProtection extends StatefulWidget {
  const BackExitProtection({required this.child});

  final Widget child;

  @override
  _BackExitProtectionState createState() => _BackExitProtectionState();
}

class _BackExitProtectionState extends State<BackExitProtection> {
  DateTime? lastBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (lastBackPressTime == null ||
        now.difference(lastBackPressTime!) > const Duration(seconds: 2)) {
      lastBackPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(''),
      ));
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: widget.child,
      onWillPop: onWillPop,
    );
  }
}