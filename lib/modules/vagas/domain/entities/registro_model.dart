import 'package:cloud_firestore/cloud_firestore.dart';

class RegistroModel {
  final Timestamp horarioEntrada;
  final Timestamp horarioSaida;
  final String placa;
  final String modelo;
  final String numeroDaVaga;

  RegistroModel(
      {required this.numeroDaVaga,
      required this.horarioEntrada,
      required this.horarioSaida,
      required this.modelo,
      required this.placa});

  RegistroModel copyWith(
      {String? numeroDaVaga,
      Timestamp? horarioEntrada,
      Timestamp? horarioSaida,
      String? modelo,
      String? placa}) {
    return RegistroModel(
        horarioSaida: horarioSaida ?? this.horarioSaida,
        horarioEntrada: horarioEntrada ?? this.horarioEntrada,
        numeroDaVaga: numeroDaVaga ?? this.numeroDaVaga,
        modelo: modelo ?? this.modelo,
        placa: placa ?? this.placa);
  }

  factory RegistroModel.fromMap(Map<String, dynamic> map) => RegistroModel(
        numeroDaVaga: map['numeroDaVaga'],
        horarioSaida: map['horarioSaida'],
        horarioEntrada: map['horarioEntrada'],
        modelo: map['modelo'],
        placa: map['placa'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['numeroDaVaga'] = numeroDaVaga;
    data['horarioSaida'] = horarioSaida;
    data['horarioEntrada'] = horarioEntrada;
    data['modelo'] = modelo;
    data['placa'] = placa;
    return data;
  }
}
