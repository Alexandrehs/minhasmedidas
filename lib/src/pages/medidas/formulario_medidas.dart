import 'package:flutter/material.dart';
import 'package:minhasmedidas/src/components/float_button_personalized.dart';
import 'package:minhasmedidas/src/models/medida.dart';
import 'package:minhasmedidas/src/models/medidas.dart';
import 'package:provider/provider.dart';

class FormulariosMedidas extends StatelessWidget {
  FormulariosMedidas({Key? key}) : super(key: key);
  final inputAlturaController = TextEditingController();
  final inputPesoController = TextEditingController();
  final inputPeitoController = TextEditingController();
  final inputOmbroController = TextEditingController();
  final inputCinturaController = TextEditingController();
  final inputCoxaController = TextEditingController();
  final inputPanturilhaController = TextEditingController();
  final inputBracoController = TextEditingController();
  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Suas Medidas',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Form(
        key: _keyForm,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  controller: inputAlturaController,
                  decoration: const InputDecoration(
                    labelText: 'Altura',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor insira sua altura.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  controller: inputPesoController,
                  decoration: const InputDecoration(
                    labelText: 'Peso',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor insira seu peso.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  controller: inputPeitoController,
                  decoration: const InputDecoration(
                    labelText: 'Peito',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor insira seu peito.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  controller: inputOmbroController,
                  decoration: const InputDecoration(
                    labelText: 'Ombro',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor insira seu ombro.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  controller: inputCinturaController,
                  decoration: const InputDecoration(
                    labelText: 'Cintura',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor insira seu cintura.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  controller: inputCoxaController,
                  decoration: const InputDecoration(
                    labelText: 'Coxa',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor insira seu coxa.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  controller: inputPanturilhaController,
                  decoration: const InputDecoration(
                    labelText: 'Panturilha',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor insira seu panturilha.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: inputBracoController,
                  decoration: const InputDecoration(
                    labelText: 'Braço',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor insira seu braço.';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton:
          FloatButtonPersonalized('Atualizar', Icons.check, () {
        if (_keyForm.currentState!.validate()) {
          final novasMedidas = Medida(
            inputAlturaController.text,
            inputPesoController.text,
            inputPeitoController.text,
            inputOmbroController.text,
            inputCinturaController.text,
            inputCoxaController.text,
            inputPanturilhaController.text,
            inputBracoController.text,
            DateTime.now(),
          );
          _montaMedidas(novasMedidas, context);
        }
      }),
    );
  }
}

void _montaMedidas(Medida novasMedidas, context) {
  var alturaValida = _verificaMedidas(novasMedidas);
  if (alturaValida) {
    _salvaMedidas(novasMedidas, context);
  }
}

bool _verificaMedidas(Medida medidas) {
  return true;
}

void _salvaMedidas(Medida novasMedidas, context) {
  Provider.of<Medidas>(context, listen: false).adicionar(novasMedidas);
  Navigator.pop(context);
}
