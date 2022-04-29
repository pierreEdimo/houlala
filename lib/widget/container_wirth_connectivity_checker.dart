import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/service/connectivity_service.dart';
import 'package:provider/provider.dart';

class ContainerWithConnectivityChecker extends StatelessWidget {
  final Widget? child;

  const ContainerWithConnectivityChecker({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<ConnectivityService>(context).checkConnectivity(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        ConnectivityResult? result = snapshot.data;

        switch (result) {
          case ConnectivityResult.bluetooth:
          case ConnectivityResult.wifi:
          case ConnectivityResult.ethernet:
          case ConnectivityResult.mobile:
            return child!;
          case ConnectivityResult.none:
            return Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                ImageIcon(
                  AssetImage("images/wifi-x.png"),
                  size: 140,
                ),
                standardSizedBox,
                Text("Vous n'etes pas connecte a Internet")
              ],
            ),);
          case null:
          default:
            return Container();
        }
      },
    );
  }
}
