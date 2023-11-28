import 'package:flutter/material.dart';

double getAdaptiveSize(BuildContext context, dynamic value) {
  // 720 is medium screen height
  return (value / 720) * MediaQuery.of(context).size.height;
}
