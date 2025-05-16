import 'package:flutter/material.dart';

class TicketPricesPage extends StatelessWidget {
  final List<Map<String, String>> ticketPrices = [
    {
      'stations': 'From 1 to 9 stations',
      'price': '8 EGP',
    },
    {
      'stations': 'From 10 to 16 stations',
      'price': '10 EGP',
    },
    {
      'stations': 'From 17 to 23 stations',
      'price': '15 EGP',
    },
    {
      'stations': 'More than 23 stations',
      'price': '20 EGP',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(' Ticket Prices' ,style:TextStyle(fontSize:25,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: ticketPrices.length,
        padding: const EdgeInsets.all(20.0),
        itemBuilder: (context, index) {
          final item = ticketPrices[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Icon(Icons.train, color: Colors.blue),
              title: Text(item['stations']!, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('price: ${item['price']}'),
            ),
          );
        },
      ),
    );
  }
}