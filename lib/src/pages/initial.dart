import 'package:flutter/material.dart';
import 'package:minhasmedidas/src/components/float_button_personalized.dart';
import 'package:minhasmedidas/src/models/people.dart';
import 'package:minhasmedidas/src/pages/dashboard.dart';
import 'package:provider/provider.dart';

final _nameInputController = TextEditingController();
final _keyForm = GlobalKey<FormState>();

class Initial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Seja, bem vindo!',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Form(
              key: _keyForm,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  maxLength: 12,
                  controller: _nameInputController,
                  decoration: const InputDecoration(
                    label: Text('nome'),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Me diga seu primeiro nome.';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatButtonPersonalized(
        'Começar',
        Icons.navigate_next,
        () {
          if (_keyForm.currentState!.validate()) {
            Provider.of<People>(context, listen: false)
                .setName(_nameInputController.text);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Dashboard(),
              ),
            );
          }
        },
      ),
    );
  }
}
