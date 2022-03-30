import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/screens/all_post_screen.dart';
import 'package:houlala/screens/all_product_categories_screen.dart';
import 'package:houlala/screens/all_fruits_and_lettuces_screen.dart';
import 'package:houlala/screens/all_pages_screen.dart';
import 'package:houlala/screens/category_detail_screen.dart';
import 'package:houlala/screens/jobs_detail_screen.dart';
import 'package:houlala/screens/page_detail_screen.dart';
import 'package:houlala/screens/post_detail_screen.dart';
import 'package:houlala/screens/product_detail_screen.dart';
import 'package:houlala/screens/search_screen.dart';
import 'package:houlala/service/category_service.dart';
import 'package:houlala/service/job_service.dart';
import 'package:houlala/service/page_service.dart';
import 'package:houlala/service/post_service.dart';
import 'package:houlala/service/product_service.dart';
import 'package:houlala/service/word_service.dart';
import 'package:houlala/widget/bottom_navigation.dart';
import 'package:provider/provider.dart';

Future main() async {
  await dotenv.load(fileName: '.env');

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
        ChangeNotifierProvider(create: (context) => WordService())
      ],
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
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
            '/': (context) => const BottomNavigation(),
            '/all_fruits': (context) => const AllFruits(),
            '/all_categories': (context) => const AllProductCategories(),
            '/all_pages': (context) => const AllPageScreen(),
            ProductDetailScreen.routeName: (context) =>
                const ProductDetailScreen(),
            CategoryDetailScreen.routeName: (context) =>
                const CategoryDetailScreen(),
            PageDetailScreen.screenName: (context) => const PageDetailScreen(),
            JobsDetailScreen.routeName: (context) => const JobsDetailScreen(),
            '/all_posts': (context) => const AllPostsScreen(),
            PostDetailScreen.routeName: (context) =>  PostDetailScreen(),
            '/search':(context) => const SearchScreen()
          },
        );
      },
    );
  }
}
