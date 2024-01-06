import 'package:flutter/material.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';

// ignore: must_be_immutable
class Chipviewframe47ItemWidget extends StatelessWidget {
  Chipviewframe47ItemWidget();

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: getPadding(
        left: 30,
        right: 30,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        "Sweet",
        textAlign: TextAlign.left,
        style: TextStyle(
          color: ColorConstant.deepPurpleA200,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w700,
        ),
      ),
      selected: false,
      backgroundColor: ColorConstant.whiteA700,
      selectedColor: ColorConstant.whiteA700,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: ColorConstant.gray300,
          width: getHorizontalSize(
            1,
          ),
        ),
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            8,
          ),
        ),
      ),
      onSelected: (value) {},
    );
  }
}
