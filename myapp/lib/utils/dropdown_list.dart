import 'package:flutter/material.dart';

const  List<String> choices = <String>['国語', '数学', '英語', '理科', '社会'];

class DropdownList extends StatefulWidget {
  const DropdownList({Key? key}) : super(key: key);

  @override
  State<DropdownList> createState() => _DropdownListState();
}

class _DropdownListState extends State<DropdownList> {
  String isSelectedValue = choices.first;

  @override
  Widget build(BuildContext context) {
  return DropdownButton(
    items: choices.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
      value: isSelectedValue,
      onChanged: (String? value) {
        setState(() {
          isSelectedValue = value!;
        });
      },
    );
    }
  }