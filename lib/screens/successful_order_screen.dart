import 'dart:async';

import 'package:flutter/material.dart';

class SuccessOrderScreen extends StatefulWidget {
  const SuccessOrderScreen({super.key});

  @override
  State<SuccessOrderScreen> createState() => _SuccessOrderScreenState();
}

class _SuccessOrderScreenState extends State<SuccessOrderScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Successful"),
      ),
    );
  }
}
