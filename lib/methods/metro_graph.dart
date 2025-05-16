class MetroGraph {
  final Map<String, List<String>> adjacencyList = {};
  final Map<String, int> stationLines = {}; // Add this map

  void addStation(String station, [int? line]) { // Make line optional here
    if (!adjacencyList.containsKey(station)) {
      adjacencyList[station] = [];
      if (line != null) {
        stationLines[station] = line; // Populate the stationLines map
      }
    }
  }

  void addConnection(String station1, String station2) {
    addStation(station1, stationLines[station1]); // Pass existing line info
    addStation(station2, stationLines[station2]); // Pass existing line info
    adjacencyList[station1]!.add(station2);
    adjacencyList[station2]!.add(station1);
  }

  void initializeMetroGraph() { // Accept the graph instance
    // Line 1
    final line1 = [
      "Helwan", "Ain Helwan", "Helwan University", "Wadi Hof", "Hadayeq Helwan",
      "El-Maasara", "Tura El-Esmant", "Kozzika", "Tora El-Balad", "Sakanat El-Maadi",
      "Maadi", "Hadayeq El-Maadi", "Dar El-Salam", "El-Zahraa", "Mar Girgis",
      "El-Malek El-Saleh", "Al-Sayeda Zeinab", "Saad Zaghloul", "Sadat", "Nasser",
      "Orabi", "Al-Shohadaa", "Ghamra", "El-Demerdash", "Mansheyet El-Sadr",
      "Kobri El-Qobba", "Hammamat El-Qobba", "Saray El-Qobba", "Hadayeq El-Zaitoun",
      "Helmeyet El-Zaitoun", "El-Matareya", "Ain Shams", "Ezbet El-Nakhl", "El-Marg",
      "New Marg"
    ];
    for (int i = 0; i < line1.length; i++) {
      addStation(line1[i], 1); // Assign line number
      if (i < line1.length - 1) {
        addConnection(line1[i], line1[i + 1]);
      }
    }

    // Line 2
    final line2 = [
      "Shubra El-Kheima", "Kolyet El-Zeraa", "Mezallat", "Shubra El-Masara",
      "Road El-Farag","Khalafawy", "Sant Triza","Massara", "Al-Shohadaa", "Attaba", "Mohamed Naguib",
      "Sadat", "Opera", "Dokki", "El-Bohooth", "Cairo University", "Faisal",
      "Giza", "Omm El-Masryeen", "Sakiat Mekky", "El Monib"
    ];
    for (int i = 0; i < line2.length; i++) {
      addStation(line2[i], 2); // Assign line number
      if (i < line2.length - 1) {
        addConnection(line2[i], line2[i + 1]);
      }
    }
    // Transfer stations between Line 1 and Line 2
    addConnection("Al-Shohadaa", "Al-Shohadaa");
    addConnection("Sadat", "Sadat");

    // Line 3 (Partial - based on your list)
    final line3 = [
      "Adly Mansour", "El-Nozha", "Hikestep", "Omar Ibn El-Khattab", "Qubaa",
      "Haroun", "Heliopolis", "Al-Ahram", "Koleyet El-Banat", "Stadium",
      "Fair Zone", "Abbassiya", "Abdou Pasha", "El-Geish", "Bab El-Shaariya",
      "Maspero", "Zamalek", "Kit-Kat"
    ];
    for (int i = 0; i < line3.length; i++) {
      addStation(line3[i], 3); // Assign line number
      if (i < line3.length - 1) {
        addConnection(line3[i], line3[i + 1]);
      }
    }
    // Transfer stations for Line 3
    addConnection("Attaba", "Attaba");
    addConnection("Nasser", "Nasser");
  }

  List<String> findPathBFS(String start, String end) {
    final visited = <String>{};
    final queue = <String>[start];
    final path = <String, String>{}; // station -> previous station

    visited.add(start);

    while (queue.isNotEmpty) {
      final currentStation = queue.removeAt(0);

      if (currentStation == end) {
        break;
      }

      final neighbors = adjacencyList[currentStation] ?? [];
      for (final neighbor in neighbors) {
        if (!visited.contains(neighbor)) {
          visited.add(neighbor);
          queue.add(neighbor);
          path[neighbor] = currentStation;
        }
      }
    }

    if (path.containsKey(end)) {
      final route = <String>[end];
      String? current = end;
      while (current != start && path.containsKey(current)) {
        current = path[current]!;
        route.add(current);
      }
      return route.reversed.toList();
    }

    return []; // No path found
  }
}
