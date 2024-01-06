import 'package:flutter/material.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:virtual_experts/routes/app_routes.dart';

class ChatFiftyThreeScreen extends StatelessWidget {
  const ChatFiftyThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Chat',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              SizedBox(
                width: 8,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
        child: MyElevatedButton(
            width: 200,
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.FifteenAboutMescr);
            },
            borderRadius: BorderRadius.circular(10),
            // width: 100,
            backgroundColor: Colors.transparent,
            child: Text(
              'Go Next',
            )),
      ),
    );
  }
}
