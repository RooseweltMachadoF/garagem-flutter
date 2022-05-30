import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoricoItem extends StatefulWidget {
  final Widget horarioEntrada;
  final Widget horarioSaida;
  final String placa;
  final String modelo;
  final String numeroDaVaga;
  final Color? colors;
  final Color? textColor;

  const HistoricoItem(
      {Key? key,
      required this.numeroDaVaga,
      required this.horarioEntrada,
      required this.horarioSaida,
      required this.modelo,
      required this.placa,
      this.colors,
      this.textColor})
      : super(key: key);

  @override
  State<HistoricoItem> createState() => _HistoricoItemState();
}

class _HistoricoItemState extends State<HistoricoItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w, right: 8.w),
      child: Container(
        height: 70.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: widget.colors ?? Colors.white,
          border: Border.all(width: 1, color: Colors.grey),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 35.w,
              child: Center(
                  child: Text(
                widget.numeroDaVaga,
                style: TextStyle(color: widget.textColor ?? Colors.black),
              )),
            ),
            SizedBox(
              width: 58.w,
              child: Center(child: Text(widget.placa)),
            ),
            SizedBox(
              width: 60.w,
              child: Center(child: Text(widget.modelo)),
            ),
            SizedBox(
              width: 80.w,
              child: Center(child: widget.horarioEntrada),
            ),
            SizedBox(
              width: 80.w,
              child: Center(child: widget.horarioSaida),
            ),
          ],
        ),
      ),
    );
  }
}
