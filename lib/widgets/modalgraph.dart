import 'package:flutter/material.dart';

class ModalGraph extends StatefulWidget {
  const ModalGraph({super.key});

  @override
  State<ModalGraph> createState() => _ModalGraphState();
}

class _ModalGraphState extends State<ModalGraph> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Container(
        width: double.infinity,
        child: const Column(
          children: [
            Text("data"),
            Text("data"),
          ],
        ),
      ),
    );
  }
}
