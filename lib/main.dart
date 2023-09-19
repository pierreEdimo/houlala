import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:houlala/model/cart_item.dart';
import 'package:houlala/model/offline_order.dart';
import 'package:houlala/widget/my_app.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:hive_flutter/hive_flutter.dart';

var box = Hive.box('loggedState');
const storage = FlutterSecureStorage();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('loggedState');
  Hive.registerAdapter(OfflineOrderAdapter());
  Hive.registerAdapter(CartItemAdapter());
  await Hive.openBox<CartItem>('items');
  await Hive.openBox<OfflineOrder>('orders');
  await dotenv.load(fileName: '.env');
  initializeDateFormatting('fr', null);
  ByteData data = await PlatformAssetBundle().load('ca/lets-encrypt-r3.pem');
  SecurityContext.defaultContext
      .setTrustedCertificatesBytes(data.buffer.asUint8List());
  runApp(const ProviderScope(child:  MyApp()));
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
