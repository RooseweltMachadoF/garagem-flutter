import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/charts/presenter/pages/charts_page.dart';
import 'package:flutter_application_1/modules/historico/presenter/pages/historico_page.dart';
import 'package:flutter_application_1/modules/navigation/presenter/widgets/dialog_cadastro.dart';
import 'package:flutter_application_1/modules/search/presenter/pages/search_page.dart';
import 'package:flutter_application_1/modules/vagas/presenter/pages/vagas_page.dart';

import 'package:mobx/mobx.dart';

import '../../../vagas/domain/entities/vagas_model.dart';
part 'bottom_navigator_controller.g.dart';

class BottomNavigatorController = BottomNavigatorControllerBase
    with _$BottomNavigatorController;

abstract class BottomNavigatorControllerBase with Store {
  TextEditingController numeroDaVagaController = TextEditingController();
  TextEditingController modeloController = TextEditingController();
  TextEditingController placaController = TextEditingController();
  FirebaseFirestore db = FirebaseFirestore.instance;
  @observable
  int indiceAtual = 0;

  @observable
  List<Widget> views = [
    const VagasPage(),
    const ChartsPage(),
    const HistoricoPage(),
    const SearchPage(),
  ];

  @action
  alteraTela(int i) {
    indiceAtual = i;
  }

  @action
  adicionaVaga(BuildContext cntx) {
    return showDialog(
        context: cntx,
        builder: (_) {
          return const DialogCadastro();
        });
  }

  @action
  registroEntrada() async {
    VagasModel vaga = VagasModel(
        numeroDaVaga: numeroDaVagaController.text,
        disponivel: false,
        modelo: modeloController.text,
        placa: placaController.text,
        horarioEntrada: Timestamp.now());
    await db
        .collection('vagas')
        .doc(numeroDaVagaController.text)
        .set(vaga.toJson());
    modeloController.clear();
    placaController.clear();
  }
}
