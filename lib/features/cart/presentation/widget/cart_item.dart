import 'package:ecommerce/features/cart/domain/entities/sub_entity/cart_products_entity.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce/features/cart/presentation/widget/quantity_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../product_details/product_details_view.dart';
import '../../../products/domain/entities/sub_entities/Single_product_entity.dart';
import '../../../utils/my_colors.dart';

class CartItem extends StatefulWidget {
  final CartProductsEntity getProduct;
  final int cartId;

  const CartItem({
    required this.getProduct,
    required this.cartId,
    Key? key,
  }) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {

  @override
  Widget build(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(width: 1.w, color: AppColors.lightGreyColor),
        ),
        width: double.infinity,
        height: 145.h,
        child: Row(children: [
          Container(
            clipBehavior: Clip.antiAlias,
            height: 145.h,
            width: 130.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Image.network(widget.getProduct.thumbnail, fit: BoxFit.fill),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 16.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.getProduct.title ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 13.h),
                    child: Text(
                      'Count: ${widget.getProduct.quantity}',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.blueGreyColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 14.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'EGP ${widget.getProduct.price}',
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            height: 50.h,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(100.r),
                            ),
                            child:QuantityButton(getProduct: widget.getProduct)
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
