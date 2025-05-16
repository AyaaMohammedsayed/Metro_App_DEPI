import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metro_app/Location/location.service.dart';
import 'package:metro_app/methods/metro_graph.dart';
import 'package:metro_app/screens/tabs/tickets_tab.dart';
import 'package:metro_app/screens/update_screen.dart';
import '../widgets/station_dropdown.dart';

class SelectStationScreen extends StatelessWidget {
  SelectStationScreen({super.key});

  final MetroGraph metroGraph = MetroGraph();
  final RxList<String> items = <String>[].obs;
  final RxString selectedFrom = ''.obs;
  final RxString selectedTo = ''.obs;

  // خريطة إحداثيات المحطات (كما هي)
  final Map<String, List<double>> stationCoordinates = {
    // خط أول (حلوان ⇄ المرج الجديدة)
    "Helwan": [29.8410, 31.3009],
    "Ain Helwan": [29.8677, 31.3135],
    "Helwan University": [29.8719, 31.3139],
    "Wadi Hof": [29.8893, 31.3107],
    "Hadayeq Helwan": [29.9027, 31.3074],
    "El-Maasara": [29.9133, 31.3039],
    "Tora El-Asmant": [29.9213, 31.3017],
    "Kozzika": [29.9306, 31.2997],
    "Tora El-Balad": [29.9395, 31.2975],
    "Sakanat El-Maadi": [29.9478, 31.2955],
    "Maadi": [29.9626, 31.2764],
    "Hadayeq El-Maadi": [29.9706, 31.2683],
    "Dar El-Salam": [29.9801, 31.2568],
    "El-Zahraa": [29.9911, 31.2457],
    "Mar Girgis": [30.0321, 31.2381],
    "El-Malek El-Saleh": [30.0362, 31.2437],
    "Al-Sayeda Zeinab": [30.0400, 31.2430],
    "Saad Zaghloul": [30.0431, 31.2382],
    "Sadat": [30.0459, 31.2312],
    "Nasser": [30.0495, 31.2280],
    "Orabi": [30.0512, 31.2334],
    "Al-Shohadaa": [30.0532, 31.2396],
    "Ghamra": [30.0556, 31.2450],
    "El-Demerdash": [30.0585, 31.2523],
    "Mansheyet El-Sadr": [30.0610, 31.2610],
    "Kobri El-Qobba": [30.0655, 31.2687],
    "Hammamat El-Qobba": [30.0700, 31.2763],
    "Saray El-Qobba": [30.0753, 31.2842],
    "Hadayeq El-Zaitoun": [30.0804, 31.2929],
    "Helmeyet El-Zaitoun": [30.0881, 31.3009],
    "El-Matareya": [30.0932, 31.3087],
    "Ain Shams": [30.1041, 31.3163],
    "Ezbet El-Nakhl": [30.1124, 31.3308],
    "El-Marg": [30.1233, 31.3469],
    "New Marg": [30.1506, 31.3674],

    // خط ثاني (شبرا الخيمة ⇄ المنيب)
    "Shubra El-Kheima": [30.1282, 31.2422],
    "Kolyet El-Zeraa": [30.1177, 31.2462],
    "Mezallat": [30.1079, 31.2491],
    "Shubra El-Masara": [30.1004, 31.2515],
    "Road El-Farag": [30.0939, 31.2535],
    "Massara": [30.0855, 31.2562],
    "Al-Shohadaa": [30.0532, 31.2396], // محطة تبادل
    "Attaba": [30.0561, 31.2447],     // محطة تبادل
    "Mohamed Naguib": [30.0506, 31.2421],
    "Sadat": [30.0459, 31.2312],       // محطة تبادل
    "Opera": [30.0442, 31.2243],
    "Dokki": [30.0415, 31.2157],
    "El-Bohooth": [30.0381, 31.2106],
    "Cairo University": [30.0305, 31.2084],
    "Faisal": [30.0223, 31.2006],
    "Giza": [30.0147, 31.1924],
    "Omm El-Masryeen": [30.0039, 31.1891],
    "Sakiat Mekky": [29.9945, 31.1915],
    "El Monib": [29.9933, 31.2168],

    // خط ثالث (عدلي منصور ⇄ غمرة أو مستقبلياً روض الفرج)
    "Adly Mansour": [30.1231, 31.3955],
    "El-Nozha": [30.1174, 31.3745],
    "Hikestep": [30.1106, 31.3635],
    "Omar Ibn El-Khattab": [30.1027, 31.3550],
    "Qubaa": [30.0973, 31.3484],
    "Haroun": [30.0862, 31.3301],
    "Heliopolis": [30.0888, 31.3422],
    "Al-Ahram": [30.0786, 31.3277],
    "Koleyet El-Banat": [30.0757, 31.3216],
    "Stadium": [30.0722, 31.3138],
    "Fair Zone": [30.0704, 31.3080],
    "Abbassiya": [30.0734, 31.2806],
    "Abdou Pasha": [30.0686, 31.2721],
    "El-Geish": [30.0649, 31.2609],
    "Bab El-Shaariya": [30.0602, 31.2521],
    "Maspero": [30.0522, 31.2288], // تحت الإنشاء
    "Zamalek": [30.0540, 31.2249], // تحت الإنشاء
    "Kit-Kat": [30.0682, 31.2233],
  };

  // دالة مساعدة للحصول على اسم خط المترو
  String _getMetroLineName(String stationName) {
    if (metroGraph.stationLines.containsKey(stationName)) {
      final line = metroGraph.stationLines[stationName];
      if (line != null) {
        return "Line $line";
      }
    }
    return "";
  }

  // دالة مساعدة لحساب عدد المحطات في المسار
  int _calculateStationCount(List<String> route) {
    return route.length;
  }

  // دالة مساعدة لتحديد لون الخط
  Color _getLineColor(String stationName) {
    final lineName = _getMetroLineName(stationName); // Get line *name*
    if (lineName == "Line 1") {
      return Colors.blue.shade700;
    } else if (lineName == "Line 2") {
      return Colors.red.shade400;
    } else if (lineName == "Line 3") {
      return Colors.green.shade600;
    }
    // هذا هو المكان الأكثر احتمالية لحدوث الخطأ.  تأكد من إرجاع لون افتراضي مناسب.
    return Colors.grey; // لون افتراضي آمن
  }

  int calculateTicketPrice(int stationCount) {
    if (stationCount <= 9) return 8;
    if (stationCount <= 16) return 10;
    if (stationCount <= 23) return 15;
    return 20;
  }

  @override
  Widget build(BuildContext context) {
    // تهيئة الرسم البياني للمترو وملء قائمة العناصر
    metroGraph.initializeMetroGraph();
    items.value = metroGraph.adjacencyList.keys.toList().obs;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
        ),
        title: const Text(
          'Select Stations',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black87,
            letterSpacing: 0.5,
          ),
        ),
        elevation: 1,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              elevation: 8,
              shadowColor: Colors.blue.shade100,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'From',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueAccent,
                      ),
                    ),
                    const SizedBox(height: 10),
                    StationDropdown(
                      hint: 'Choose starting station',
                      icon: const Icon(Icons.location_on_outlined, color: Colors.blueAccent),
                      items: items,
                      selectedStation: selectedFrom,
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: Colors.blueAccent,
                          padding: const EdgeInsets.all(14),
                          shadowColor: Colors.blueAccent.withOpacity(0.5),
                          elevation: 6,
                        ),
                        onPressed: () {
                          final temp = selectedFrom.value;
                          selectedFrom.value = selectedTo.value;
                          selectedTo.value = temp;
                        },
                        child: const Icon(
                          Icons.swap_vert,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'To',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueAccent,
                      ),
                    ),
                    const SizedBox(height: 10),
                    StationDropdown(
                      hint: 'Choose destination station',
                      icon: const Icon(Icons.location_on_outlined, color: Colors.blueAccent),
                      items: items,
                      selectedStation: selectedTo,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 48),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        elevation: 8,
                        shadowColor: Colors.blueAccent.withOpacity(0.6),
                      ),
                      icon: const Icon(Icons.navigation, size: 28, color: Colors.white),
                      label: const Text(
                        "Start Navigation",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                      onPressed: () {
                        if (selectedFrom.value.isEmpty) {
                          Get.snackbar(
                            "Error",
                            "Please select starting station",
                            colorText: Colors.black,
                          );
                          return;
                        }
                        if (selectedTo.value.isEmpty) {
                          Get.snackbar(
                            "Error",
                            "Please select destination station",
                            colorText: Colors.black,
                          );
                          return;
                        }

                        if (!stationCoordinates.containsKey(selectedTo.value)) {
                          Get.snackbar(
                            "Location Unavailable",
                            "Coordinates not available for ${selectedTo.value}.",
                            colorText: Colors.black,
                          );
                          return;
                        }

                        final lat = stationCoordinates[selectedTo.value]![0];
                        final lng = stationCoordinates[selectedTo.value]![1];

                        LocationService.startMonitoringProximity(
                          destinationLat: lat,
                          destinationLng: lng,
                          onNotificationSent: () {
                            print("✅ Notification sent near ${selectedTo.value}");
                          },
                        );

                        Get.snackbar(
                          "Monitoring Started",
                          "We'll notify you before you reach ${selectedTo.value}.",
                          colorText: Colors.black,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        elevation: 8,
                        shadowColor: Colors.blueAccent.withOpacity(0.6),
                      ),
                      icon: const Icon(Icons.local_activity, size: 28, color: Colors.white),
                      label: const Text(
                        "Show Ticket",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                      onPressed: () {
                        if (selectedFrom.value.isEmpty) {
                          Get.snackbar(
                            "Error",
                            "Please select starting station",
                            colorText: Colors.black,
                          );
                          return;
                        }
                        if (selectedTo.value.isEmpty) {
                          Get.snackbar(
                            "Error",
                            "Please select destination station",
                            colorText: Colors.black,
                          );
                          return;
                        }

                        final route = metroGraph.findPathBFS(selectedFrom.value, selectedTo.value);

                        if (route.isEmpty) {
                          Get.snackbar(
                            "Error",
                            "No route found between the selected stations.",
                            colorText: Colors.black,
                          );
                          return;
                        }

                        final stationCount = _calculateStationCount(route);
                        final ticketPrice = calculateTicketPrice(stationCount);
                        // ********* FIX IS HERE *********
                        final fromLineColor = _getLineColor(selectedFrom.value); // Get color for FROM
                        final toLineColor = _getLineColor(selectedTo.value);   // Get color for TO
                        final lineColor = toLineColor; // Pass the TO color.
 
                        Get.to(
                          () => TicketsTab(
                            fromStation: selectedFrom.value,
                            toStation: selectedTo.value,
                            stationCount: stationCount,
                            ticketPrice: ticketPrice,
              
                            path: route,
                          ),
                        );
                     
                      },
                    ),
                  ),
                    
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
