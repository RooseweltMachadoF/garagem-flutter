import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DateItem extends StatelessWidget {
  final Timestamp data;
  const DateItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(data.toDate().day.toString() +
            '/' +
            data.toDate().month.toString() +
            '/' +
            data.toDate().year.toString()),
        const SizedBox(
          height: 5,
        ),
        Text(data.toDate().hour.toString() +
            ':' +
            data.toDate().minute.toString() +
            ':' +
            data.toDate().second.toString())
      ],
    );
  }
}
