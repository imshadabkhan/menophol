import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

class SymptomSeverityChart extends StatelessWidget {
  final List<double> actualSleep = [1, 6, 4.5, 6.2, 7, 3.5, 5.5];
  final double maxSleep = 8;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: AspectRatio(
        aspectRatio: 1.9,
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceBetween,
            maxY: 8,
            barTouchData: BarTouchData(enabled: false),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 80, // Ensure enough space for text
                  interval: 2, // Add this to make sure the right labels are triggered
                  getTitlesWidget: (value, meta) {
                    switch (value.toInt()) {
                      case 0:
                        return  Texts.textNormal('None',size: 8,textAlign: TextAlign.start);
                      case 2:
                        return  Texts.textNormal('Mild',size: 8,textAlign: TextAlign.start);
                      case 4:
                        return  Texts.textNormal('Moderate',size: 8,textAlign: TextAlign.start );
                      case 6:
                        return  Texts.textNormal('Severe',size: 8,textAlign: TextAlign.start);
                      case 8:
                        return  Texts.textNormal('very Severe',size: 8,textAlign: TextAlign.start);
                      default:
                        return const SizedBox.shrink();
                    }
                  },
                ),
              ),

              rightTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, _) {
                    if (value.toInt() == 0) {
                      return Column(
                        children: [
                          Widgets.divider(),
                          Widgets.heightSpaceH05,
                          Text('17 March',
                              style: TextStyle(
                                  fontSize: 10, color: Colors.black54)),
                        ],
                      );
                    } else if (value.toInt() == 6) {
                      return Column(
                        children: [
                          Widgets.divider(),
                          Widgets.heightSpaceH05,
                          Text('24 March',
                              style: TextStyle(
                                  fontSize: 10, color: Colors.black54)),
                        ],
                      );
                    }
                    return const SizedBox.shrink(); // Hide for other indexes
                  },
                  reservedSize: 30,
                ),
              ),
            ),
            gridData: FlGridData(
              show: true,
              drawHorizontalLine: true,
              drawVerticalLine: false,

              horizontalInterval: 2,
              getDrawingHorizontalLine: (value) => FlLine(
                color: Colors.grey.withOpacity(0.3),
                strokeWidth: 1,
              ),
            ),
            borderData: FlBorderData(show: false),
            barGroups: List.generate(actualSleep.length, (index) {
              double actual = actualSleep[index];
              return BarChartGroupData(
                x: index,
                barRods: [
                  BarChartRodData(
                    toY: maxSleep,
                    color: Colors.red[100],
                    width: 20,
                    borderRadius: BorderRadius.circular(12),
                    rodStackItems: [
                      BarChartRodStackItem(0, actual, Colors.red.shade400),
                      BarChartRodStackItem(
                          actual, maxSleep, Colors.red.shade100),
                    ],
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
