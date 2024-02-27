import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:houlala/screens/page_result_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../screens/about_screen.dart';
import '../screens/all_pages_screen.dart';
import '../screens/all_product_categories_screen.dart';
import '../screens/category_detail_screen.dart';
import '../screens/conditions_screen.dart';
import '../screens/data_security.dart';
import '../screens/discovery_category_detail_screen.dart';
import '../screens/edit_screen.dart';
import '../screens/favorite_screen.dart';
import '../screens/options_screen.dart';
import '../screens/page_detail_screen.dart';
import '../screens/personal_datas_screen.dart';
import '../screens/personal_order_screen.dart';
import '../screens/product_detail_screen.dart';
import '../screens/reset_screen.dart';
import '../screens/search_screen.dart';
import '../screens/sub_category_screen.dart';
import '../service/auth_service.dart';
import '../service/category_service.dart';
import '../service/connectivity_service.dart';
import '../service/email_service.dart';
import '../service/order_service.dart';
import '../service/page_service.dart';
import '../service/product_service.dart';
import '../service/word_service.dart';
import 'main_navigation.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CategoryService()),
        ChangeNotifierProvider(create: (context) => ProductService()),
        ChangeNotifierProvider(create: (context) => LocationService()),
        ChangeNotifierProvider(create: (context) => WordService()),
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => ConnectivityService()),
        ChangeNotifierProvider(create: (context) => OrderService()),
        ChangeNotifierProvider(create: (context) => EmailService()),
      ],
      builder: (context, child) {
        return Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              title: 'houlala',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                textTheme: GoogleFonts.poppinsTextTheme(),
                appBarTheme: AppBarTheme(
                    elevation: 3,
                    color: Colors.white,
                    titleTextStyle: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))),
              ),
              initialRoute: '/',
              routes: {
                '/': (context) => const MainNavigation(),
                '/all_categories': (context) => const AllProductCategories(),
                '/all_locations': (context) => const AllPageScreen(),
                ProductDetailScreen.routeName: (context) =>
                    const ProductDetailScreen(),
                CategoryDetailScreen.routeName: (context) =>
                    const CategoryDetailScreen(),
                PageDetailScreen.routeName: (context) =>
                    const PageDetailScreen(),
                '/search': (context) => const SearchScreen(),
                FavoriteScreen.routeName: (context) => const FavoriteScreen(),
                '/options': (context) => const OptionScreen(),
                '/about': (context) => const AboutScreen(),
                '/conditions': (context) => const ConditionScreen(),
                '/data_security': (context) => const DataSecurityScreen(),
                '/my_orders': (context) => const PersonalOrderScreen(),
                '/my_personal': (context) => const PersonalDataScreen(),
                '/discovery_category_detail': (context) =>
                    const DiscoveryCategoryDetailScreen(),
                '/sub_category': (context) => const SubCategoryScreen(),
                '/edit': (context) => const EditScreen(),
                '/reset': (context) => const ResetPasswordScreen(),
                PageResultScreen.routeName: (context) => const PageResultScreen()
              },
            );
          },
        );
      },
    );
  }
}
