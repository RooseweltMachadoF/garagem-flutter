import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VagaItem extends StatefulWidget {
  final String text;
  final bool disponivel;
  const VagaItem({Key? key, required this.text, required this.disponivel})
      : super(key: key);

  @override
  State<VagaItem> createState() => _VagaItemState();
}

class _VagaItemState extends State<VagaItem> {
  LinearGradient gradientGreen = const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Colors.greenAccent,
      Colors.teal,
    ],
  );
  LinearGradient gradientRed = const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [Colors.redAccent, Colors.red],
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 50.w,
      decoration: BoxDecoration(
        border: Border.all(width: 3.h, color: Colors.grey),
        gradient: widget.disponivel ? gradientGreen : gradientRed,
      ),
      child: Center(child: Text(widget.text)),
    );
  }
}
