import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../historico/presenter/widgets/data_item.dart';
import '../../../historico/presenter/widgets/historico_item.dart';
import '../controllers/search_controller.dart';

class SearchPage extends StatefulWidget {
  final SearchController? searchController;
  const SearchPage({Key? key, this.searchController}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late SearchController searchController;
  @override
  void initState() {
    searchController = widget.searchController ?? SearchController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 30.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 300.w,
                        child: TextFormField(
                          controller: searchController.searchController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Pesquise por placa'),
                          cursorColor: Colors.blueGrey,
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () => searchController.busca(),
                          icon: Icon(
                            Icons.search,
                            size: 20.h,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                const HistoricoItem(
                  horarioEntrada: Text('Entrada'),
                  horarioSaida: Text('Saída'),
                  modelo: 'Modelo',
                  numeroDaVaga: 'Vaga',
                  placa: 'Placa',
                  colors: Colors.teal,
                ),
                Observer(builder: (context) {
                  return searchController.registros.isEmpty
                      ? SizedBox(
                          height: 300.h,
                          child: const Center(
                            child: Text('Não há registros'),
                          ),
                        )
                      : SizedBox(
                          height: 300.h,
                          child: ListView.builder(
                              itemCount: searchController.registros.length,
                              itemBuilder: (_, index) {
                                Color cor =
                                    index % 2 == 0 ? Colors.white : Colors.grey;
                                Color corText = index % 2 == 0
                                    ? Colors.white
                                    : Colors.black;

                                return HistoricoItem(
                                  numeroDaVaga: searchController
                                      .registros[index].numeroDaVaga,
                                  horarioEntrada: DateItem(
                                      data: searchController
                                          .registros[index].horarioEntrada),
                                  horarioSaida: DateItem(
                                      data: searchController
                                          .registros[index].horarioSaida),
                                  modelo:
                                      searchController.registros[index].modelo,
                                  placa:
                                      searchController.registros[index].placa,
                                  colors: cor,
                                  textColor: corText,
                                );
                              }),
                        );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
