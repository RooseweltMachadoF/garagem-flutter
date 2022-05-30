// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charts_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChartsController on ChartsControllerBase, Store {
  late final _$dataMapAtom =
      Atom(name: 'ChartsControllerBase.dataMap', context: context);

  @override
  Map<String, double> get dataMap {
    _$dataMapAtom.reportRead();
    return super.dataMap;
  }

  @override
  set dataMap(Map<String, double> value) {
    _$dataMapAtom.reportWrite(value, super.dataMap, () {
      super.dataMap = value;
    });
  }

  late final _$vagasAtom =
      Atom(name: 'ChartsControllerBase.vagas', context: context);

  @override
  List<VagasModel> get vagas {
    _$vagasAtom.reportRead();
    return super.vagas;
  }

  @override
  set vagas(List<VagasModel> value) {
    _$vagasAtom.reportWrite(value, super.vagas, () {
      super.vagas = value;
    });
  }

  late final _$recuperaLotacaoAsyncAction =
      AsyncAction('ChartsControllerBase.recuperaLotacao', context: context);

  @override
  Future recuperaLotacao() {
    return _$recuperaLotacaoAsyncAction.run(() => super.recuperaLotacao());
  }

  @override
  String toString() {
    return '''
dataMap: ${dataMap},
vagas: ${vagas}
    ''';
  }
}
