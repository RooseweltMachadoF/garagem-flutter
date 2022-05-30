import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/navigation/presenter/widgets/dialog_cadastro.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/modules/vagas/presenter/controllers/vagas_controller.dart';
import 'package:flutter_application_1/modules/vagas/presenter/widgets/vaga_item.dart';
import 'package:flutter_application_1/modules/vagas/presenter/widgets/widget_saida.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class VagasPage extends StatefulWidget {
  const VagasPage({Key? key}) : super(key: key);

  @override
  State<VagasPage> createState() => _VagasPageState();
}

class _VagasPageState extends State<VagasPage> {
  VagasController? controller;
  @override
  void initState() {
    controller = VagasController();
    // controller!.qtdDisponiveis();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: Colors.black87,
      minimumSize: Size(88, 36),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 30.h, left: 12.w, right: 12.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Vagas disponíveis ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  Observer(builder: (_) {
                    return Text(
                      controller!.disponiveisQtd.toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w700),
                    );
                  })
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 50.h,
                width: 500.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 2, color: Colors.green)),
                child: const Center(
                  child: Text(
                      'Clique na vaga para registrar uma entrada ou saída !'),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('vagas')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    }
                    // Map<String, dynamic> data = snapshot.data.docs.;
                    return SizedBox(
                      height: 300.h,
                      child: GridView.builder(
                          itemCount: snapshot.data!.docs.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                          ),
                          itemBuilder: (_, index) {
                            return Padding(
                              padding: EdgeInsets.all(8.0.h),
                              child: InkWell(
                                onTap: () {
                                  if (snapshot.data!.docs[index]
                                      ['disponivel']) {
                                    showDialog(
                                        context: context,
                                        builder: (_) {
                                          return DialogCadastro(
                                            numeroVaga: snapshot.data!
                                                .docs[index]['numeroDaVaga'],
                                            modelo: snapshot.data!.docs[index]
                                                ['modelo'],
                                            placa: snapshot.data!.docs[index]
                                                ['placa'],
                                            controllerVagas: controller,
                                          );
                                        });
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (_) {
                                          return SaidaWidget(
                                            numeroDaVaga: snapshot.data!
                                                .docs[index]['numeroDaVaga'],
                                            modelo: snapshot.data!.docs[index]
                                                ['modelo'],
                                            placa: snapshot.data!.docs[index]
                                                ['placa'],
                                            horarioEntrada: snapshot.data!
                                                .docs[index]['horarioEntrada'],
                                            controllerVagas: controller,
                                          );
                                        });
                                  }
                                },
                                child: VagaItem(
                                    text: snapshot.data!.docs[index]
                                        ['numeroDaVaga'],
                                    disponivel: snapshot.data!.docs[index]
                                        ['disponivel']),
                              ),
                            );
                          }),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
