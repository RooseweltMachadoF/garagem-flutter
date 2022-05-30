// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchController on SearchControllerBase, Store {
  late final _$registrosAtom =
      Atom(name: 'SearchControllerBase.registros', context: context);

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

  late final _$buscaAsyncAction =
      AsyncAction('SearchControllerBase.busca', context: context);

  @override
  Future busca() {
    return _$buscaAsyncAction.run(() => super.busca());
  }

  @override
  String toString() {
    return '''
registros: ${registros}
    ''';
  }
}
