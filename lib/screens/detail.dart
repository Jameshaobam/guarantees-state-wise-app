import 'package:flutter/material.dart';

class DetailData extends StatefulWidget {
  const DetailData({super.key});
  static String routeName = "/detail-page";

  @override
  State<DetailData> createState() => _DetailDataState();
}

class _DetailDataState extends State<DetailData> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Text("This is detail data"),
      ),
    );
  }
}
