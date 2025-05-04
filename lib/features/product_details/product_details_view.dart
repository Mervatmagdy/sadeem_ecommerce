
import 'package:ecommerce/features/cart/presentation/widget/quantity_button.dart';
import 'package:ecommerce/features/products/domain/entities/sub_entities/Single_product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:readmore/readmore.dart';
import '../cart/presentation/cubit/cart_cubit.dart';
import '../utils/my_assets.dart';
import '../utils/my_colors.dart';


class ProductDetailsView extends StatefulWidget {
  static String routeName = "product-details-view";


  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  Widget build(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context);
    var args = ModalRoute
        .of(context)!
        .settings
        .arguments as SingleProductEntity;
    return Scaffold(
      appBar: AppBar(

        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: const Text("Product details"),
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primaryColor,
        titleTextStyle: Theme
            .of(context)
            .textTheme
            .titleLarge!
            .copyWith(
          fontSize: 20.sp,
          color: AppColors.darkPrimaryColor,
          fontWeight: FontWeight.w700,
        ),

      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 300.h,
                width: 398.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(color: AppColors.greyColor, width: 2)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: ImageSlideshow(
                      initialPage: 0,
                      indicatorColor: AppColors.primaryColor,
                      indicatorBackgroundColor: AppColors.whiteColor,
                      indicatorBottomPadding: 20.h,
                      autoPlayInterval: 3000,
                      isLoop: true,
                      children: args.images!.map((url) =>
                          Image.network(
                            url,
                            fit: BoxFit.contain,
                            height: 300.h,
                            width:double.infinity,
                          )).toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      args.title ?? '',
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(
                        fontSize: 18.sp,
                        color: AppColors.darkPrimaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Expanded(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 8.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.r),
                              border: Border.all(
                                color: AppColors.primaryColor,
                                width: 1,
                              ),
                            ),
                            child: Text(
                              "Stock : ${args.stock}",
                              style:
                              Theme
                                  .of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                color: AppColors.darkPrimaryColor,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Image.asset(MyAssets.starIcon,),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            "${args.rating}",
                            style: Theme
                                .of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                              color: AppColors.darkPrimaryColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 55.w,
                          ),
                          Text(
                            "Discount : ${args.discountPercentage} %",
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: AppColors.darkPrimaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      )),

                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                "Description",
                style: Theme
                    .of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkPrimaryColor,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              ReadMoreText(
                args.description ?? '',
                trimLines: 3,
                trimMode: TrimMode.Line,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.normal,
                  color: AppColors.darkPrimaryColor,
                ),
                trimCollapsedText: ' Show More',
                trimExpandedText: ' Show Less',
                moreStyle: Theme
                    .of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.darkPrimaryColor),
                lessStyle: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.darkPrimaryColor),
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                height: 120.h,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "Total price",
                        style:
                        Theme
                            .of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                          fontSize: 18.sp,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "EGP ${args.price}",
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                            fontSize: 18.sp,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 32.w,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle add to cart button press
                        cartCubit.addToCart(userId: 1,
                            quantity:"plus" ,
                            products: [{
                        "id": args.id as int,
                        "quantity": 1 as int,
                        }]);

                      },
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Icon(Icons.add_shopping_cart_outlined,color:AppColors.whiteColor,size:30,),
                          SizedBox(width: 24.w,),
                          Text("Add to cart",

                              style: TextStyle(
                                fontSize: 15.sp,
                                color: AppColors.whiteColor,
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
