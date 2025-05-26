import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menophol/core/widgets/text_widgets.dart';

class SeveritySliderController extends GetxController {
  var currentValue = 0.0.obs;

  void setValue(double value) {
    currentValue.value = value;
  }
}

class SeveritySlider extends StatelessWidget {
  final List<String> labels;
  final SeveritySliderController controller;

  SeveritySlider({
    Key? key,
    required this.labels,
    SeveritySliderController? controller,
  })  : controller = controller ?? Get.put(SeveritySliderController()),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(()=>Texts.textNormal("${controller.currentValue.value.toStringAsFixed(0)}/10",size: 12,textAlign: TextAlign.start),),

          Obx(() {
            return SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.pink.shade100,
                inactiveTrackColor: Colors.pink.shade100,
                trackHeight: 4.0,
                thumbColor: Colors.white,
                thumbShape: CustomThumbShape(
                  thumbRadius: 10.0,
                  borderColor: Colors.pink,
                ),
                overlayColor: Colors.pink.withAlpha(32),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
              ),
              child: Slider(
                min: 0,
                max: (11 - 1).toDouble(),
                divisions: labels.length - 1,
                value: controller.currentValue.value,
                onChanged: (value) => controller.setValue(value),
              ),
            );
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: labels
                .map((label) => Text(
              label,
              style: TextStyle(fontSize: 10, color: Colors.black),
            ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class CustomThumbShape extends SliderComponentShape {
  final double thumbRadius;
  final Color borderColor;

  CustomThumbShape({this.thumbRadius = 10.0, required this.borderColor});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter? labelPainter,
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double value,
        required double textScaleFactor,
        required Size sizeWithOverflow,
      }) {
    final Canvas canvas = context.canvas;

    // Outer pink border
    final Paint borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Inner white fill
    final Paint fillPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, thumbRadius, fillPaint);
    canvas.drawCircle(center, thumbRadius, borderPaint);
  }
}
