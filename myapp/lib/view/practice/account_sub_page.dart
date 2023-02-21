import 'package:flutter/material.dart';

class AccountSubPage extends StatefulWidget {
  const AccountSubPage({Key? key}) : super(key: key);

  @override
  State<AccountSubPage> createState() => _AccountSubPageState();
}

class _AccountSubPageState extends State<AccountSubPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Text('アカウントページ')
      ),
    );
  }
}
