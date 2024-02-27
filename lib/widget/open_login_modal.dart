import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/widget/checkout_bar.dart';
import 'package:houlala/widget/sign_in_container.dart';
import 'package:houlala/widget/sign_up_container.dart';
import 'package:sizer/sizer.dart';

enum AuthMode { signIn, signUp }

openModal(BuildContext context) {
  AuthMode authMode = AuthMode.signIn;

  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (context) =>
        StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
      return SizedBox(
        height: 100.h,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              children: [
                const SafeArea(
                  child: ModalBar(
                    title: "Se Connecter/S'enregistrer",
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Container(
                  width: 100.w,
                  height: 200,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/houlala.png'),
                          fit: BoxFit.contain)),
                ),
                authMode == AuthMode.signIn
                    ? const SignInContainer()
                    : const SignUpContainer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      Text(authMode == AuthMode.signIn
                          ? "vous etes nouveau?"
                          : "vous avez un compte?"),
                      horizontalSpacing,
                      InkWell(
                        onTap: () {
                          if (authMode == AuthMode.signIn) {
                            setState(
                              () {
                                authMode = AuthMode.signUp;
                              },
                            );
                          } else {
                            setState(
                              () {
                                authMode = AuthMode.signIn;
                              },
                            );
                          }
                        },
                        child: Text(
                          authMode == AuthMode.signIn
                              ? "s'enregister"
                              : "se connecter",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                standardSizedBox
              ],
            ),
          ),
        ),
      );
    }),
  );
}
