import 'package:directory/features/read_person/presentation/manager/read_person_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReadPersonPage extends GetView<ReadPersonController> {
  const ReadPersonPage({super.key});

  static const String routeName = '/read_person';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReadPersonController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Directorio'),
          ),
          body: const Column(),
          floatingActionButton: FloatingActionButton(
            onPressed: controller.goToCreatePerson,
            tooltip: 'Agregar contacto',
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
