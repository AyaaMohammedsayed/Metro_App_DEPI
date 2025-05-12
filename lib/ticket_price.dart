import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TicketPrice extends StatelessWidget {
  const TicketPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20), // الحواف الدائرية
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // لون الظل
            blurRadius: 10, // نعومة الظل
            offset: Offset(4, 4), // اتجاه الظل (يمين وتحت)
          ),
        ],
      ),
      child: Center(
          child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Color(0xff2962FF),
                radius: 7,
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                children: [
                  Text(
                    " Blue Line",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "7 Stations",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ticket Price",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.normal),
                    ),
                    Text(
                      "\$4.50",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Icon(Icons.train, color: Colors.blue, size: 50),
                  SizedBox(
                    width: 10,
                  )
                ],
              )
            ],
          ),
          Divider(
            thickness: 1,
            endIndent: 30,
            indent: 30,
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Valid until: 11:30 AM Today",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              Text(
                "Ref: #MT24012410",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
            ],
          )
        ],
      )),
    );
  }
}
