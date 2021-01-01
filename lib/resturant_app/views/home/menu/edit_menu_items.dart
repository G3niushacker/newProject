import 'package:flutter/material.dart';

class EditMenuItem extends StatefulWidget {
  @override
  _EditMenuItemState createState() => _EditMenuItemState();
}

class _EditMenuItemState extends State<EditMenuItem> {
  int text = 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Menu Items"),
      ),
      body:
          Center(child: Text('${0} . ${text.toDouble().truncate().bitLength}')),
    );
  }
}
