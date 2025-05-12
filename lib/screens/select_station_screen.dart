import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/station_dropdown.dart';

class SelectStationScreen extends StatelessWidget {
  SelectStationScreen({super.key});

  final items = [
    "New Marg",
    "El-Marg",
    "Ezbet El-Nakhl",
    "Ain Shams",
    "El-Matareya",
    "Helmeyet El-Zaitoun",
    "Hadayeq El-Zaitoun",
    "Saray El-Qobba",
    "Hammamat El-Qobba",
    "Kobri El-Qobba",
    "Mansheyet El-Sadr",
    "El-Demerdash",
    "Ghamra",
    "Al-Shohadaa",
    "Orabi",
    "Nasser",
    "Sadat",
    "Saad Zaghloul",
    "Al-Sayeda Zeinab",
    "El-Malek El-Saleh",
    "Mar Girgis",
    "El-Zahraa",
    "Dar El-Salam",
    "Hadayek El-Maadi",
    "Maadi",
    "Sakanat El-Maadi",
    "Tora El-Balad",
    "Kozzika",
    "Tura El-Esmant",
    "Elmasraa",
    "Hadayek Helwan",
    "Wadi Hof",
    "Helwan University",
    "Ain Helwan",
    "Helwan",
    "Shubra Al Khaimah",
    "Koliet El-Zeraa",
    "Mezallat",
    "Khalafawy",
    "St. Teresa",
    "Rod El-Farag",
    "Masaraa",
    "Al-Shohadaa",
    "Attaba",
    "Mohamed Naguib",
    "Sadat",
    "Opera",
    "Dokki",
    "El Bohouth",
    "Cairo University",
    "Faisal",
    "Giza",
    "Omm El-Masryeen",
    "Sakiat Mekky",
    "El Monib",
    "Adly Mansour",
    "Haykestep",
    "Omar Ibn El Khattab",
    "Qubaa",
    "Hesham Barakat",
    "El Nozha",
    "El Shams Club",
    "Alf Maskan",
    "Heliopolis",
    "Haroun",
    "Al-Ahram",
    "Koleyet El-Banat",
    "Stadium",
    "Fair Zone",
    "Abbassiya",
    "Abdou Pasha",
    "El-Geish",
    "Bab El Shaariya",
    "Attaba",
    "Nasser",
    "Maspero",
    "Safaa Hijazy",
    "Kit-Kat",
    "Sudan",
    "Imbaba",
    "El-Bohy",
    "El-Qawmia",
    "Ring Road",
    "Rod El Farag Corridor"
  ].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text(
          'Select Stations',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('From', style: TextStyle(fontSize: 16)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: StationDropdown(
                        hint: 'Choose starting station',
                        icon: const Icon(
                          Icons.location_on_outlined,
                          color: Colors.blue,
                        ),
                        items: items),
                  ),
                  const SizedBox(height: 12),
                  Center(
                      child: IconButton(
                          highlightColor: Colors.blue,
                          onPressed: () {},
                          icon: const Icon(
                            Icons.swap_vert,
                            color: Colors.white,
                            size: 32,
                          ),
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(12),
                          ))),
                  const Text('To', style: TextStyle(fontSize: 16)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: StationDropdown(
                        hint: 'Choose destination station',
                        icon: const Icon(
                          Icons.location_on_outlined,
                          color: Colors.blue,
                        ),
                        items: items),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
