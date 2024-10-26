import 'package:directory/core/utils/app_colors.dart';
import 'package:directory/core/widgets/app_loading_page.dart';
import 'package:directory/features/read_person/presentation/manager/read_person_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReadPersonPage extends GetView<ReadPersonController> {
  const ReadPersonPage({super.key});

  static const String routeName = '/read_person';

  @override
  Widget build(BuildContext context) {
    return AppLoadingPage<ReadPersonController>(
      child: GetBuilder<ReadPersonController>(
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Directorio'),
            ),
            body: GetBuilder<ReadPersonController>(
              id: 'list_person',
              builder: (_) {
                if (controller.listPerson.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.contacts_outlined,
                          size: 100,
                          color: AppColors.secondaryColor,
                        ),
                        const SizedBox(height: 120),
                        Text(
                          'Sin contactos',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: AppColors.secondaryColor,
                              ),
                        ),
                      ],
                    ),
                  );
                }
                return SafeArea(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('Nombre: ${controller.listPerson[index].name}'),
                        subtitle: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Email: ${controller.listPerson[index].email}'),
                            Text('Edad: ${controller.listPerson[index].age}'),
                          ],
                        ),
                        onTap: () => controller.goToEditPerson(controller.listPerson[index].id),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        height: 8,
                        color: AppColors.secondaryColor,
                        indent: 1,
                      );
                    },
                    itemCount: controller.listPerson.length,
                  ),
                );
              },
            ),
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
      ),
    );
  }
}
