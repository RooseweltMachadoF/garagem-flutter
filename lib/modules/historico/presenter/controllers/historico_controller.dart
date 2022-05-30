import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/historico/presenter/widgets/data_item.dart';
import 'package:flutter_application_1/modules/vagas/domain/entities/registro_model.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../widgets/pdf_mobile.dart';
import 'package:mobx/mobx.dart';
part 'historico_controller.g.dart';

class HistoricoController = HistoricoControllerBase with _$HistoricoController;

abstract class HistoricoControllerBase with Store {
  FirebaseFirestore db = FirebaseFirestore.instance;

  HistoricoControllerBase() {
    recuperaHistorico();
  }

  @observable
  DateTime dateTime = DateTime.now();

  @observable
  ObservableList<RegistroModel> registros = ObservableList<RegistroModel>();

  @observable
  bool selecionaTodos = true;

  @observable
  bool selecionaData = false;

  @action
  selectAll() async {
    registros.clear();
    selecionaTodos = true;
    selecionaData = false;
    recuperaHistorico();
  }

  @action
  createPdf() async {
    PdfDocument document = PdfDocument();
    final page = document.pages.add();
    page.graphics.drawString(
        'Planilha Raro Garagem!', PdfStandardFont(PdfFontFamily.helvetica, 30));

    page.graphics.drawImage(PdfBitmap(await _readImageData('caminhao.jpg')),
        Rect.fromLTWH(20, 100, 440, 550));

    PdfGrid grid = PdfGrid();
    grid.style = PdfGridStyle(
        font: PdfStandardFont(PdfFontFamily.helvetica, 15),
        cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2));

    grid.columns.add(count: 5);
    grid.headers.add(1);
    PdfGridRow header = grid.headers[0];
    header.cells[0].value = 'Vaga';
    header.cells[1].value = 'Placa';
    header.cells[2].value = 'Modelo';
    header.cells[3].value = 'Entrada';
    header.cells[4].value = 'Saída';

    registros.forEach((element) {
      PdfGridRow row = grid.rows.add();
      String entrada = element.horarioEntrada.toDate().day.toString() +
          '/' +
          element.horarioEntrada.toDate().month.toString() +
          '/' +
          element.horarioEntrada.toDate().year.toString() +
          '\n' +
          element.horarioEntrada.toDate().hour.toString() +
          ':' +
          element.horarioEntrada.toDate().minute.toString() +
          ':' +
          element.horarioEntrada.toDate().second.toString();
      String saida = element.horarioSaida.toDate().day.toString() +
          '/' +
          element.horarioSaida.toDate().month.toString() +
          '/' +
          element.horarioSaida.toDate().year.toString() +
          '\n' +
          element.horarioSaida.toDate().hour.toString() +
          ':' +
          element.horarioSaida.toDate().minute.toString() +
          ':' +
          element.horarioSaida.toDate().second.toString();
      row.cells[0].value = element.numeroDaVaga;
      row.cells[1].value = element.placa;
      row.cells[2].value = element.modelo;
      row.cells[3].value = entrada;
      row.cells[4].value = saida;
    });

    grid.draw(
        page: document.pages.add(), bounds: const Rect.fromLTWH(0, 0, 0, 0));
    List<int> bytes = document.save();
    document.dispose();

    saveAndLaunchFile(bytes, 'Output.pdf');
  }

  Future<Uint8List> _readImageData(String name) async {
    final data = await rootBundle.load('assets/images/$name');
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }

  @action
  selectDate(DateTime date) async {
    registros.clear();
    selecionaData = true;
    selecionaTodos = false;
    List<RegistroModel> aux = [];
    final snapshot = await db.collection('registros').get();
    snapshot.docs.forEach((element) {
      Map<String, dynamic> dados = element.data();
      registros.add(RegistroModel.fromMap(dados));
    });
    registros.forEach((element) {
      print(element.horarioEntrada.toDate().month.toString() +
          " ==" +
          date.month.toString());
      if (element.horarioEntrada.toDate().day == date.day &&
          element.horarioEntrada.toDate().month == date.month &&
          element.horarioEntrada.toDate().year == date.year) {
        aux.add(element);
      }
    });
    registros.clear();
    registros.addAll(aux);
  }

  @action
  recuperaHistorico() async {
    final snapshot = await db.collection('registros').get();
    for (var doc in snapshot.docs) {
      Map<String, dynamic> data = doc.data();
      if (data.isNotEmpty) {
        registros.add(RegistroModel.fromMap(data));
      }
    }
  }
}
