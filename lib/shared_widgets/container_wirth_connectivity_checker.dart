import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/providers/connectivity_provider.dart';

class ContainerWithConnectivityChecker extends ConsumerWidget {
  final Widget? child;

  const ContainerWithConnectivityChecker({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ConnectivityResult? result = ref.watch(connectivityProvider);
    switch (result) {
          case ConnectivityResult.bluetooth:
          case ConnectivityResult.wifi:
          case ConnectivityResult.ethernet:
          case ConnectivityResult.mobile:
            return child!;
          case ConnectivityResult.none:
            return const Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
  }
}
