import 'package:directory/core/utils/commons.dart';
import 'package:directory/core/widgets/app_button.dart';
import 'package:directory/core/widgets/app_card.dart';
import 'package:directory/core/widgets/app_loading_page.dart';
import 'package:directory/core/widgets/app_text_form_field.dart';
import 'package:directory/features/create_person/presentation/manager/create_person_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePersonPage extends GetView<CreatePersonController> {
  const CreatePersonPage({super.key});

  static const String routeName = '/create_person';

  @override
  Widget build(BuildContext context) {
    return AppLoadingPage<CreatePersonController>(
      child: GetBuilder<CreatePersonController>(
        builder: (_) {
          return GestureDetector(
            onTap: Common.closeKeyboard,
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text('Registrar contacto'),
              ),
              body: AppCard(
                elevation: 10,
                margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Form(
                  key: controller.formKeyRegister,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppTextFormField(
                        labelText: 'Nombre',
                        controller: controller.nameTextEditingController,
                        validator: controller.validateName,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AppTextFormField(
                        labelText: 'Correo',
                        controller: controller.emailTextController,
                        validator: controller.validateEmail,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AppTextFormField(
                        labelText: 'Edad',
                        controller: controller.ageTextController,
                        validator: controller.validateAge,
                        max: 2,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AppButton(
                        title: 'Registrar',
                        onPressed: controller.verifyRegistration,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
