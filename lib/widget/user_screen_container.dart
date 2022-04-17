import 'package:flutter/material.dart';
import 'package:houlala/service/auth_service.dart';
import 'package:provider/provider.dart';

class UserScreenContainer extends StatelessWidget {
  const UserScreenContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<AuthService>(context).getUserID(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            String? userId = snapshot.data;

            return Center(
              child: Text(
                userId!,
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
