import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/historico/presenter/controllers/historico_controller.dart';
import 'package:flutter_application_1/modules/historico/presenter/widgets/data_item.dart';
import 'package:flutter_application_1/modules/historico/presenter/widgets/historico_item.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoricoPage extends StatefulWidget {
  const HistoricoPage({Key? key}) : super(key: key);

  @override
  State<HistoricoPage> createState() => _HistoricoPageState();
}

class _HistoricoPageState extends State<HistoricoPage> {
  late HistoricoController controller;
  @override
  void initState() {
    controller = HistoricoController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () => controller.selectAll(),
                  child: Observer(builder: (_) {
                    return Container(
                      height: 50.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          color: controller.selecionaTodos
                              ? Colors.blueGrey
                              : Colors.white,
                          border: Border.all(width: 2.h, color: Colors.grey),
                          borderRadius: BorderRadius.circular(20.r)),
                      child: const Center(child: Text('Todos')),
                    );
                  }),
                ),
                InkWell(
                  onTap: () => controller.selectDate(controller.dateTime),
                  child: Observer(builder: (_) {
                    return Container(
                      height: 50.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                          color: controller.selecionaData
                              ? Colors.blueGrey
                              : Colors.white,
                          border: Border.all(width: 2.h, color: Colors.grey),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(child: Text('Pesquisar por data')),
                    );
                  }),
                ),
                Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 2.h, color: Colors.grey),
                        borderRadius: BorderRadius.circular(20)),
                    child: IconButton(
                        onPressed: () => controller.createPdf(),
                        icon: const Icon(Icons.save)))
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Observer(builder: ((context) {
              return controller.selecionaTodos
                  ? const SizedBox()
                  : Padding(
                      padding: EdgeInsets.all(8.0.h),
                      child: _construirSeletorData(context),
                    );
            })),
            SizedBox(
              height: 10.h,
            ),
            const HistoricoItem(
              horarioEntrada: Text('Entrada'),
              horarioSaida: Text('Saída'),
              modelo: 'Modelo',
              numeroDaVaga: 'Vaga',
              placa: 'Placa',
              colors: Colors.teal,
            ),
            Observer(builder: (context) {
              return controller.registros.isEmpty
                  ? SizedBox(
                      height: 500.h,
                      child: const Center(
                        child: Text('Não há registros'),
                      ),
                    )
                  : SizedBox(
                      height: 500.h,
                      child: ListView.builder(
                          itemCount: controller.registros.length,
                          itemBuilder: (_, index) {
                            Color cor =
                                index % 2 == 0 ? Colors.white : Colors.grey;
                            Color corText =
                                index % 2 == 0 ? Colors.white : Colors.black;

                            return controller.registros.isEmpty
                                ? const Center(
                                    child: Text('Não há registros'),
                                  )
                                : HistoricoItem(
                                    numeroDaVaga: controller
                                        .registros[index].numeroDaVaga,
                                    horarioEntrada: DateItem(
                                        data: controller
                                            .registros[index].horarioEntrada),
                                    horarioSaida: DateItem(
                                        data: controller
                                            .registros[index].horarioSaida),
                                    modelo: controller.registros[index].modelo,
                                    placa: controller.registros[index].placa,
                                    colors: cor,
                                    textColor: corText,
                                  );
                          }),
                    );
            }),
          ],
        ),
      ),
    );
  }

  Widget _construirSeletorData(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  CupertinoIcons.calendar,
                  color: CupertinoColors.lightBackgroundGray,
                  size: 28.h,
                ),
                SizedBox(width: 6.w),
                const Text(
                  'Data de pesquisa',
                ),
              ],
            ),
            Text(
              controller.dateTime.day.toString() +
                  '/' +
                  controller.dateTime.month.toString() +
                  '/' +
                  controller.dateTime.year.toString(),
            ),
          ],
        ),
        Container(
          height: 100.h,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: controller.dateTime,
            onDateTimeChanged: (novaDataEntrega) {
              controller.selectDate(novaDataEntrega);
            },
          ),
        ),
      ],
    );
  }
}
