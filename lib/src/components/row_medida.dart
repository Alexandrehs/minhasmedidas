import 'package:flutter/material.dart';

class RowMedida extends StatelessWidget {
  final String _nameMedida;
  final String _valorMedida;
  final String _typeMedida;

  const RowMedida(this._nameMedida, this._valorMedida, this._typeMedida);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Row(
        children: [
          Text(
            '$_nameMedida: ',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '$_valorMedida $_typeMedida',
            style: TextStyle(
                fontWeight: FontWeight.w500, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
