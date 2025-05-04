import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cart/presentation/cubit/cart_cubit.dart';
import '../../product_details/product_details_view.dart';
import '../../utils/my_colors.dart';
import 'cubit/wishlist_cubit.dart';
import 'cubit/wishlist_states.dart';


class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistCubit, WishlistState>(
      builder: (context, state) {
        final wishlist = context.read<WishlistCubit>().wishlist;

        return Scaffold(
          appBar: AppBar(
            title: const Text("My Wishlist"),
            centerTitle: true,
          ),
          body: wishlist.isEmpty
              ? const Center(child: Text("Your wishlist is empty"))
              : ListView.separated(
            padding: EdgeInsets.all(16.w),
            separatorBuilder: (_, __) => SizedBox(height: 16.h),
            itemCount: wishlist.length,
            itemBuilder: (context, index) {
              final product = wishlist[index];

              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, ProductDetailsView.routeName, arguments: product);
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 100.w,
                        height: 100.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          image: DecorationImage(
                            image: NetworkImage(product.images?.first ?? ""),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(12.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.title ?? "",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.darkPrimaryColor,
                                ),
                              ),
                              SizedBox(height: 4.h),

                              Row(
                                children: [
                                  Text(
                                    "EGP ${product.price}",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  SizedBox(width: 6.w),
                                  Text(
                                    "EGP ${product.discountPercentage}",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.favorite),
                            color: AppColors.primaryColor,
                            onPressed: () {
                              context.read<WishlistCubit>().toggleWishlist(product);
                            },
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                            ),
                            onPressed: () {
                              context.read<CartCubit>().addToCart(
                                quantity: "",
                                userId: 1,
                                products: [
                                  {
                                    "id": product.id,
                                    "quantity": 1,
                                  }
                                ],
                              );

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Added to cart'),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            },
                            child: const Text("Add to Cart",style: TextStyle(color:AppColors.whiteColor),),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
