import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/navigation/presenter/controllers/bottom_navigator_controller.dart';

import '../../../vagas/presenter/controllers/vagas_controller.dart';

class DialogCadastro extends StatelessWidget {
  final VagasController? controllerVagas;
  final String? numeroVaga;
  final String? modelo;
  final String? placa;
  const DialogCadastro(
      {Key? key,
      this.controllerVagas,
      this.numeroVaga,
      this.modelo,
      this.placa})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = BottomNavigatorController();
    return Dialog(
      child: SizedBox(
        height: 410,
        width: 350,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Registre uma entrada",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Número da vaga:",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400)),
              numeroVaga != null
                  ? Text(numeroVaga!)
                  : TextField(
                      controller: controller.numeroDaVagaController,
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                      cursorColor: Colors.blueGrey,
                      style:
                          const TextStyle(color: Colors.blueGrey, fontSize: 18),
                    ),
              const SizedBox(
                height: 12,
              ),
              const Text("Modelo do veículo",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400)),
              TextField(
                controller: controllerVagas != null
                    ? controllerVagas!.modeloController
                    : controller.modeloController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                cursorColor: Colors.blueGrey,
                style: const TextStyle(color: Colors.blueGrey, fontSize: 18),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text("Placa do veículo"),
              TextField(
                controller: controllerVagas != null
                    ? controllerVagas!.placaController
                    : controller.placaController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                cursorColor: Colors.blueGrey,
                style: const TextStyle(color: Colors.blueGrey, fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  width: 200,
                  child: OutlinedButton(
                    child: const Text('Registrar'),
                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.teal,
                    ),
                    onPressed: () async {
                      if (controllerVagas != null &&
                          controllerVagas!.modeloController.text != '' &&
                          controllerVagas!.placaController.text != '') {
                        await controllerVagas!.registroEntrada(
                          numeroDaVaga: numeroVaga!,
                        );
                        _showToast(context, "Salvo !");
                        Navigator.pop(context);
                      } else {
                        await controller.registroEntrada();
                        _showToast(context, "Salvo !");
                        Navigator.pop(context);
                      }
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

  void _showToast(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
            label: 'Fechar', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
