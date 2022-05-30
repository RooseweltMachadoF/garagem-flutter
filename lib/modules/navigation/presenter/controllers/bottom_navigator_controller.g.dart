// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_navigator_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BottomNavigatorController on BottomNavigatorControllerBase, Store {
  late final _$indiceAtualAtom =
      Atom(name: 'BottomNavigatorControllerBase.indiceAtual', context: context);

  @override
  int get indiceAtual {
    _$indiceAtualAtom.reportRead();
    return super.indiceAtual;
  }

  @override
  set indiceAtual(int value) {
    _$indiceAtualAtom.reportWrite(value, super.indiceAtual, () {
      super.indiceAtual = value;
    });
  }

  late final _$viewsAtom =
      Atom(name: 'BottomNavigatorControllerBase.views', context: context);

  @override
  List<Widget> get views {
    _$viewsAtom.reportRead();
    return super.views;
  }

  @override
  set views(List<Widget> value) {
    _$viewsAtom.reportWrite(value, super.views, () {
      super.views = value;
    });
  }

  late final _$registroEntradaAsyncAction = AsyncAction(
      'BottomNavigatorControllerBase.registroEntrada',
      context: context);

  @override
  Future registroEntrada() {
    return _$registroEntradaAsyncAction.run(() => super.registroEntrada());
  }

  late final _$BottomNavigatorControllerBaseActionController =
      ActionController(name: 'BottomNavigatorControllerBase', context: context);

  @override
  dynamic alteraTela(int i) {
    final _$actionInfo = _$BottomNavigatorControllerBaseActionController
        .startAction(name: 'BottomNavigatorControllerBase.alteraTela');
    try {
      return super.alteraTela(i);
    } finally {
      _$BottomNavigatorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic adicionaVaga(BuildContext cntx) {
    final _$actionInfo = _$BottomNavigatorControllerBaseActionController
        .startAction(name: 'BottomNavigatorControllerBase.adicionaVaga');
    try {
      return super.adicionaVaga(cntx);
    } finally {
      _$BottomNavigatorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
indiceAtual: ${indiceAtual},
views: ${views}
    ''';
  }
}
