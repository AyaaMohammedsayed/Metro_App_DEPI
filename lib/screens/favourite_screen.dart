import 'package:flutter/material.dart';


class PopularScreen extends StatelessWidget {
  final List<Map<String, String>> topStationsOverall = [
    {'rank': '1', 'station': 'Al-Shohadaa', 'note': 'Most crowded station'},
    {'rank': '2', 'station': 'Sadat', 'note': 'Central & connects lines'},
    {'rank': '3', 'station': 'Attaba', 'note': 'Major interchange'},
    {'rank': '4', 'station': 'Helwan', 'note': 'Start of Line 1'},
    {'rank': '5', 'station': 'New Marg', 'note': 'End of Line 1'},
  ];

  final List<Map<String, dynamic>> topStationsByLine = [
    {
      'line': 'Line 1',
      'color': Colors.red,
      'station': 'Sadat',
      'note': 'Important central station on Line 1',
    },
    {
      'line': 'Line 2',
      'color': Colors.blue,
      'station': 'Shubra El-Kheima',
      'note': 'Major northern station on Line 2',
    },
    {
      'line': 'Line 3',
      'color': Colors.green,
      'station': 'Attaba',
      'note': 'Interchange with Line 2',
    },
    // Add more lines if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Top Metro Stations',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Most Popular Stations Overall',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...topStationsOverall.map((station) {
            int index = int.parse(station['rank']!) - 1;
            return Card(
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor:
                  index < 3 ? Colors.amber : Colors.grey.shade300,
                  child: Text(station['rank']!),
                ),
                title: Text(
                  station['station']!,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(station['note']!),
              ),
            );
          }).toList(),
          const SizedBox(height: 24),
          Text(
            'Top Station by Metro Line',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...topStationsByLine.map((line) {
            return Card(
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: line['color'],
                  child: Icon(Icons.train, color: Colors.white),
                ),
                title: Text(
                  '${line['line']} - ${line['station']}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(line['note']),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}