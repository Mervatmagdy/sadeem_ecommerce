import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/my_colors.dart';
import '../cubit/cart_cubit.dart';

class QuantityButton extends StatefulWidget {
  final dynamic getProduct;
  const QuantityButton({required this.getProduct});

  @override
  State<QuantityButton> createState() => _QuantityButtonState();
}

class _QuantityButtonState extends State<QuantityButton> {

  @override
  Widget build(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context);
    return  Row(
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            cartCubit.addToCart(userId: 1,
                quantity:"minus",
                products: [{
                  "id": widget.getProduct.id as int,
                  "quantity": widget.getProduct.quantity - 1 as int,
                }]);
            // setState(() {
            //   cartCubit.getCartByUserId(userId: 1);
            // });
          },


          icon: Icon(
            Icons.remove_circle_outline_rounded,
            color: AppColors.whiteColor,
            size: 28.sp,
          ),
        ),
        Text(
          widget.getProduct.quantity.toString(),
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.whiteColor,
          ),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {

            cartCubit.addToCart(userId: 1,
                quantity:'plus' ,
                products: [{
                  "id": widget.getProduct.id as int,
                  "quantity": widget.getProduct.quantity + 1 as int,
                }]);
          },
          icon: Icon(
            Icons.add_circle_outline_rounded,
            color: AppColors.whiteColor,
            size: 28.sp,
          ),
        ),
      ],
    );
  }
}
