import 'package:ecommerce/features/tabs/cart_tab/cart_tab.dart';
import 'package:ecommerce/features/tabs/home_tab/home_tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../wishlist/presentation/wishlist_screen.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeScreenStates>{
  HomeCubit():super(HomeInitialState());
  int selectedIndex = 0;
  List<Widget> tabs = [
    HomeTabScreen(),
   CartTab(),
    WishlistScreen(),
    // HomeTab(),
    // ProductListTab(),
    // FavoriteTab(),
    // ProfileTab()
  ];
  void changeBottomNavIndex(int newSelectedIndex){
    HomeInitialState();
    selectedIndex = newSelectedIndex ;
    emit(HomeChangeBottomNavBar());
  }
}