import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../../../vagas/domain/entities/registro_model.dart';
import 'package:mobx/mobx.dart';

part 'search_controller.g.dart';

class SearchController = SearchControllerBase with _$SearchController;

abstract class SearchControllerBase with Store {
  TextEditingController searchController = TextEditingController();
  FirebaseFirestore db = FirebaseFirestore.instance;

  @observable
  ObservableList<RegistroModel> registros = ObservableList<RegistroModel>();

  @action
  busca() async {
    final snapshot = await db
        .collection('registros')
        .where('placa', isEqualTo: searchController.text)
        .get();
    snapshot.docs.forEach((element) {
      Map<String, dynamic> dados = element.data();
      registros.add(RegistroModel.fromMap(dados));
    });
  }
}
