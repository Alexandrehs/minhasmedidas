import 'package:flutter/material.dart';

class FloatButtonPersonalized extends StatelessWidget {
  final String _labelButtom;
  final IconData _iconButtom;
  final Function onpressButtom;

  const FloatButtonPersonalized(
      this._labelButtom, this._iconButtom, this.onpressButtom);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        onpressButtom();
      },
      icon: Icon(
        _iconButtom,
        color: Colors.black,
        size: 30.0,
      ),
      label: Text(
        _labelButtom,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
