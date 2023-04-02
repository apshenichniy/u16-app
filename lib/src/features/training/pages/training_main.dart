import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TrainingMainPage extends StatelessWidget {
  const TrainingMainPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TrainingRootPage'),
      ),
      body: const Center(
        child: Text('TrainingRootPage'),
      ),
    );
  }
}
