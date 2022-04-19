import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/screens/favorite_screen.dart';
import 'package:houlala/service/auth_service.dart';
import 'package:houlala/widget/custom_list_tile.dart';
import 'package:houlala/widget/standard_custom_container.dart';
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

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 45,
                  ),
                  const StandardCustomContainer(
                    child: Text(
                      "Mon Compte",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: 'PoppinsBold'),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Card(
                    color: const Color(0xfefefefe),
                    elevation: 4,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () => Navigator.of(context).pushNamed(
                              FavoriteScreen.routeName,
                              arguments: userId),
                          child: const CustomListTile(
                            leadingIcon: FontAwesomeIcons.solidHeart,
                            title: "Mes Favories",
                          ),
                        ),
                        const CustomListTile(
                          leadingIcon: FontAwesomeIcons.bagShopping,
                          title: "Mes Commandes",
                        ),
                        const CustomListTile(
                          leadingIcon: FontAwesomeIcons.moneyBill,
                          title: "Mes Factures",
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Card(
                    color: const Color(0xfefefefe),
                    elevation: 4,
                    child: Column(
                      children: [
                        const CustomListTile(
                          leadingIcon: FontAwesomeIcons.locationDot,
                          title: "Mes Adresses",
                        ),
                        const CustomListTile(
                          leadingIcon: FontAwesomeIcons.gear,
                          title: "Mes Options",
                        ),
                        const CustomListTile(
                          leadingIcon: FontAwesomeIcons.shareNodes,
                          title: "Nos reseaux sociaux",
                        ),
                        const CustomListTile(
                          leadingIcon: FontAwesomeIcons.circleInfo,
                          title: "A Propos",
                        ),
                        const CustomListTile(
                          leadingIcon: FontAwesomeIcons.envelope,
                          title: "Contactez nous",
                        ),
                        const CustomListTile(
                          leadingIcon: FontAwesomeIcons.lock,
                          title: "Conditions d'utilisation",
                        ),
                        const CustomListTile(
                          leadingIcon: FontAwesomeIcons.star,
                          title: "Evaluez notre application",
                        ),
                        InkWell(
                          onTap: () =>
                              Provider.of<AuthService>(context, listen: false)
                                  .logOut(),
                          child: const CustomListTile(
                            leadingIcon: FontAwesomeIcons.rightFromBracket,
                            title: "Se deconnecter",
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
