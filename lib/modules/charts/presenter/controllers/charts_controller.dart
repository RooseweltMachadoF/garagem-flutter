import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/modules/vagas/domain/entities/vagas_model.dart';
import 'package:mobx/mobx.dart';
part 'charts_controller.g.dart';

class ChartsController = ChartsControllerBase with _$ChartsController;

abstract class ChartsControllerBase with Store {
  FirebaseFirestore db = FirebaseFirestore.instance;

  ChartsControllerBase() {
    recuperaLotacao();
  }

  @observable
  Map<String, double> dataMap = <String, double>{
    "Livres": 0,
    "Ocupados": 0,
  };

  @observable
  List<VagasModel> vagas = [];

  @action
  recuperaLotacao() async {
    final snapshot = await db.collection("vagas").get();

    int qtdLivre = 0;
    int qtdOcupado = 0;

    for (var doc in snapshot.docs) {
      Map<String, dynamic> data = doc.data();
      if (data.isNotEmpty) {
        vagas.add(VagasModel.fromMap(data));
      }
    }

    vagas.forEach((element) {
      if (element.disponivel) {
        qtdLivre++;
      } else {
        qtdOcupado++;
      }
    });

    dataMap = <String, double>{
      "Livres": qtdLivre.toDouble(),
      "Ocupados": qtdOcupado.toDouble(),
    };
  }
}
