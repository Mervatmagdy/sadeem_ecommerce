import 'package:ecommerce/features/categories/presentation/screens/category_screen.dart';
import 'package:ecommerce/features/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../products/presentation/screens/product_list_tab.dart';

class HomeTabScreen extends StatelessWidget {
  const HomeTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight:70.h,
        title: Container(),
      ),
      drawer:CategoryScreen(),
      body: Padding(
        padding:  EdgeInsets.all(16.r),
        child: ProductListTab(),
      ),
    );
  }
}
