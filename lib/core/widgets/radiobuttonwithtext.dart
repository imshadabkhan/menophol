import 'package:flutter/material.dart';

import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

class RadioBtnWithTextChip extends StatelessWidget {
  const RadioBtnWithTextChip({
    super.key,
    required this.label,
    required this.isSelected,
     this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color:  ColorConstants.greyBorderColor),
          color: ColorConstants.chipBGColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 12,
                width: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: isSelected?ColorConstants.darkPrimaryColor:ColorConstants.blackColor, width: 1),
                ),
                child: Center(
                  child: isSelected
                      ? Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      shape: BoxShape.circle,
                    ),
                  )
                      : null,
                ),
              ),
              SizedBox(width: 6),
              Texts.textNormal(label, size: 12),
            ],
          ),
        ),
      ),
    );
  }
}

