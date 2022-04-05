import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:minhasmedidas/src/components/float_button_personalized.dart';
import 'package:minhasmedidas/src/components/row_medida.dart';
import 'package:minhasmedidas/src/models/medidas.dart';
import 'package:minhasmedidas/src/models/people.dart';
import 'package:minhasmedidas/src/pages/medidas/formulario_medidas.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateFormat dataCompleta = DateFormat('dd MM yyyy');
    DateFormat horario = DateFormat('HH:mm:ss');
    ScrollController _scrollController = ScrollController();

    _scrollTop() {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        title: Consumer<People>(
          builder: (context, data, child) {
            return Text(
              'Bem vindo, ${data.name}',
              style: const TextStyle(color: Colors.white),
            );
          },
        ),
        leading: const Icon(
          Icons.air,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: Column(
          children: [
            Consumer<Medidas>(
              builder: ((context, data, child) {
                final medidas = data.listaMedidas;
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  controller: _scrollController,
                  shrinkWrap: true,
                  itemCount: medidas.length,
                  itemBuilder: (context, index) {
                    _scrollTop();
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      dataCompleta.format(medidas[index].date),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      //' as ${medidas[index].date.hour}:${medidas[index].date.minute}:${medidas[index].date.second}',
                                      horario.format(medidas[index].date),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RowMedida('Altura', medidas[index].altura,
                                          'cm'),
                                      RowMedida(
                                          'Peso', medidas[index].peso, 'kg'),
                                      RowMedida(
                                          'Peito', medidas[index].peito, 'cm'),
                                      RowMedida(
                                          'Ombro', medidas[index].ombro, 'cm'),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RowMedida('Cintura',
                                          medidas[index].cintura, 'cm'),
                                      RowMedida(
                                          'Coxa', medidas[index].coxa, 'cm'),
                                      RowMedida('Panturilha',
                                          medidas[index].panturilha, 'cm'),
                                      RowMedida(
                                          'Braço', medidas[index].braco, 'cm'),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatButtonPersonalized(
          'Atualizar Medidas', Icons.replay_outlined, () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormulariosMedidas(),
            ));
      }),
    );
  }
}
