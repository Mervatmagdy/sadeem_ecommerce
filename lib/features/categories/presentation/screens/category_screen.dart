// screens/category_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/my_colors.dart';
import '../cubit/category_cubit.dart';
import '../cubit/category_states.dart';

class CategoryScreen extends StatefulWidget {
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();

}

class _CategoryScreenState extends State<CategoryScreen> {
  late final cubit;
  @override
  void initState() {
     cubit = context.read<CategoryCubit>();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xffDBE4ED),
      child: SafeArea(
        child: BlocBuilder<CategoryCubit, CategoryStates>(

          bloc:cubit,
          builder: (context, state) {
            if (state is CategoryLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CategorySuccess) {

              return ListView(
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(color:AppColors.primaryColor),
                    child: Center(child: Text('Categories', style: TextStyle(color: Colors.white, fontSize: 24))),
                  ),

                  ...cubit.categories.map((cat) {
                    final isSelected = cubit.selectedCategory == cat;
                    return ListTile(
                      title: Text(cat.replaceAll('-', ' ').toUpperCase()),
                      selected: isSelected,
                      selectedTileColor: Colors.white,
                      onTap: () {
                        cubit.selectCategory(cat);
                        setState(() {

                        });
                        Navigator.pop(context);
                      },
                    );
                  })
                ],
              );
            } else if (state is CategoryError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.errorMessage),
                    ElevatedButton(
                      onPressed: () => context.read<CategoryCubit>().eitherFailureOrCategory(),
                      child: Text('Retry'),
                    ),
                  ],
                ),
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
