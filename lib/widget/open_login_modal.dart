import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/widget/app_bar_with_return.dart';
import 'package:houlala/widget/sign_in_container.dart';
import 'package:houlala/widget/sign_up_container.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sizer/sizer.dart';

enum AuthMode { signIn, signUp }

openModal(BuildContext context) {
  AuthMode _authMode = AuthMode.signIn;

  showMaterialModalBottomSheet(
    expand: true,
    context: context,
    builder: (context) =>
        StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
      return SingleChildScrollView(
        controller: ModalScrollController.of(context),
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: [
              SizedBox(
                height: kIsWeb ? 70.0 : 90.0,
                child: AppBarWithReturn(
                  title: "Se Connecter/S'enregistrer",
                  elevation: 1,
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
                    fit: BoxFit.contain
                  )
                ),
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
                          setState(() {
                            _authMode = AuthMode.signUp;
                          });
                        } else {
                          setState(() {
                            _authMode = AuthMode.signIn;
                          });
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
      );
    }),
  );
}
