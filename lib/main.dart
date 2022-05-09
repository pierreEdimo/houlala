import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:houlala/model/address.dart';
import 'package:houlala/model/cart_item.dart';
import 'package:houlala/model/personal_datas.dart';
import 'package:houlala/model/product.dart';
import 'package:houlala/model/product_page.dart';
import 'package:houlala/screens/about_screen.dart';
import 'package:houlala/screens/all_post_screen.dart';
import 'package:houlala/screens/all_product_categories_screen.dart';
import 'package:houlala/screens/all_fruits_and_lettuces_screen.dart';
import 'package:houlala/screens/all_pages_screen.dart';
import 'package:houlala/screens/category_detail_screen.dart';
import 'package:houlala/screens/conditions_screen.dart';
import 'package:houlala/screens/data_security.dart';
import 'package:houlala/screens/favorite_screen.dart';
import 'package:houlala/screens/jobs_detail_screen.dart';
import 'package:houlala/screens/options_screen.dart';
import 'package:houlala/screens/page_detail_screen.dart';
import 'package:houlala/screens/personal_datas_screen.dart';
import 'package:houlala/screens/personal_order_screen.dart';
import 'package:houlala/screens/post_detail_screen.dart';
import 'package:houlala/screens/product_detail_screen.dart';
import 'package:houlala/screens/search_screen.dart';
import 'package:houlala/service/auth_service.dart';
import 'package:houlala/service/cart_item_service.dart';
import 'package:houlala/service/category_service.dart';
import 'package:houlala/service/comment_service.dart';
import 'package:houlala/service/connectivity_service.dart';
import 'package:houlala/service/job_service.dart';
import 'package:houlala/service/order_service.dart';
import 'package:houlala/service/page_service.dart';
import 'package:houlala/service/post_service.dart';
import 'package:houlala/service/product_service.dart';
import 'package:houlala/service/word_service.dart';
import 'package:houlala/widget/main_navigation.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:io' show Platform;

var box = Hive.box('loggedState');
const storage = FlutterSecureStorage();

Future main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(CartItemAdapter());
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(PersonalDataAdapter());
  Hive.registerAdapter(PageAdapter());
  Hive.registerAdapter(AddressAdapter());

  await Hive.openBox('loggedState');
  await Hive.openBox<CartItem>('cart-items');
  await Hive.openBox<Product>('products');
  await Hive.openBox<PersonalData>('user');
  await Hive.openBox<Address>('address');

  await dotenv.load(fileName: '.env');

  initializeDateFormatting('fr', null);

  runApp(const MyApp());

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CategoryService()),
        ChangeNotifierProvider(create: (context) => ProductService()),
        ChangeNotifierProvider(create: (context) => PageService()),
        ChangeNotifierProvider(create: (context) => JobService()),
        ChangeNotifierProvider(create: (context) => PostService()),
        ChangeNotifierProvider(create: (context) => WordService()),
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => CommentService()),
        ChangeNotifierProvider(create: (context) => CartItemService()),
        ChangeNotifierProvider(create: (context) => ConnectivityService()),
        ChangeNotifierProvider(create: (context) => OrderService()),
      ],
      builder: (context, child) {
        return Sizer(
          builder: (context, orientation, deviceType) {
            if (Platform.isIOS) {
              return CupertinoApp(
                title: 'houlala',
                debugShowCheckedModeBanner: false,
                theme: const CupertinoThemeData(
                  textTheme: CupertinoTextThemeData(
                    textStyle: TextStyle(fontFamily: 'Poppins'),
                  ),
                  scaffoldBackgroundColor: Color(0xffffffff),
                ),
                initialRoute: '/',
                routes: {
                  '/': (context) => const MainNavigation(),
                  '/all_fruits': (context) => const AllFruits(),
                  '/all_categories': (context) => const AllProductCategories(),
                  '/all_pages': (context) => const AllPageScreen(),
                  ProductDetailScreen.routeName: (context) =>
                      const ProductDetailScreen(),
                  CategoryDetailScreen.routeName: (context) =>
                      const CategoryDetailScreen(),
                  PageDetailScreen.screenName: (context) =>
                      const PageDetailScreen(),
                  JobsDetailScreen.routeName: (context) =>
                      const JobsDetailScreen(),
                  '/all_posts': (context) => const AllPostsScreen(),
                  PostDetailScreen.routeName: (context) => PostDetailScreen(),
                  '/search': (context) => const SearchScreen(),
                  FavoriteScreen.routeName: (context) => const FavoriteScreen(),
                  '/options': (context) => const OptionScreen(),
                  '/about': (context) => const AboutScreen(),
                  '/conditions': (context) => const ConditionScreen(),
                  '/data_security': (context) => const DataSecurityScreen(),
                  '/my_orders': (context) => const PersonalOrderScreen(),
                  '/my_personal': (context) => const PersonalDataScreen(),
                },
              );
            }
            return MaterialApp(
              title: 'houlala',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  appBarTheme: const AppBarTheme(
                    backgroundColor: Color(0xf2f2f2f2),
                    titleTextStyle: TextStyle(
                      fontFamily: 'PoppinsBold',
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                      color: Colors.black,
                    ),
                  ),
                  primarySwatch: Colors.grey,
                  fontFamily: 'Poppins',
                  scaffoldBackgroundColor: const Color(0xffffffff)),
              initialRoute: '/',
              routes: {
                '/': (context) => const MainNavigation(),
                '/all_fruits': (context) => const AllFruits(),
                '/all_categories': (context) => const AllProductCategories(),
                '/all_pages': (context) => const AllPageScreen(),
                ProductDetailScreen.routeName: (context) =>
                    const ProductDetailScreen(),
                CategoryDetailScreen.routeName: (context) =>
                    const CategoryDetailScreen(),
                PageDetailScreen.screenName: (context) =>
                    const PageDetailScreen(),
                JobsDetailScreen.routeName: (context) =>
                    const JobsDetailScreen(),
                '/all_posts': (context) => const AllPostsScreen(),
                PostDetailScreen.routeName: (context) => PostDetailScreen(),
                '/search': (context) => const SearchScreen(),
                FavoriteScreen.routeName: (context) => const FavoriteScreen(),
                '/options': (context) => const OptionScreen(),
                '/about': (context) => const AboutScreen(),
                '/conditions': (context) => const ConditionScreen(),
                '/data_security': (context) => const DataSecurityScreen(),
                '/my_orders': (context) => const PersonalOrderScreen(),
                '/my_personal': (context) => const PersonalDataScreen(),
              },
            );
          },
        );
      },
    );
  }
}
