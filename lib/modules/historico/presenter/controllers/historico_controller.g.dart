// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historico_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HistoricoController on HistoricoControllerBase, Store {
  late final _$dateTimeAtom =
      Atom(name: 'HistoricoControllerBase.dateTime', context: context);

  @override
  DateTime get dateTime {
    _$dateTimeAtom.reportRead();
    return super.dateTime;
  }

  @override
  set dateTime(DateTime value) {
    _$dateTimeAtom.reportWrite(value, super.dateTime, () {
      super.dateTime = value;
    });
  }

  late final _$registrosAtom =
      Atom(name: 'HistoricoControllerBase.registros', context: context);

  @override
  ObservableList<RegistroModel> get registros {
    _$registrosAtom.reportRead();
    return super.registros;
  }

  @override
  set registros(ObservableList<RegistroModel> value) {
    _$registrosAtom.reportWrite(value, super.registros, () {
      super.registros = value;
    });
  }

  late final _$selecionaTodosAtom =
      Atom(name: 'HistoricoControllerBase.selecionaTodos', context: context);

  @override
  bool get selecionaTodos {
    _$selecionaTodosAtom.reportRead();
    return super.selecionaTodos;
  }

  @override
  set selecionaTodos(bool value) {
    _$selecionaTodosAtom.reportWrite(value, super.selecionaTodos, () {
      super.selecionaTodos = value;
    });
  }

  late final _$selecionaDataAtom =
      Atom(name: 'HistoricoControllerBase.selecionaData', context: context);

  @override
  bool get selecionaData {
    _$selecionaDataAtom.reportRead();
    return super.selecionaData;
  }

  @override
  set selecionaData(bool value) {
    _$selecionaDataAtom.reportWrite(value, super.selecionaData, () {
      super.selecionaData = value;
    });
  }

  late final _$selectAllAsyncAction =
      AsyncAction('HistoricoControllerBase.selectAll', context: context);

  @override
  Future selectAll() {
    return _$selectAllAsyncAction.run(() => super.selectAll());
  }

  late final _$createPdfAsyncAction =
      AsyncAction('HistoricoControllerBase.createPdf', context: context);

  @override
  Future createPdf() {
    return _$createPdfAsyncAction.run(() => super.createPdf());
  }

  late final _$selectDateAsyncAction =
      AsyncAction('HistoricoControllerBase.selectDate', context: context);

  @override
  Future selectDate(DateTime date) {
    return _$selectDateAsyncAction.run(() => super.selectDate(date));
  }

  late final _$recuperaHistoricoAsyncAction = AsyncAction(
      'HistoricoControllerBase.recuperaHistorico',
      context: context);

  @override
  Future recuperaHistorico() {
    return _$recuperaHistoricoAsyncAction.run(() => super.recuperaHistorico());
  }

  @override
  String toString() {
    return '''
dateTime: ${dateTime},
registros: ${registros},
selecionaTodos: ${selecionaTodos},
selecionaData: ${selecionaData}
    ''';
  }
}
