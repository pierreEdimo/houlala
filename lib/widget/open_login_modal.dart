import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/widget/custom_button_container.dart';
import 'package:houlala/widget/sign_in_container.dart';
import 'package:houlala/widget/sign_up_container.dart';
import 'package:sizer/sizer.dart';

enum AuthMode { signIn, signUp }

openModal(BuildContext context) {
  AuthMode _authMode = AuthMode.signIn;

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
                SafeArea(
                  child: SizedBox(
                    height: 120.0,
                    child: Material(
                      elevation: 1,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10.0,
                            right: 10.0,
                            top: 40.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Flexible(
                                child: Text(
                                  "Se Connecter/S'enregistrer",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22.0,
                                      fontFamily: "PoppinsBold"),
                                ),
                              ),
                              CustomButtonContainer(
                                icon: const FaIcon(FontAwesomeIcons.xmark),
                                onPressed: () => Navigator.of(context).pop(),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
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
                _authMode == AuthMode.signIn
                    ? const SignInContainer()
                    : const SignUpContainer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      Text(_authMode == AuthMode.signIn
                          ? "vous etes nouveau?"
                          : "vous avez un compte?"),
                      horizontalSpacing,
                      InkWell(
                        onTap: () {
                          if (_authMode == AuthMode.signIn) {
                            setState(
                              () {
                                _authMode = AuthMode.signUp;
                              },
                            );
                          } else {
                            setState(
                              () {
                                _authMode = AuthMode.signIn;
                              },
                            );
                          }
                        },
                        child: Text(
                          _authMode == AuthMode.signIn
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
