import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketsTab extends StatelessWidget {
  final String fromStation;
  final String toStation;
  final int stationCount;
  final int ticketPrice;

  final List<String> path; // Added path parameter

  TicketsTab({
    Key? key,
    required this.fromStation,
    required this.toStation,
    required this.stationCount,
    required this.ticketPrice,

    this.path = const [], // Initialize with an empty list
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
        ),
        title: const Text(
          'Your Ticket',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: SingleChildScrollView( // Added SingleChildScrollView
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                elevation: 8,
                shadowColor: Colors.grey.shade300,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Your Journey',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(Icons.circle, color: Colors.blue, size: 16),
                          const SizedBox(width: 8),
                          Text(
                            'From',
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            fromStation,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(Icons.circle, color: Colors.grey, size: 16),
                          const SizedBox(width: 8),
                          Text(
                            'To',
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            toStation,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      if (path.isNotEmpty) ...[ // Show route if available
                        const SizedBox(height: 16),
                        const Text(
                          'Route:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Display the path as a list of stations
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: path.map((station) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Text(
                                '• $station',
                                style: const TextStyle(color: Colors.black87),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                elevation: 8,
                shadowColor: Colors.black.withOpacity(0.3),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.circle, color: Colors.black, size: 16),
                          const SizedBox(width: 8),
                          Text(
                             '  Payment Details ',
                            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black87),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '$stationCount stations',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Ticket Price',
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$$ticketPrice.00',
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Icon(Icons.train, color: Colors.blue, size: 32),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Valid until: 24 hours from Now',
                        style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                      ),
                      const SizedBox(height: 4),
                       Text(
                        'Ref: #MT24012410',
                        style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                      ),
                    ],
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
