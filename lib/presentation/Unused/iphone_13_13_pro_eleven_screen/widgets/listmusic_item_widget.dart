import 'package:flutter/material.dart';
import 'package:virtual_experts/core/utils/image_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:virtual_experts/theme/app_decoration.dart';
import 'package:virtual_experts/theme/app_style.dart';
import 'package:virtual_experts/widgets/custom_image_view.dart';

// ignore: must_be_immutable
class ListmusicItemWidget extends StatelessWidget {
  ListmusicItemWidget(this._name, this._icon);

  final String _name;
  final String _icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        left: 13,
        top: 14,
        right: 13,
        bottom: 14,
      ),
      decoration: AppDecoration.outlineGray3001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: getVerticalSize(
              31,
            ),
            width: getHorizontalSize(
              30,
            ),
            margin: getMargin(
              top: 1,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomImageView(
                  // svgPath: ImageConstant.imgMusicGray30001,
                  // svgPath: ImageConstant.imgMusic,
                  svgPath: _icon,

                  height: getSize(
                    30,
                  ),
                  width: getSize(
                    30,
                  ),
                  alignment: Alignment.topCenter,
                ),
                // CustomImageView(
                //   svgPath: ImageConstant.imgUserGray30001,
                //   height: getSize(
                //     30,
                //   ),
                //   width: getSize(
                //     30,
                //   ),
                //   alignment: Alignment.center,
                // ),
              ],
            ),
          ),
          Padding(
            padding: getPadding(
              left: 8,
              top: 4,
              bottom: 6,
            ),
            child: Text(
              // "Son",
              _name,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtDMSansBold16,
            ),
          ),
          Spacer(),
          CustomImageView(
            svgPath: ImageConstant.imgCheckboxblankcircleline,
            height: getSize(
              24,
            ),
            width: getSize(
              24,
            ),
            margin: getMargin(
              top: 4,
              right: 5,
              bottom: 4,
            ),
          ),
        ],
      ),
    );
  }
}
