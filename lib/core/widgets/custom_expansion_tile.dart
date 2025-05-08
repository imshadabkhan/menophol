
import 'package:flutter/material.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

class CustomExpansionTile extends StatefulWidget {
  final String title;
  final List<Widget> children;

  const CustomExpansionTile({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [

        InkWell(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: _isExpanded ? ColorConstants.darkPrimaryColor: Colors.white,
              borderRadius: BorderRadius.circular(10),
              // border: Border.all(color:_isExpanded ? Colors.transparent: Colors.grey,),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Texts.textNormal(widget.title,
                    size: 16,color: _isExpanded ? Colors.white:Colors.black
                ),
                Icon(
                  _isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: _isExpanded ? Colors.white : Colors.black,
                ),
              ],
            ),
          ),
        ),
        Widgets.heightSpaceH05,
        if (_isExpanded)

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.children,
          ),
        const SizedBox(height: 12),
      ],
    );
  }
}