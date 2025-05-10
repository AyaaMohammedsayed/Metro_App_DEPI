import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metro_app/screens/select_station_screen.dart';
import '../../widgets/action_buttons_row.dart';
import '../../widgets/station_dropdown.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});
  final items = ["New Marg", "El-Marg", "Ezbet El-Nakhl", "Ain Shams", "El-Matareya", "Helmeyet El-Zaitoun", "Hadayeq El-Zaitoun",
    "Saray El-Qobba", "Hammamat El-Qobba", "Kobri El-Qobba", "Mansheyet El-Sadr", "El-Demerdash", "Ghamra",
    "Al-Shohadaa", "Orabi", "Nasser", "Sadat", "Saad Zaghloul", "Al-Sayeda Zeinab", "El-Malek El-Saleh",
    "Mar Girgis", "El-Zahraa", "Dar El-Salam", "Hadayek El-Maadi", "Maadi", "Sakanat El-Maadi", "Tora El-Balad",
    "Kozzika", "Tura El-Esmant", "Elmasraa", "Hadayek Helwan", "Wadi Hof", "Helwan University", "Ain Helwan", "Helwan","Shubra Al Khaimah", "Koliet El-Zeraa", "Mezallat", "Khalafawy", "St. Teresa", "Rod El-Farag", "Masaraa",
    "Al-Shohadaa", "Attaba", "Mohamed Naguib", "Sadat", "Opera", "Dokki", "El Bohouth", "Cairo University",
    "Faisal", "Giza", "Omm El-Masryeen", "Sakiat Mekky", "El Monib",
    "Adly Mansour", "Haykestep", "Omar Ibn El Khattab", "Qubaa", "Hesham Barakat", "El Nozha", "El Shams Club",
    "Alf Maskan", "Heliopolis", "Haroun", "Al-Ahram", "Koleyet El-Banat", "Stadium", "Fair Zone", "Abbassiya",
    "Abdou Pasha", "El-Geish", "Bab El Shaariya", "Attaba", "Nasser", "Maspero", "Safaa Hijazy", "Kit-Kat",
    "Sudan", "Imbaba", "El-Bohy", "El-Qawmia", "Ring Road", "Rod El Farag Corridor"
  ].obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StationDropdown(
                hint: 'Select departure station',
                icon: const Icon(Icons.circle,
                    size: 12, color: Colors.blueAccent),
                items: items,
              ),
              const SizedBox(height: 8),
              StationDropdown(
                hint: 'Select destination station',
                icon:
                    const Icon(Icons.location_on, size: 16, color: Colors.red),
                items: items,
              ),
              InteractiveViewer(
                child: const Image(
                  image: AssetImage('assets/metro_map-removebg-preview.png'),
                ),
              ),
              const SizedBox(height: 8),
              const SizedBox(height: 8),
              const SizedBox(height: 8),
              const ActionButtonsRow(),
              const SizedBox(height: 8),
              SizedBox(
                width: 180,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(const SelectStationScreen());
                  },
                  child: const Text(
                    'Select Stations',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
