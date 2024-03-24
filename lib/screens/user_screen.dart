import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heroicons/heroicons.dart';
import 'package:houlala/controllers/auth_controller.dart';
import 'package:houlala/controllers/user_screen_controller.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/models/user_model/user_model.dart';
import 'package:houlala/screens/favorite_screen.dart';
import 'package:houlala/shared_widgets/custom_body_container.dart';
import 'package:houlala/shared_widgets/container_wirth_connectivity_checker.dart';
import 'package:houlala/shared_widgets/launch_url.dart';

import '../shared_widgets/custom_list_tile.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 35,
          backgroundImage: AssetImage('images/houlala1.png'),
        ),
        title: const Text("Mon profile"),
      ),
      body: const ContainerWithConnectivityChecker(
        child: SingleChildScrollView(
          child: UserScreenContainer(),
        ),
      ),
    );
  }
}

class UserScreenContainer extends ConsumerWidget {
  const UserScreenContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AuthController authController = AuthController(ref);
    UserScreenController userScreenController = UserScreenController(ref);
    UserModel? connectedUser = authController.connectedUser;

    return CustomBodyContainer(
      error: authController.error,
      errorMessage: authController.errorMessage,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Material(
            elevation: 3.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 15.0,
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: () => connectedUser != null
                        ? Navigator.of(context).pushNamed(
                            FavoriteScreen.routeName,
                            arguments: connectedUser.id)
                        : Navigator.of(context).pushNamed('/login'),
                    child: const CustomListTile(
                      leadingIcon: HeroIcon(HeroIcons.heart),
                      title: 'Mes Favories',
                    ),
                  ),
                  InkWell(
                    onTap: () => connectedUser != null
                        ? Navigator.of(context).pushNamed('/my_orders')
                        : Navigator.of(context).pushNamed('/login'),
                    child: const CustomListTile(
                      leadingIcon: HeroIcon(HeroIcons.shoppingBag),
                      title: 'Mes Commandes',
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const CustomListTile(
                      leadingIcon: HeroIcon(HeroIcons.creditCard),
                      title: 'Mes Factures',
                    ),
                  ),
                  InkWell(
                    onTap: () => connectedUser != null
                        ? Navigator.of(context).pushNamed('/my_personal')
                        : Navigator.of(context).pushNamed('/login'),
                    child: const CustomListTile(
                      leadingIcon: HeroIcon(HeroIcons.user),
                      title: 'Mes Donnees personnelles',
                    ),
                  )
                ],
              ),
            ),
          ),
          standardSizedBox,
          Material(
            elevation: 3.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 10.0,
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: () => openContact('mailto', 'service@houlala.store'),
                    child: const CustomListTile(
                      leadingIcon: HeroIcon(HeroIcons.envelope),
                      title: 'Contactez nous',
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const CustomListTile(
                      leadingIcon: HeroIcon(HeroIcons.globeAlt),
                      title: 'Nos reseaux sociaux',
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const CustomListTile(
                      leadingIcon: HeroIcon(HeroIcons.star),
                      title: 'Evaluez notre application',
                    ),
                  )
                ],
              ),
            ),
          ),
          standardSizedBox,
          Material(
            elevation: 3.0,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).pushNamed('/options'),
                    child: const CustomListTile(
                      leadingIcon: HeroIcon(HeroIcons.cog6Tooth),
                      title: 'Options',
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).pushNamed('/about'),
                    child: const CustomListTile(
                      leadingIcon: HeroIcon(HeroIcons.informationCircle),
                      title: 'A propos',
                    ),
                  )
                ],
              ),
            ),
          ),
          standardSizedBox,
          Material(
            elevation: 3.0,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).pushNamed('/conditions'),
                    child: const CustomListTile(
                      leadingIcon: HeroIcon(HeroIcons.clipboardDocumentCheck),
                      title: "Conditions d'utilisation",
                    ),
                  ),
                  InkWell(
                    onTap: () =>
                        Navigator.of(context).pushNamed('/data_security'),
                    child: const CustomListTile(
                      leadingIcon: HeroIcon(HeroIcons.shieldCheck),
                      title: 'Politique de confidentialites',
                    ),
                  )
                ],
              ),
            ),
          ),
          standardSizedBox,
          Material(
            elevation: 3.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 10.0,
              ),
              child: connectedUser != null
                  ? InkWell(
                      onTap: () => userScreenController.showQuestionModal(context),
                      child: const CustomListTile(
                          leadingIcon: HeroIcon(
                            HeroIcons.arrowRightOnRectangle,
                            color: Colors.red,
                          ),
                          title: 'Se deconnecter'),
                    )
                  : InkWell(
                      onTap: () => Navigator.of(context).pushNamed('/login'),
                      child: const CustomListTile(
                        leadingIcon: HeroIcon(
                          HeroIcons.arrowLeftOnRectangle,
                        ),
                        title: 'Se connecter/creer un compte',
                      ),
                    ),
            ),
          )
        ],
      ),
    );
  }
}
