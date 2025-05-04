import 'package:ecommerce/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/home_states.dart';
import '../widgets/build_Custom_Bottom_NavigationBar.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName='home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    HomeCubit viewModel = HomeCubit();
    return BlocConsumer<HomeCubit, HomeScreenStates>(
      bloc: viewModel,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: buildCustomBottomNavigationBar(
            context: context,
            selectedIndex: viewModel.selectedIndex,
            onTapFunction: (index) {
              viewModel.changeBottomNavIndex(index);
            },
          ),
          body: viewModel.tabs[viewModel.selectedIndex],
        );
      },
    );
  }
}
