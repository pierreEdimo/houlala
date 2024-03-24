import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:houlala/screens/login_screen.dart';
import 'package:houlala/screens/page_result_screen.dart';
import 'package:houlala/screens/register_screen.dart';
import 'package:sizer/sizer.dart';
import '../screens/about_screen.dart';
import '../screens/all_product_categories_screen.dart';
import '../screens/category_detail_screen.dart';
import '../screens/conditions_screen.dart';
import '../screens/data_security.dart';
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
import 'main_navigation.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'houlala',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: GoogleFonts.jetBrainsMonoTextTheme(),
            appBarTheme: AppBarTheme(
                elevation: 3,
                color: Colors.white,
                titleTextStyle: GoogleFonts.jetBrainsMono(
                    textStyle: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black))),
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const MainNavigation(),
            '/all_categories': (context) => const AllProductCategories(),
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
            '/sub_category': (context) => const SubCategoryScreen(),
            '/edit': (context) => const EditScreen(),
            '/reset': (context) => const ResetPasswordScreen(),
            PageResultScreen.routeName: (context) =>
                const PageResultScreen(),
            '/login': (context) => const LoginScreen(),
            '/register': (context) => const RegisterScreen()
          },
        );
      },
    );
  }
}
