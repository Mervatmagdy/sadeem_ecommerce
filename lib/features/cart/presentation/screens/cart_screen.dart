import 'package:ecommerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../product_details/product_details_view.dart';
import '../../../utils/my_colors.dart';
import '../cubit/cart_states.dart';
import '../widget/cart_item.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = 'cart-screen';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      bloc: context.read<CartCubit>(),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  context.read<CartCubit>().deleteCart(cartId: 2);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Cart deleted successfully!'),
                      backgroundColor: Colors.redAccent,
                    ),
                  );
                  setState(() {
                    context.read<CartCubit>().getCartByUserId(userId: 1);
                  });
                },
                icon: Icon(
                  Icons.delete_outline,
                  color: AppColors.redColor,
                  size: 40,
                ),
              ),
            ],
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                // Button logic here
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).primaryColor,
              ),
            ),
            title: Text(
              'Cart',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          body:
              state is CartSuccessState
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return CartItem(
                              getProduct: state.cart.products[index],
                              cartId: state.cart.id,
                            );
                          },
                          itemCount: state.cart.totalProducts as int,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 98.h,
                          left: 16.w,
                          right: 16.w,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Total Price',
                                  style: Theme.of(context).textTheme.titleMedium
                                      ?.copyWith(color: AppColors.greyColor),
                                ),
                                SizedBox(width: 1.w),
                                Text(
                                  'EGP ${state.cart.total}',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "TotalQuantity",
                                  style: Theme.of(context).textTheme.titleMedium
                                      ?.copyWith(color: AppColors.greyColor),
                                ),
                                SizedBox(width: 1.w),
                                Text(
                                  ' ${state.cart.totalQuantity}',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16.h),
                            Divider(
                              color: AppColors.blueGreyColor,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Discounted Total:',
                                  style: Theme.of(context).textTheme.titleLarge
                                      ?.copyWith(color: AppColors.greyColor),
                                ),
                                SizedBox(width: 1.w),
                                Text(
                                  'EGP ${state.cart.discountedTotal}',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16.h),

                            InkWell(
                              onTap: () {
                                //logic here
                              },
                              child: Container(
                                height: 48.h,
                                width: 270.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(17.r),
                                  color: Theme.of(context).primaryColor,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: 12.h,
                                    bottom: 12.h,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 83.w),
                                        child: Text(
                                          'Check out',
                                          style:
                                              Theme.of(
                                                context,
                                              ).textTheme.titleMedium,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 27.w,
                                          right: 32.w,
                                        ),
                                        child: Icon(
                                          Icons.arrow_forward,
                                          size: 20.w,
                                          color: AppColors.whiteColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        // Column(
                        //   children: [
                        //     Padding(
                        //       padding: EdgeInsets.only(bottom: 12.h),
                        //       child: Text('Total Price',
                        //           style: Theme.of(context)
                        //               .textTheme
                        //               .titleMedium
                        //               ?.copyWith(
                        //                   color: AppColors.greyColor)),
                        //     ),
                        //     Text(
                        //         'EGP ${state.cart.discountedTotal}',
                        //         style: Theme.of(context)
                        //             .textTheme
                        //             .titleMedium!
                        //             .copyWith(
                        //                 fontWeight: FontWeight.bold,
                        //                 color: AppColors.primaryColor)),
                        //   ],
                        // ),
                      ),
                    ],
                  )
                  : const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  ),
        );
      },
    );
  }
}
