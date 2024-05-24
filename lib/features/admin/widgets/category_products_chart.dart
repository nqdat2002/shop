import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:shop/features/admin/models/sales.dart';

class CategoryProductsChart extends StatelessWidget {
  final List<Sales> earnings;

  const CategoryProductsChart({
    Key? key,
    required this.earnings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<BarChartGroupData> barGroups = earnings
        .asMap()
        .entries
        .map((entry) => BarChartGroupData(
      x: entry.key,
      barRods: [
        BarChartRodData(
          y: entry.value.earning.toDouble(),
          colors: [Colors.blue],
          width: 20,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    ))
        .toList();

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          leftTitles: SideTitles(
            showTitles: true,
            getTitles: (value) {
              return value.toInt().toString();
            },
          ),
          bottomTitles: SideTitles(
            showTitles: true,
            getTitles: (value) {
              final index = value.toInt();
              if (index < 0 || index >= earnings.length) {
                return "";
              }
              return earnings[index].label;
            },
          ),
        ),
        barGroups: barGroups,
      ),
    );
  }
}
