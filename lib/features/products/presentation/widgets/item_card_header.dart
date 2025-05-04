import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/my_colors.dart';

class ItemCardHeader extends StatefulWidget {
  final String image;
  final bool isWishlisted;
  const ItemCardHeader({
    super.key,
    required this.image,
    required this.isWishlisted,

  });

  @override
  State<ItemCardHeader> createState() => _ItemCardHeaderState();
}

class _ItemCardHeaderState extends State<ItemCardHeader> {
  late bool isWishlisted;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isWishlisted = widget.isWishlisted;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15.r),
          child: Image.asset(
            widget.image,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 5.h,
          right: 5.h,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 15,
            child: IconButton(
              color: AppColors.primaryColor,
              padding: EdgeInsets.zero,
              onPressed: () {
                isWishlisted = !isWishlisted;
                setState(() {});
              },
              icon: isWishlisted == true
                  ? const Icon(Icons.favorite_rounded)
                  : const Icon(
                      Icons.favorite_border_rounded,
                    ),
            ),
          ),
        )
      ],
    );
  }
}
