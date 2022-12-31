
import 'package:beauty_center/constants.dart';
import 'package:beauty_center/provider/auth_provider.dart';
import 'package:beauty_center/view/ui/authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/onbording.dart';
import '../../provider/intro_provider.dart';



class OnboardingScreen extends StatefulWidget {

  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  int _currentPage = 0;
  List colors = const [
    Color(0xffDAD3C8),
    Color(0xffFFE5DE),
    Color(0xffDCF6E6),
  ];

  AnimatedContainer _buildDots({
    int? index,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: Constants.mainColor2,
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    //SizeConfig().init(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
   //   backgroundColor: colors[_currentPage],
      body:  Consumer(
        builder: (context,ref , child) {
          final controller = ref.watch(introFuture);
          return Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: height * .6,
                    child: PageView.builder(
                      physics: const BouncingScrollPhysics(),
                      controller: _controller,
                      onPageChanged: (value) => setState(() => _currentPage = value),
                      itemCount: controller.intro.length,
                      itemBuilder: (context, i) {
                        return Image.network(
                          controller.intro[i].image!,
                          width: width,
                          height: height * .6,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),

                ],
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  height: height * .45,
                  width: width,
                  decoration: BoxDecoration(
                      color: Colors.white,

                      borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),

                    )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: (height >= 840) ? 60 : 30,
                      ),
                      Text(
                        controller.intro[_currentPage].title!.en!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        //  fontFamily: "Mulish",
                          fontWeight: FontWeight.w600,
                          fontSize: height * .035,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        controller.intro[_currentPage].description!.en!,
                        style: TextStyle(
                        //  fontFamily: "Mulish",
                          //fontWeight: FontWeight.w100,
                          fontSize:  height * .02,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: height *.03,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                        controller.intro.length,
                              (int index) => _buildDots(
                            index: index,
                          ),
                        ),
                      ),
                      _currentPage + 1 == controller.intro.length
                          ? Padding(
                        padding: const EdgeInsets.all(30),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>
                                LoginScreen(gender: controller.currentGender,)));
                          },
                          child:  Container(

                              padding: (width <= 550)
                                  ? const EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 20)
                                  : EdgeInsets.symmetric(
                                  horizontal: width * 0.2, vertical: 25),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Constants.mainColor2
                              ),

                              child: Center(child: Text("START",
                              style: TextStyle(fontSize: (width <= 550) ? 13 : 17,color:Colors.white),
                              ))),

                        ),
                      )
                          : Padding(
                        padding: const EdgeInsets.all(30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                _controller.jumpToPage(2);
                              },
                              child: const Text(
                                "SKIP",
                                style: TextStyle(color: Constants.mainColor2),
                              ),
                              style: TextButton.styleFrom(
                                elevation: 0,
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: (width <= 550) ? 13 : 17,
                                ),
                              ),
                            ),

                         InkWell(
                                  onTap: () {
                                    _controller.nextPage(
                                      duration: const Duration(milliseconds: 200),
                                      curve: Curves.easeIn,
                                    );



                                  },
                                  child:  Container(
                                      padding: (width <= 550)
                                          ? const EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 20)
                                          : const EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 25),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Constants.mainColor2
                                      ),

                                      child: Center(child: Text("NEXT",
                                        style: TextStyle(fontSize: (width <= 550) ? 13 : 17,color:Colors.white),
                                      ))),

                                ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}