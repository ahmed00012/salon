import 'package:beauty_center/constants.dart';
import 'package:beauty_center/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final controller = ref.watch(homeFuture);
    double height = MediaQuery.of(context).size.height < 600
        ? 800
        : MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(
              'Salon Magdy',
              style: TextStyle(
                  fontSize: height * 0.035, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
              border: TableBorder.all(width: 0.2,color: Colors.black38),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(children: [
                  TableCell(child: Center(child: Text('Time'))),
                  TableCell(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.yellow,width: 3),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    'assets/images/sergio-de-paula-c_GmwfHBDzk-unsplash.jpg'))),
                      ),
                      Text('Ahmed'),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
                  TableCell(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.red,width: 3),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                                image: AssetImage(
                                    'assets/images/vince-fleming-j3lf-Jn6deo-unsplash.jpg'))),
                      ),
                      Text('Osama'),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
                  TableCell(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.green,width: 3),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        'assets/images/jake-nackos-IF9TK5Uy-KI-unsplash.jpg'))),
                          ),
                          Text('Maha'),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      )),
                  TableCell(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Constants.mainColor2,width: 3),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        'assets/images/houcine-ncib-B4TjXnI0Y2c-unsplash(1).jpg'))),
                          ),
                          Text('Bassant'),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      )),
                ]),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
