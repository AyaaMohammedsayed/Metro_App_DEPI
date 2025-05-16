import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:metro_app/Location/location.service.dart';

class NearestStationsScreen extends StatefulWidget {
  const NearestStationsScreen({super.key});

  @override
  State<NearestStationsScreen> createState() => _NearestStationsScreenState();
}

class _NearestStationsScreenState extends State<NearestStationsScreen>
    with SingleTickerProviderStateMixin {
  bool loading = true;
  bool error = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  double lat1 = 30.1282, lng1 = 31.2422;
  double lat2 = 30.04967069310472, lng2 = 31.226455400445417;

final Map<String, List<double>> line1 = {
  "Helwan": [29.84934031293794, 31.334016367687212],
  "Ain Helwan": [29.86262770856052, 31.324789568635545],
  "Helwan University": [29.86995921137991, 31.319897219576735],
  "Wadi Hof": [29.87916609968457, 31.313604552577395],
  "Hadayek Helwan": [29.897191781352962, 31.303955466071276],
  "Elmaasara": [29.906143476559695, 31.299494337236023],
  "Tura El-Esmant": [29.926113848773912, 31.287501479565638],
  "Kozzika": [29.9358219959215, 31.28191715442953],
  "Tora El-Balad": [29.946912017667064, 31.272947808402346],
  "Sakanat El-Maadi": [29.953375186159526, 31.2629452427475],
  "Maadi": [29.96063423299798, 31.257538223786742],
  "Hadayek El-Maadi": [29.97030112158066, 31.250639658094915],
  "Dar El-Salam": [29.982212087325575, 31.242296404431666],
  "El-Zahraa": [29.995508416244654, 31.231163522655205],
  "Mar Girgis": [30.086408024811487, 31.330160670788572], // This looks like a mistake and does not belong to Line 1
  "El-Malek El-Saleh": [30.017810338634426, 31.231175490121437],
  "Al-Sayeda Zeinab": [30.029370598274998, 31.23540934198911],
  "Saad Zaghloul": [30.037093671820088, 31.238340542158895],
  "Nasser": [30.053546165024446, 31.23873242908652],
  "Orabi": [30.056725639491706, 31.24205419819322],
  "Ghamra": [30.069103254689942, 31.264616794914744],
  "El-Demerdash": [30.07731606162593, 31.277777491521423],
  "Manshiet El-sadr": [30.08205938951315, 31.28750228511178],
  "Kobri El-Qobba": [30.08720770311218, 31.29409984258541],
  "Hammamat El-Qobba": [30.091282733896524, 31.2989004427856],
  "Saray El-Qobba": [30.100369188373588, 31.305098110464943],
  "Hadayek El-Zaitoun": [30.105963826989306, 31.310472566080772],
  "Helmeyet El-Zaitoun": [30.113259438842345, 31.313956653037383],
  "El-Mataryya": [30.1184860557207, 31.31402450173015],
  "Ain Shams": [30.131860820201908, 31.31909129932082],
  "Ezbet El-Nakhl": [30.139338876337174, 31.32441683541239],
  "El-Marg": [30.15194055611291, 31.335917513493026],
  "New Marg": [30.16204903159066, 31.33736551235905],
};

final Map<String, List<double>> line2 = {
  "El Monib": [29.981084047956077, 31.212291507888473], // Added El Monib
  "Sakit Mekky": [29.995556, 31.208611],
  "Omm El-Masryeen": [30.005674955229686, 31.208082830330646],
  "Giza": [30.010650245518686, 31.207028699086493],
  "Faisl": [30.017386551349443, 31.20383388438167],
  "Cairo University": [30.025980337334712, 31.201130550136348],
  "El Bohoth": [30.035863665235727, 31.20012718459258],
  "Dokki": [30.038469508602187, 31.212157332843102],

  "Sadat": [30.04410156347233, 31.234384168571335],
  "Mohamed Naguib": [30.045286713164405, 31.244161296640005],
  "Attaba": [30.052315621154474, 31.246845490224395],
  "Al-Shohadaa": [30.061088669296932, 31.246016177855466],
  "Masarra": [30.070888751182146, 31.24507424286753],
  "Sant Triza": [30.08797751225653, 31.245501036281887],
  "Khalafawy": [30.097325832312887, 31.24551672542837],
  "Mezallat": [30.104134890332542, 31.245617335374195],
  "Koliet El-Zerraa": [30.11368986208173, 31.248663283605865],
  "Shubra Al-Khaimah": [30.122404332692835, 31.244567914070434],
};

final Map<String, List<double>> line3 = {
  "Adly Mansour": [30.146458, 31.421331],
  "El Haykestep": [30.143879, 31.404694],
  "Omar Ibn El-Khattab": [30.140390428002842, 31.394341917780473],
  "Qobaa": [30.134837728606477, 31.383743658884928],
  "Hesham Barakat": [30.130837729041207, 31.37294002330276],
  "El-Nozha": [30.127989529701583, 31.36017292943716],
  "Nadi El-Shams": [30.12549066976506, 31.348876988332705],
  "Alf Maskan": [30.119022545184993, 31.340189677126684],
  "Heliopolis": [30.108473221008758, 31.338303049235925],
  "Haroun": [30.101418730167286, 31.33296818375056],
  "El-Ahram": [30.091778659186794, 31.326331793168585],
  "Kolleyet El-Banat": [30.08405888802176, 31.32902336433293],
  "Cairo Stadium": [30.072917423329, 31.31710258167277],
  "Fair Zone": [30.07326425357628, 31.300981341093845],
  "El Abassiya": [30.07209639122406, 31.28337499491482],
  "Abdou Pasha": [30.064722, 31.274722],
  "El Geish": [30.061789, 31.266943],
  "Bab El Shaaria": [30.054250793208073, 31.255876999999998],
  "Maspero": [30.055807553821918, 31.232142444178265],
  "Zamalek": [30.041983333474512, 31.22494434165112],
  "Opera": [30.0540, 31.2249], // Added Zamalek

  "Kit Kat": [30.066645771521376, 31.21295888325785],
  "Sudan": [30.070066955754132, 31.20472959760069],  //added Sudan
  "Imbaba": [30.075864612256947, 31.207462066079383],
  "El-Bohy": [30.08213606737123, 31.210535677124238],
  "Al-Qawmeya Al-Arabiya": [30.09323258566825, 31.20901430105026],
  "Rod al-Farag": [30.080620593609687, 31.2453854421589], // Rod al-Farag
};



MapEntry<String, MapEntry<String, double>>? nearestLineAndStation;

  final Map<String, Color> lineColors = {
    "Line 1": const Color(0xFFD32F2F), // Red
    "Line 2": const Color(0xFF1976D2), // Blue
    "Line 3": const Color(0xFFF57C00), // Orange
  };

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );
    findNearestStationOverall();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> findNearestStationOverall() async {
    try {
      await Geolocator.requestPermission();
      //shoubra el kheima
      final position = await LocationService.determinePosition(
        lat1,
        lng1,
      );

      final nearest1 = _findNearest(line1, position);
      final nearest2 = _findNearest(line2, position);
      final nearest3 = _findNearest(line3, position);

      final candidates = {
        "Line 1": nearest1,
        "Line 2": nearest2,
        "Line 3": nearest3,
      };

      String closestLine = "";
      MapEntry<String, double> closestStation = MapEntry("", double.infinity);

      candidates.forEach((line, stationEntry) {
        if (stationEntry.value < closestStation.value) {
          closestLine = line;
          closestStation = stationEntry;
        }
      });

      setState(() {
        nearestLineAndStation = MapEntry(closestLine, closestStation);
        loading = false;
      });

      _animationController.forward();
    } catch (e) {
      setState(() {
        loading = false;
        error = true;
      });
      Get.snackbar(
        "Error",
        "Failed to get location: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red[700],
        colorText: Colors.white,
      );
    }
  }

  MapEntry<String, double> _findNearest(
    Map<String, List<double>> stations,
    Position pos,
  ) {
    double minDistance = double.infinity;
    String nearest = "";

    stations.forEach((name, coords) {
      final distance = Geolocator.distanceBetween(
        pos.latitude,
        pos.longitude,
        coords[0],
        coords[1],
      );
      if (distance < minDistance) {
        minDistance = distance;
        nearest = name;
      }
    });

    return MapEntry(nearest, minDistance);
  }

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
          const SizedBox(height: 20),
          Text(
            "Finding nearest station...",
            style: TextStyle(fontSize: 18, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 60, color: Colors.red[700]),
          const SizedBox(height: 20),
          const Text(
            "Unable to determine location",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          Text(
            "Please check your location services",
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            onPressed: findNearestStationOverall,
            child: const Text(
              "Try Again",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessState() {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(scale: _scaleAnimation.value, child: child);
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      lineColors[nearestLineAndStation!.key]!.withOpacity(0.1),
                      lineColors[nearestLineAndStation!.key]!.withOpacity(0.05),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 25,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: lineColors[nearestLineAndStation!.key]!
                            .withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.directions_subway,
                        color: lineColors[nearestLineAndStation!.key],
                        size: 40,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      nearestLineAndStation!.key.toUpperCase(),
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: lineColors[nearestLineAndStation!.key],
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 25),
                    _buildInfoRow(
                      Icons.location_on,
                      "Nearest Station",
                      nearestLineAndStation!.value.key,
                    ),
                    const SizedBox(height: 20),
                    _buildInfoRow(
                      Icons.linear_scale,
                      "Distance",
                      "${nearestLineAndStation!.value.value.toStringAsFixed(1)} meters",
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: lineColors[nearestLineAndStation!.key],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 14,
                ),
                elevation: 4,
              ),
              onPressed: findNearestStationOverall,
              child: const Text(
                "Refresh Location",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: lineColors[nearestLineAndStation!.key], size: 24),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text("Nearest Metro Station"),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue[700]!, Colors.blue[500]!],
            ),
          ),
        ),
      ),
      body:
          loading
              ? _buildLoadingState()
              : error
              ? _buildErrorState()
              : _buildSuccessState(),
    );
  }
}
