import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/charts/presenter/controllers/charts_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChartsPage extends StatefulWidget {
  const ChartsPage({Key? key}) : super(key: key);

  @override
  State<ChartsPage> createState() => _ChartsPageState();
}

class _ChartsPageState extends State<ChartsPage> {
  final colorList = <Color>[Colors.greenAccent, Colors.red];
  late ChartsController controller;

  @override
  void initState() {
    controller = ChartsController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 30.h, left: 12.w, right: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Gráfico de lotação',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 50.h,
              ),
              Observer(builder: (_) {
                return Container(
                  height: 300.h,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.5),
                          blurRadius: 20.0,
                          spreadRadius: 1.0,
                          offset: const Offset(
                            1.0,
                            5.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(width: 2, color: Colors.blueGrey)),
                  child: PieChart(
                    dataMap: controller.dataMap,
                    chartType: ChartType.ring,
                    baseChartColor: Colors.grey[50]!.withOpacity(0.15),
                    colorList: colorList,
                    chartValuesOptions: const ChartValuesOptions(
                      showChartValuesInPercentage: true,
                    ),
                    totalValue: controller.vagas.length.toDouble(),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
