import 'package:cloud_firestore/cloud_firestore.dart';

class VagasModel {
  final String numeroDaVaga;
  final bool disponivel;
  final String modelo;
  final String placa;
  final Timestamp horarioEntrada;

  VagasModel(
      {required this.numeroDaVaga,
      required this.disponivel,
      required this.modelo,
      required this.placa,
      required this.horarioEntrada});
  VagasModel copyWith({
    String? numeroDaVaga,
    bool? disponivel,
    String? modelo,
    String? placa,
    Timestamp? horarioEntrada,
  }) {
    return VagasModel(
        horarioEntrada: horarioEntrada ?? this.horarioEntrada,
        disponivel: disponivel ?? this.disponivel,
        numeroDaVaga: numeroDaVaga ?? this.numeroDaVaga,
        modelo: modelo ?? this.modelo,
        placa: placa ?? this.placa);
  }

  VagasModel clear({
    required String numeroDaVaga,
    required bool disponivel,
    required Timestamp horarioEntrada,
  }) {
    return VagasModel(
        horarioEntrada: horarioEntrada,
        disponivel: disponivel,
        numeroDaVaga: numeroDaVaga,
        modelo: "",
        placa: "");
  }

  factory VagasModel.fromMap(Map<String, dynamic> map) => VagasModel(
        numeroDaVaga: map['numeroDaVaga'],
        disponivel: map['disponivel'],
        modelo: map['modelo'],
        placa: map['placa'],
        horarioEntrada: map['horarioEntrada'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['numeroDaVaga'] = numeroDaVaga;
    data['disponivel'] = disponivel;
    data['horarioEntrada'] = horarioEntrada;
    data['modelo'] = modelo;
    data['placa'] = placa;
    return data;
  }
}
