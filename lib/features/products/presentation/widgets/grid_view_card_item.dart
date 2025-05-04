import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../cart/presentation/cubit/cart_cubit.dart';
import '../../../cart/presentation/cubit/cart_states.dart';
import '../../../utils/my_assets.dart';
import '../../../utils/my_colors.dart';

import '../../../wishlist/presentation/cubit/wishlist_cubit.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/entities/sub_entities/Single_product_entity.dart';

class GridViewCardItem extends StatefulWidget {
  final SingleProductEntity productEntity;

  const GridViewCardItem({
    Key? key,
    required this.productEntity,
  }) : super(key: key);

  @override
  State<GridViewCardItem> createState() => _GridViewCardItemState();
}

class _GridViewCardItemState extends State<GridViewCardItem> {
  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>();
    final wishlistCubit = context.read<WishlistCubit>();

    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        final isWishlisted = wishlistCubit.isWishlisted(widget.productEntity.id as int?? 0);

        return Container(
          width: 191.w,
          height: 237.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(
              color: AppColors.primaryColor,
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: Image.network(
                      widget.productEntity.images?.first ?? "",
                      fit: BoxFit.contain,
                      width: 191.w,
                      height: 128.h,
                    ),
                  ),
                  Positioned(
                    top: 5.h,
                    right: 2.w,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 15.r,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          wishlistCubit.toggleWishlist(widget.productEntity);
                          setState(() {

                          });
                        },
                        icon: Icon(
                          isWishlisted
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          size: 30,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productEntity.title ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.darkPrimaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "EGP ${widget.productEntity.price ?? 0}",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.darkPrimaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Text(
                          "Review (${widget.productEntity.rating ?? 0})",
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 14.sp,
                            color: AppColors.darkPrimaryColor,
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Image.asset(
                          MyAssets.starIcon,
                          height: 15.h,
                          width: 15.w,
                        ),
                        const Spacer(),
                        state is CartLoadingState
                            ? const CircularProgressIndicator(strokeWidth: 2)
                            : InkWell(
                          onTap: () {
                            cartCubit.addToCart(
                              quantity: "",
                              userId: 1, // replace with real user id
                              products: [
                                {
                                  "id": widget.productEntity.id,
                                  "quantity": 1,
                                }
                              ],
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Added to cart!'),
                                duration: Duration(seconds: 1),
                              ),
                            );
                          },
                          child: Icon(
                            Icons.add_circle,
                            size: 32.sp,
                            color: AppColors.primaryColor,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

