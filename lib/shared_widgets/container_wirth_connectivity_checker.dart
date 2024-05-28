import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContainerWithConnectivityChecker extends ConsumerWidget {
  final Widget? child;

  const ContainerWithConnectivityChecker({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return child!;
  }
}
