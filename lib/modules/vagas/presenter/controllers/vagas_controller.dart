import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/navigation/presenter/widgets/dialog_cadastro.dart';
import 'package:flutter_application_1/modules/vagas/domain/entities/registro_model.dart';
import 'package:mobx/mobx.dart';

import '../../domain/entities/vagas_model.dart';
part 'vagas_controller.g.dart';

class VagasController = VagasControllerBase with _$VagasController;

abstract class VagasControllerBase with Store {
  FirebaseFirestore db = FirebaseFirestore.instance;
  TextEditingController modeloController = TextEditingController();
  TextEditingController placaController = TextEditingController();
  VagasControllerBase() {
    qtdDisponiveis();
  }
  @observable
  List<VagasModel> vagas = [];

  @observable
  int disponiveisQtd = 0;

  @action
  recuperaVagas() async {
    final snapshot = await db.collection("vagas").get();
    for (var doc in snapshot.docs) {
      Map<String, dynamic> data = doc.data();
      if (data.isNotEmpty) {
        vagas.add(VagasModel.fromMap(data));
      }
    }
  }

  @action
  registroEntrada({required String numeroDaVaga}) async {
    VagasModel vaga = VagasModel(
        numeroDaVaga: numeroDaVaga,
        disponivel: false,
        modelo: modeloController.text,
        placa: placaController.text,
        horarioEntrada: Timestamp.now());
    await db.collection('vagas').doc(numeroDaVaga).set(vaga.toJson());
    modeloController.clear();
    placaController.clear();
  }

  @action
  registraSaida(String numeroDaVaga) async {
    final snapshot = await db.collection("vagas").get();
    Map<String, dynamic> data = snapshot.docs
        .firstWhere((element) => element['numeroDaVaga'] == numeroDaVaga)
        .data();
    VagasModel vaga = VagasModel.fromMap(data);
    RegistroModel registro = RegistroModel(
        numeroDaVaga: numeroDaVaga,
        horarioEntrada: vaga.horarioEntrada,
        horarioSaida: Timestamp.now(),
        modelo: vaga.modelo,
        placa: vaga.placa);
    vaga = vaga.clear(
        numeroDaVaga: numeroDaVaga,
        horarioEntrada: Timestamp.now(),
        disponivel: true);
    await db.collection("registros").doc().set(registro.toJson());
    await db.collection("vagas").doc(vaga.numeroDaVaga).set(vaga.toJson());
  }

  @action
  qtdDisponiveis() async {
    final snapshot = await db.collection("vagas").get();
    for (var doc in snapshot.docs) {
      Map<String, dynamic> data = doc.data();
      if (data.isNotEmpty) {
        vagas.add(VagasModel.fromMap(data));
      }
    }

    disponiveisQtd = vagas.where((element) => element.disponivel).length;
  }
}
