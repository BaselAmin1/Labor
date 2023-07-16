import 'package:flutter/material.dart';
import 'package:labor_app/generated/l10n.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(child: Text(S.of(context).title));
  }
}