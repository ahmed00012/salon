import 'package:beauty_center/constants.dart';
import 'package:beauty_center/models/reservation_model.dart';
import 'package:flutter/material.dart';

class ReservationDetails extends StatelessWidget {
  ReservationDetails({Key? key, this.reservationModel}) : super(key: key);
  ReservationModel? reservationModel = ReservationModel();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height < 600
        ? 800
        : MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Details',
                      style: TextStyle(
                          fontSize: height * 0.035,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Constants.mainColor2)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.confirmation_num_outlined),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Order Number',
                              style: TextStyle(fontSize: height * 0.02),
                            ),
                            Spacer(),
                            Text(
                              '# ' + reservationModel!.orderNumber.toString(),
                              style: TextStyle(
                                  fontSize: height * 0.02,
                                  color: Colors.black45),
                            )
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.person),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Client',
                              style: TextStyle(fontSize: height * 0.02),
                            ),
                            Spacer(),
                            Text(
                              reservationModel!.clientName!,
                              style: TextStyle(
                                  fontSize: height * 0.02,
                                  color: Colors.black45),
                            )
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.phone),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Client Phone',
                              style: TextStyle(fontSize: height * 0.02),
                            ),
                            Spacer(),
                            Text(
                              reservationModel!.clientPhone!,
                              style: TextStyle(
                                  fontSize: height * 0.02,
                                  color: Colors.black45),
                            )
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.place),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Reservation Place',
                              style: TextStyle(fontSize: height * 0.02),
                            ),
                            Spacer(),
                            Text(
                              'Home',
                              style: TextStyle(
                                  fontSize: height * 0.02,
                                  color: Colors.black45),
                            )
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.calendar_today_outlined),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Time',
                              style: TextStyle(fontSize: height * 0.02),
                            ),
                            Spacer(),
                            Text(
                              'Tue 22 / 12 / 2022 09:00PM',
                              style: TextStyle(
                                  fontSize: height * 0.02,
                                  color: Colors.black45),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Constants.mainColor2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Services',
                              style: TextStyle(
                                  fontSize: height * 0.02,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              reservationModel!.services!.length.toString(),
                              style: TextStyle(
                                  fontSize: height * 0.02,
                                  color: Colors.black45),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListView.builder(
                            itemCount: reservationModel!.services!.length,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemBuilder: (context, i) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      reservationModel!.services![i].name!,
                                      style: TextStyle(fontSize: height * 0.02),
                                    ),
                                    Spacer(),
                                    Text(
                                      reservationModel!.services![i].price!
                                              .toString() +
                                          ' EGP',
                                      style: TextStyle(
                                          fontSize: height * 0.02,
                                          color: Colors.black45),
                                    )
                                  ],
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Constants.mainColor2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Total Payment',
                            style: TextStyle(
                                fontSize: height * 0.02,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text(
                            reservationModel!.totalPayment! + ' EGP',
                            style: TextStyle(
                                fontSize: height * 0.02, color: Colors.black45),
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 1,
                width: width,
                color: Colors.black12,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: height * 0.07,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10))),
                      child: Center(
                        child: Text(
                          'Reject',
                          style: TextStyle(fontSize: height * 0.02),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: height * 0.07,
                      decoration: BoxDecoration(
                          color: Constants.mainColor2,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10))),
                      child: Center(
                        child: Text(
                          'Accept',
                          style: TextStyle(
                              color: Colors.white, fontSize: height * 0.02),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
