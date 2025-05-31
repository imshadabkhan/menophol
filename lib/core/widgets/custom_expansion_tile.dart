import 'package:flutter/material.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';
import 'package:get/get.dart';




import 'package:get/get.dart';

class CustomExpansionTileController extends GetxController {
  final RxBool isExpanded = false.obs;

  void toggleExpansion() {
    isExpanded.toggle();
  }
}



class CustomExpansionTile extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const CustomExpansionTile({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CustomExpansionTileController controller =
    Get.put(CustomExpansionTileController(), tag: title); // tag to handle multiple tiles

    return Obx(() {
      final isExpanded = controller.isExpanded.value;

      return Column(
        children: [
          InkWell(
            onTap: controller.toggleExpansion,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: isExpanded
                    ? ColorConstants.darkPrimaryColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Texts.textNormal(
                    title,
                    size: 14,
                    color: isExpanded ? Colors.white : Colors.black,
                  ),
                  Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: isExpanded ? Colors.white : Colors.black,
                  ),
                ],
              ),
            ),
          ),
          Widgets.heightSpaceH05,
          if (isExpanded)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          const SizedBox(height: 12),
        ],
      );
    });
  }
}
