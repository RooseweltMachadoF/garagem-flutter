import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/vagas/presenter/controllers/vagas_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SaidaWidget extends StatefulWidget {
  final String numeroDaVaga;
  final String modelo;
  final String placa;
  final Timestamp horarioEntrada;
  final VagasController? controllerVagas;
  const SaidaWidget(
      {Key? key,
      required this.numeroDaVaga,
      this.controllerVagas,
      required this.modelo,
      required this.placa,
      required this.horarioEntrada})
      : super(key: key);

  @override
  State<SaidaWidget> createState() => _SaidaWidgetState();
}

class _SaidaWidgetState extends State<SaidaWidget> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 350.h,
        width: 350.w,
        child: Padding(
          padding: EdgeInsets.all(8.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Registre uma saída",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Text("Número da vaga: ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400)),
                  Text(widget.numeroDaVaga,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400)),
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                children: [
                  Text("Modelo do veículo: ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400)),
                  Text(widget.modelo,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400)),
                ],
              ),
              SizedBox(
                height: 12.sp,
              ),
              Row(
                children: [
                  Text("Placa do veículo: ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400)),
                  Text(widget.placa,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400)),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Text("Horário de entrada: ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400)),
                  Text(
                      widget.horarioEntrada.toDate().hour.toString() +
                          ':' +
                          widget.horarioEntrada.toDate().minute.toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400)),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text("Data da entrada: ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400)),
                  Text(
                      widget.horarioEntrada.toDate().day.toString() +
                          '/' +
                          widget.horarioEntrada.toDate().month.toString() +
                          '/' +
                          widget.horarioEntrada.toDate().year.toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400)),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: SizedBox(
                  width: 200.w,
                  child: OutlinedButton(
                    child: const Text('Saída'),
                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () async {
                      await widget.controllerVagas!
                          .registraSaida(widget.numeroDaVaga);
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
