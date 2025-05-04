import 'package:ecommerce/features/products/domain/usecases/get_all_products.dart';
import 'package:ecommerce/features/products/domain/usecases/get_product_bycategory.dart';
import 'package:ecommerce/features/products/presentation/cubit/product_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../../product_details/product_details_view.dart';
import '../../../utils/my_assets.dart';
import '../../../utils/my_colors.dart';
import '../cubit/product_cubit.dart';
import '../widgets/grid_view_card_item.dart';



class ProductListTab extends StatefulWidget {
  const ProductListTab({super.key});


  @override
  State<ProductListTab> createState() => _ProductListTabState();
}

class _ProductListTabState extends State<ProductListTab> {
  late final ProductCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<ProductCubit>();
    cubit.eitherFailureOrProducts();
  }

  @override
   build(BuildContext context) {
      return BlocBuilder<ProductCubit, ProductStates>(
        bloc: cubit,
        builder: (context, state) {
          if (state is ProductLoadingStates) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductErrorStates) {
            return Center(child: Text(state.errMessage, style: const TextStyle(color: Colors.red)));
          } else if (state is ProductSuccessStates) {
            // Check if the list is empty before displaying the grid
            if (state.products.isEmpty) {
              return Center(child: Text("No products available."));
            }

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: GridView.builder(
                      itemCount:state.products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 2.4,
                        crossAxisSpacing: 16.w,
                        mainAxisSpacing: 16.h,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              Navigator.pushNamed(context,ProductDetailsView.routeName,arguments:state.products[index]);
                            },
                            child: GridViewCardItem(productEntity: state.products[index]));
                      },
                    ),
                  ),
                ],
              ),
            );
          }

          return const SizedBox.shrink(); // Return nothing if no other state matches
        },
      );
    }

  }


