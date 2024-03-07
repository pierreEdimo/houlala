import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houlala/controllers/auth_controller.dart';

class UserScreenController {
  WidgetRef ref;

  UserScreenController(this.ref);

  void showQuestionModal(BuildContext context) async {
    AuthController authController = AuthController(ref);

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Se Deconnecter'),
            content: const Text(
                'Voulez vous vraiment vous deconnecter de Houla la?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Annuller'),
              ),
              TextButton(
                onPressed: () {
                  authController.logout();
                  Navigator.of(context).pop();
                },
                child: const Text('Oui'),
              )
            ],
          );
        });
  }
}
