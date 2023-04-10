import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:houlala/screens/favorite_screen.dart';
import 'package:houlala/service/auth_service.dart';
import 'package:houlala/widget/custom_list_tile.dart';
import 'package:houlala/widget/launch_url.dart';
import 'package:houlala/widget/open_login_modal.dart';
import 'package:houlala/widget/show_nack.dart';
import 'package:houlala/widget/standard_custom_container.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class UserScreenContainer extends StatelessWidget {
  const UserScreenContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String? logInState =
        Provider.of<AuthService>(context).getLoggedState();

    switch (logInState) {
      case 'loggedIn':
        return FutureBuilder(
          future: Provider.of<AuthService>(context).getUserID(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              String? userId = snapshot.data;

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 10.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const StandardCustomContainer(
                        child: Text(
                          "Mon Compte",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              fontFamily: 'PoppinsBold'),
                        ),
                      ),
                      Container(
                        color: const Color(0xfefefefe),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () => Navigator.of(context).pushNamed(
                                  FavoriteScreen.routeName,
                                  arguments: userId),
                              child: const CustomListTile(
                                imageUrl: "images/heart.png",
                                title: "Mes Favories",
                              ),
                            ),
                            InkWell(
                              onTap: () =>
                                  Navigator.of(context).pushNamed("/my_orders"),
                              child: const CustomListTile(
                                imageUrl: "images/shopping-bag.png",
                                title: "Mes Commandes",
                              ),
                            ),
                            // const CustomListTile(
                            //   leadingIcon: FontAwesomeIcons.moneyBill,
                            //   title: "Mes Factures",
                            // ),
                            InkWell(
                              onTap: () => Navigator.of(context)
                                  .pushNamed("/my_personal"),
                              child: const CustomListTile(
                                imageUrl: "images/user.png",
                                title: "Mes Donnees personnelles",
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        color: const Color(0xfefefefe),
                        child: Column(
                          children: [
                            const ConnectWithUs(),
                            const OpenAbout(),
                            const ContactButton(),
                            const Conditions(),
                            const Security(),
                            const OpenReview(),
                            InkWell(
                              onTap: () => Provider.of<AuthService>(context,
                                      listen: false)
                                  .logOut()
                                  .then((_) => showSnack(
                                      const Text(
                                          "vous avez ete deconnecte avec succes"),
                                      context)),
                              child: const CustomListTile(
                                imageUrl: "images/log-out.png",
                                title: "Se deconnecter",
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      default:
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 10.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const StandardCustomContainer(
                  child: Text(
                    "Mon Compte",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: 'PoppinsBold'),
                  ),
                ),
                Container(
                  color: const Color(0xfefefefe),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () => openModal(context),
                        child: const CustomListTile(
                          imageUrl: "images/heart.png",
                          title: "Mes Favories",
                        ),
                      ),
                      InkWell(
                        onTap: () => openModal(context),
                        child: const CustomListTile(
                          imageUrl: "images/shopping-bag.png",
                          title: "Mes Commandes",
                        ),
                      ),
                      InkWell(
                        onTap: () => openModal(context),
                        child: const CustomListTile(
                          imageUrl: "images/user.png",
                          title: "Mes Donnees personnelles",
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  color: const Color(0xfefefefe),
                  child: Column(
                    children: [
                      const ConnectWithUs(),
                      const OpenAbout(),
                      const ContactButton(),
                      const Conditions(),
                      const Security(),
                      const OpenReview(),
                      InkWell(
                        onTap: () => openModal(context),
                        child: const CustomListTile(
                          imageUrl: "images/sign-in.png",
                          title: "Se connecter/s'enregistrer",
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
    }
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
      onTap: () async => openContact('mailto', 'pierredimo@live.com'),
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
