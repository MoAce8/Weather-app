import 'package:flutter/material.dart';

class NoCityHomeScreen extends StatelessWidget {
  const NoCityHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No city selected go search now 🔎'),
    );
  }
}


class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return const Center(
     child: CircularProgressIndicator(),
   );
  }

}
