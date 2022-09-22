import 'package:flutter/material.dart';

class SubRegisterPage extends StatefulWidget {
  const SubRegisterPage({Key? key}) : super(key: key);

  @override
  State<SubRegisterPage> createState() => _SubRegisterPageState();
}

class _SubRegisterPageState extends State<SubRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Form(
              child: Column(
            children: [Text('SUB PAGE')],
          ))
        ],
      ),
    );
  }
}
