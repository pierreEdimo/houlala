import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houlala/controllers/auth_controller.dart';
import 'package:houlala/shared_widgets/custom_body_container.dart';
import 'package:houlala/widget/custom_list_tile.dart';
import 'package:houlala/widget/launch_url.dart';
import 'package:houlala/widget/standard_custom_container.dart';
import 'package:sizer/sizer.dart';


class UserScreenContainer extends ConsumerWidget {
  const UserScreenContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AuthController authController = AuthController(ref);
    return CustomBodyContainer(
      loading: authController.loading,
    );
  }
}

class OpenReview extends StatelessWidget {
  const OpenReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => openStore(context),
      child: !kIsWeb
          ? const CustomListTile(
              imageUrl: "images/about.png",
              title: "Evaluez notre application",
            )
          : Container(),
    );
  }
}

class Conditions extends StatelessWidget {
  const Conditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed('/conditions'),
      child: const CustomListTile(
        imageUrl: "images/terms-and-conditions.png",
        title: "Conditions d'utilisation",
      ),
    );
  }
}

class Security extends StatelessWidget {
  const Security({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed('/data_security'),
      child: const CustomListTile(
        imageUrl: "images/privacy-policy.png",
        title: "Politique de confidentialites",
      ),
    );
  }
}

class OpenOptions extends StatelessWidget {
  const OpenOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed('/options'),
      child: const CustomListTile(
        imageUrl: "images/about.png",
        title: "Options",
      ),
    );
  }
}

class OpenAbout extends StatelessWidget {
  const OpenAbout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed('/about'),
      child: const CustomListTile(
        imageUrl: "images/about.png",
        title: "A Propos",
      ),
    );
  }
}

class ContactButton extends StatelessWidget {
  const ContactButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async => openContact('mailto', 'service@houlala.store'),
      child: const CustomListTile(
        imageUrl: "images/contact-mail.png",
        title: "Contactez nous",
      ),
    );
  }
}

class ConnectWithUs extends StatelessWidget {
  const ConnectWithUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showModalBottomSheet<void>(
        context: context,
        builder: (context) => StandardCustomContainer(
          child: SizedBox(
            height: 15.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    openInWebViewOrVC('https://www.facebook.com/');
                  },
                  child: const ImageIcon(
                    AssetImage("images/facebook.png"),
                    size: 35,
                    color: Colors.blue,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    openInWebViewOrVC('https://www.instagram.com/');
                  },
                  child: const ImageIcon(
                    AssetImage("images/instagram.png"),
                    size: 35,
                    color: Colors.red,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    openInWebViewOrVC('https://de.linkedin.com/');
                  },
                  child: const ImageIcon(
                    AssetImage("images/linkedin.png"),
                    size: 35,
                    color: Colors.green,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    openInWebViewOrVC('https://www.youtube.com/');
                  },
                  child: const ImageIcon(
                    AssetImage("images/youtube.png"),
                    size: 35,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      child: const CustomListTile(
        imageUrl: "images/contact-mail.png",
        title: "Nos reseaux sociaux",
      ),
    );
  }
}
