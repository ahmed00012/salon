

import 'package:beauty_center/models/employee_model.dart';
import 'package:beauty_center/provider/make_reservation_provider.dart';
import 'package:beauty_center/view/widgets/default_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants.dart';

class MakeReservation extends ConsumerWidget {
  String? date;
  EmployeeModel ?employeeModel;
  TimeOfDay ?time;
   MakeReservation({Key? key,this.employeeModel,this.date,this.time}) : super(key: key);

  @override
  Widget build(BuildContext context,ref) {
    final controller = ref.watch(makeReservationFuture);
    double height = MediaQuery.of(context).size.height < 600
        ? 800
        : MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final localizations = MaterialLocalizations.of(context);
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(height: 10,),
         Row(
           children: [
             SizedBox(width: 20,),
             Icon(Icons.arrow_back_ios,size: 30,),
             SizedBox(width: 10,),
             Text('Make Reservation',style: TextStyle(
                 fontSize: height*0.03,
                 fontWeight: FontWeight.bold
             ),),
           ],
         ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30,),
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                            employeeModel!.image!))),
              ),
              Text(employeeModel!.name!,style: TextStyle(
                fontSize: height*0.025,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 10,),


              Text(date! ,style: TextStyle(
                  fontSize: height*0.025
              ),),
              Text(localizations.formatTimeOfDay(time!) ,style: TextStyle(
                  fontSize: height*0.025
              ),),
            ],
          ),

          SizedBox(height:40,),



          Align(
              alignment: Alignment.center,
              child: Container(

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),

                  ),
                  child: DefaultTextField(icon: Icons.person,label: 'Client Name'))),
          SizedBox(height: 20,),
          Align(
              alignment: Alignment.center,
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),

                  ),
                  child: DefaultTextField(icon: Icons.phone,label: 'Client Phone',number: true,))),
          SizedBox(height: 20,),
          ListView.builder(
              itemCount: 2,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context,i){

                return  Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                          color: Colors.grey,
                          style: BorderStyle.solid,
                          width: 1),
                    ),
                    child: ExpansionTile(
                      title: Text(''),
                      iconColor: Constants.mainColor2,
                      textColor: Constants.mainColor2,
                      children: [
                        ListView.builder(
                            itemCount: 2,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context,j){
                              return InkWell(
                                onTap: (){

                                },
                                child: Container(
                                    height: height*0.06,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(left: 30),
                                          child: Checkbox(
                                              value: true,
                                              activeColor:
                                              Constants.mainColor2,
                                              onChanged: (value) {
                                                // controller.chooseCategory(i,j);
                                              }),
                                        ),
                                        Text('',style: TextStyle(
                                            fontSize: height*0.02
                                        ),),
                                      ],
                                    )),
                              );
                            })
                      ],
                    ),
                  ),
                );
              }
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width:20,),
              Container(
                width: width*0.3,
                height: height*0.06,
                color: Colors.white,

                child: TextFormField(
                  cursorColor: Constants.mainColor2,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,

                  initialValue: '15',
                  maxLength: 3,

                  decoration:const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                          width: 1, color: Constants.mainColor2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                          width: 1, color: Constants.mainColor2),
                    ),
                    labelText: 'Duration',
                    contentPadding: EdgeInsets.symmetric(horizontal: 5),
                    labelStyle: TextStyle(color: Constants.mainColor2,
                        fontWeight: FontWeight.bold),
                    counterText: "",

                  ),
                  style: TextStyle(
                      fontSize: height*0.02
                  ),
                  onChanged: (value){

                  },


                ),
              ),
              SizedBox(width: 5,),
              Text('Min',style: TextStyle(
                  fontSize: height*0.018
              ),),
              Spacer(),
              Container(
                width: width*0.3,
                height: height*0.06,
                color: Colors.white,

                child: TextFormField(
                  cursorColor: Constants.mainColor2,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,

                  initialValue: '50',
                  maxLength: 4,

                  decoration:const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                          width: 1, color: Constants.mainColor2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                          width: 1, color: Constants.mainColor2),
                    ),
                    labelText: 'Cash',
                    contentPadding: EdgeInsets.symmetric(horizontal: 5),
                    labelStyle: TextStyle(color: Constants.mainColor2,
                        fontWeight: FontWeight.bold),
                    counterText: "",

                  ),
                  style: TextStyle(
                      fontSize: height*0.02
                  ),
                  onChanged: (value){

                  },


                ),
              ),
              SizedBox(width: 5,),
              Text('EGP',style: TextStyle(
                  fontSize: height*0.018
              ),),
              SizedBox(width:20,),
            ],
          ),
          SizedBox(height: 40,),

          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                height: height*0.07,
                width: width*0.5,
                decoration: BoxDecoration(
                  color: Constants.mainColor2,
                  borderRadius: BorderRadius.circular(40)
                ),
                child: Center(child: Text('Done',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: height*0.02
                ),),),
              ),
            ),
          ),

          SizedBox(height: 40,),

        ],
      ),
    );
  }
}
