import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class StationTile extends StatelessWidget {
  final String station;
  final String status;
  final Color color;
  final bool isFirst;
  final bool isLast;

  const StationTile(
    this.station,
    this.status,
    this.color,
    this.isFirst,
    this.isLast, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.1,
      isFirst: isFirst,
      isLast: isLast,
      indicatorStyle: IndicatorStyle(
        width: 10,
        color: color,
      ),
      beforeLineStyle: LineStyle(
        color: Colors.grey.shade300,
        thickness: 2,
      ),
      afterLineStyle: LineStyle(
        color: Colors.grey.shade300,
        thickness: 2,
      ),
      endChild: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(station, style: TextStyle(color: color)),
          subtitle: Text(status, style: const TextStyle(color: Colors.grey)),
        ),
      ),
    );
  }
}
