import 'package:flutter/material.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/PrivateInvestigator/PaymentOfInvestigatorFourtyScreen.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';

class TaskCompleteThirtyNineScreen extends StatelessWidget {
  const TaskCompleteThirtyNineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: ClAppbarLeadGridSuffHeart(testingNextPage:  PaymentOfInvestigatorFourtyScreen()),

      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(children:  [
          ClProfilePictureWithCoverWithLinearPercentIndicator(itemHeight: DeviceSize.itemHeight, 
                profilePicturepath: 'assets/images/img_ellipse76.png', 
                coverPicturepath: 'assets/images/img_rectangle690.png', 
                name: 'Ariene McCoy', place: 'Dubai, United Arab Emirates', percentage: 45,),

        ClProfilePictureWithCoverWithLinearPercentIndicator(itemHeight: DeviceSize.itemHeight,  percentage: 65,
        profilePicturepath: 'assets/images/img_ellipse77.png', 
                coverPicturepath: 'assets/images/img_rectangle692.png', 
        ),
        ClProfilePictureWithCoverWithLinearPercentIndicator(itemHeight: DeviceSize.itemHeight,  percentage: 90,
        profilePicturepath: 'assets/images/img_ellipse78.png', 
                coverPicturepath: 'assets/images/img_rectangle694.png', 
        ),
        



       

        ],),
        ),
      ),

    );
  }
}