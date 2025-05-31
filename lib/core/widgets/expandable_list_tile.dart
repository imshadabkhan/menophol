import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/model.dart';

class ExpandableListTile extends StatefulWidget {
  const ExpandableListTile({
    super.key,
    required this.item,
    required this.children,
  });

  final TrackItem item;
  final List<Widget> children;

  @override
  State<ExpandableListTile> createState() => _ExpandableListTileState();
}

class _ExpandableListTileState extends State<ExpandableListTile> {
  bool _isExpanded=false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 0.0, vertical: 6),
      child: InkWell(
        onTap: (){
          _isExpanded=!_isExpanded;
          setState(() {

          });
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: ColorConstants.primaryColor
                  .withAlpha((0.3 * 255).toInt()),
            ),
          ),
          child: Column(

            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.pink.shade50,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 15),
                      child: Image.asset(
                        widget.item.icon,
                        height: 20.h,
                        width: 20.w,
                      ),
                    ),
                  ),
                  Widgets.widthSpaceW2,
                  Expanded(
                    child: Column(


                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Texts.textBold(widget.item.title, size: 14),
                        Widgets.heightSpaceH05,
                        Texts.textNormal(widget.item.subtitle,
                            size: 12, textAlign: TextAlign.start),
                        Widgets.heightSpaceH05,
                       widget.item.subtitle2!=null?
                        Texts.textNormal(widget.item.subtitle2!,
                            size: 12, textAlign: TextAlign.start):Container(),

                      ],
                    ),
                  ),
                ],
              ),

              if(_isExpanded)
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.children),
            ],
          ),
        ),
      ),
    );
  }
}