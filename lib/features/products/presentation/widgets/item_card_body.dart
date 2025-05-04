import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/my_assets.dart';
import '../../../utils/my_colors.dart';

class HomeCardItemBody extends StatelessWidget {
  const HomeCardItemBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Washing machine",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.darkPrimaryColor,
              fontWeight: FontWeight.w400,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Review (4.8)",
                maxLines: 1,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.darkPrimaryColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                width: 7.w,
              ),
              Image.asset(
                MyAssets.starIcon,
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "EGP 9000",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.darkPrimaryColor,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                splashColor: Colors.transparent,
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
    );
  }
}
