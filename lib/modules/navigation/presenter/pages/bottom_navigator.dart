import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/navigation/presenter/controllers/bottom_navigator_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigatorWidget extends StatefulWidget {
  const BottomNavigatorWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavigatorWidget> createState() => _BottomNavigatorWidgetState();
}

class _BottomNavigatorWidgetState extends State<BottomNavigatorWidget> {
  BottomNavigatorController? controller;
  @override
  void initState() {
    controller = BottomNavigatorController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        centerTitle: true,
        title: Column(
          children: [
            Container(
                height: 90,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(width: 3, color: Colors.grey)),
                child: SvgPicture.asset(
                  'assets/images/caminhao_image.svg',
                )),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Raro Garagem',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Observer(
        builder: (context) => controller!.views[controller!.indiceAtual],
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () => controller!.adicionaVaga(context),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.blueGrey,
        child: IconTheme(
            data: const IconThemeData(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () => controller!.alteraTela(0),
                    icon: const Icon(Icons.car_repair),
                  ),
                  IconButton(
                    onPressed: () => controller!.alteraTela(1),
                    icon: const Icon(Icons.stacked_bar_chart_outlined),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  IconButton(
                    onPressed: () => controller!.alteraTela(2),
                    icon: const Icon(Icons.list_alt_rounded),
                  ),
                  IconButton(
                    onPressed: () => controller!.alteraTela(3),
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
