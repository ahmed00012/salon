

import 'package:beauty_center/constants.dart';
import 'package:beauty_center/provider/reservation_provider.dart';
import 'package:beauty_center/provider/side_menu_provider.dart';
import 'package:beauty_center/repository/salon_info_repository.dart';
import 'package:beauty_center/view/ui/salon_edit/center_info_edit.dart';
import 'package:beauty_center/view/ui/salon_registeration/center_info.dart';
import 'package:beauty_center/view/widgets/side_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SideMenu extends ConsumerWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,ref) {
    final controller = ref.watch(sideMenuFuture);
    double height = MediaQuery.of(context).size.height < 600
        ? 800
        : MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(

      body: ListView(
        children: [
          SizedBox(height: 10,),
          // Row(
          //   children: [
          //     SizedBox(width: 20,),
          //     Icon(Icons.arrow_back_ios,size: 30,),
          //     SizedBox(width: 10,),
          //     Text('Reports',style: TextStyle(
          //         fontSize: height*0.03,
          //         fontWeight: FontWeight.bold
          //     ),),
          //   ],
          // ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(
              'Menu',
              style: TextStyle(
                  fontSize: height * 0.035, fontWeight: FontWeight.bold),
            ),
          ),

          SizedBox(height: 10,),

         GridView(
           physics: NeverScrollableScrollPhysics(),
             shrinkWrap: true,
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
           crossAxisCount: 2,
               childAspectRatio: 1.3
         ),
         children: [

           InkWell(
               onTap: (){
                 Navigator.push(context,MaterialPageRoute(builder: (_)=>CenterInfoEdit()));
               },
               child: SideMenuItem(title: 'Salon Info',icon: 'assets/images/resume.png',)),
           SideMenuItem(title: 'Working Hours',icon: 'assets/images/chronometer.png',),
           SideMenuItem(title: 'Certifications',icon: 'assets/images/certification.png',),
           SideMenuItem(title: 'Work Samples',icon: 'assets/images/add-image.png',),
           SideMenuItem(title: 'Services',icon: 'assets/images/comb.png',),
           SideMenuItem(title: 'Employees',icon: 'assets/images/skills.png',),
           SideMenuItem(title: 'Packages',icon: 'assets/images/gift-card.png',),
           SideMenuItem(title: 'Settings',icon: 'assets/images/gear.png',),
           SideMenuItem(title: 'Call us',icon: 'assets/images/customer-service.png',),
           SideMenuItem(title: 'Privacy',icon: 'assets/images/shield.png',),
           SideMenuItem(title: 'Logout',icon: 'assets/images/log-out.png',),

         ],
         ),
          SizedBox(height: height*0.1,)




        ],
      ),

    );
  }
}
