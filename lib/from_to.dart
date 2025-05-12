import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FromTo extends StatelessWidget {
  const FromTo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Container(
          width: 400,
          height: 170,
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
              Row(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Color(0xff2962FF),
                            radius: 7,
                          ),
                          Container(
                            width: 1,
                            height: 30,
                            color: Colors.grey,
                          ),
                          CircleAvatar(
                            backgroundColor: Color(0xffFF4081),
                            radius: 7,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "From",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.normal),
                          ),
                          Text(
                            "Central Station",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "To",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.normal),
                      ),
                      Text(
                        "Central Station",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              )
            ],
          )),
        ),
      ],
    );
  }
}
