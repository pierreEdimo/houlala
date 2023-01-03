import 'package:flutter/material.dart';
import 'package:houlala/widget/app_bar_with_return.dart';
import 'package:houlala/widget/standard_custom_container.dart';
import 'package:houlala/widget/store_body_container.dart';
import 'package:houlala/widget/transformed_container.dart';
import 'package:sizer/sizer.dart';

class AllPageScreen extends StatelessWidget {
  const AllPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Material(
              elevation: 1,
              child: Stack(
                children: [
                  SizedBox(
                    height: 35.h,
                    child: Container(
                      width: 100.w,
                      color: const Color(0xf2f2f2f2),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.transparent,
                            backgroundImage:
                                NetworkImage("https://upload.houlala.store/images/bf3f1bef-02a0-4c14-9adb-93b795c28b15.jpg"),
                          ),
                          Text(
                            "Nos partenaires",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "PoppinsBold",
                                fontSize: 28.0,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: null,
                    child: AppBarWithReturn(
                      color: Colors.transparent,
                      elevation: 0,
                      title: "",
                    ),
                  )
                ],
              ),
            ),
            const TransformedContainer(
              child: StoreBodyContainer(
                height: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
