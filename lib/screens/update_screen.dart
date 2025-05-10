import 'package:flutter/material.dart';
import 'package:metro_app/widgets/home_app_bar.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../methods/station_tile.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("El-Marg",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Icon(Icons.arrow_forward),
                  Text("Ezbet El-Nakhl",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 228, 221, 221),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("18",
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold)),
                        Text("min", style: TextStyle(fontSize: 16)),
                        SizedBox(height: 4),
                        Text("Remaining Time",
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("4.2",
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold)),
                        Text("km", style: TextStyle(fontSize: 16)),
                        SizedBox(height: 4),
                        Text("Distance to Destination",
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              LinearPercentIndicator(
                lineHeight: 8,
                percent: 0.65,
                backgroundColor: Colors.grey.shade300,
                progressColor: Colors.blue,
                barRadius: const Radius.circular(10),
              ),
              const SizedBox(height: 20),
              const Text("Remaining Stations",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: const [
                    StationTile("New Marg", "Passed", Colors.grey, true, false),
                    StationTile("El-Marg", "Current Station", Colors.blue,
                        false, false),
                    StationTile(
                        "Ezbet El-Nakhl", "3 min", Colors.black, false, false),
                    StationTile(
                        "El-Matareya", "6 min", Colors.black, false, false),
                    StationTile("Helmeyet El-Zaitoun", "9 min", Colors.black,
                        false, false),
                    StationTile(
                        "Saray El-Qobba", "12 min", Colors.black, false, false),
                    StationTile("Hammamat El-Qobba", "15 min", Colors.black,
                        false, false),
                    StationTile(
                        "Kobri El-Qobba", "18 min", Colors.black, false, false),
                    StationTile("Mansheyet El-Sadrg", "21 min", Colors.black,
                        false, true),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const Row(
                children: [
                  Icon(Icons.circle, color: Colors.green, size: 12),
                  SizedBox(width: 6),
                  Text("Live", textAlign: TextAlign.right),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
