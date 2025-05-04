import 'package:ecommerce/features/home/presentation/screens/home_screen.dart';
import 'package:ecommerce/features/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import 'core/databases/cache/cache_helper.dart';
import 'core/service_locator/service_locator.dart';
import 'features/cart/presentation/cubit/cart_cubit.dart';
import 'features/categories/presentation/cubit/category_cubit.dart';
import 'features/product_details/product_details_view.dart';
import 'features/products/presentation/cubit/product_cubit.dart';
import 'features/user_login/presentation/cubit/user_cubit.dart';
import 'features/user_login/presentation/screens/login_screen.dart';
import 'features/utils/splash_screen.dart';
import 'features/wishlist/presentation/cubit/wishlist_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  ServiceLocator().setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
          designSize:  Size(430, 932),
          minTextAdapt: true,
          splitScreenMode: true,
      builder:  (_, child) => MultiBlocProvider(
        providers: [
          BlocProvider<CategoryCubit>(
            create: (BuildContext context) => CategoryCubit()..eitherFailureOrCategory(),
          ),
          BlocProvider<UserCubit>(
            create: (BuildContext context) => UserCubit(),
          ),
          BlocProvider<ProductCubit>(
            create: (context) => GetIt.instance<ProductCubit>()..eitherFailureOrProducts(),
          ),
          BlocProvider<CartCubit>(
            create: (context) => GetIt.instance<CartCubit>()..getCartByUserId(userId: 1),
          ),
          BlocProvider<WishlistCubit>(
            create: (context) => WishlistCubit()),


        ],

      child: SafeArea(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.mainTheme,
          initialRoute: SplashScreen.routeName ,
          routes:{
            SplashScreen.routeName:(context)=>SplashScreen(),
            LoginScreen.routeName:(context)=> LoginScreen(),
            HomeScreen.routeName:(context)=>HomeScreen(),
            ProductDetailsView.routeName:(context)=>ProductDetailsView(),
          } ,
        ),
      ),
    ));
  }
}

