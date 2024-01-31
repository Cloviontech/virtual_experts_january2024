import 'package:flutter/material.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndTextfield.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/bottomBarArrowAndGoNext.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Complete Profile",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
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
                  'Enter your basic details for the better service!',
                  // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              WidgetTitleAndTextfield(
                onChanged: (value) {},
                textFieldHint: 'Enter',
                textFieldTitle: 'Full Name',
              ),
              WidgetTitleAndDropdown(
                DbdItems: ["India", "USA", "UK"],
                DdbHint: 'Select',
                DdbTitle: 'Country',
                onChanged: (value) {},
              ),
              WidgetTitleAndDropdown(
                DbdItems: ["India", "USA", "UK"],
                DdbHint: 'Select',
                DdbTitle: 'City',
                onChanged: (value) {},
              ),
              WidgetTitleAndTextfielGreyBgAdjHeight(
                  textFieldTitle: "Address",
                  textFieldHint: "Select",
                  onChanged: (value) {},
                  maxLines: 5),
              WidgetTitleAndDropdown(
                DbdItems: ["India", "USA", "UK"],
                DdbHint: 'Select',
                DdbTitle: 'Hiring Manager',
                onChanged: (value) {},
              ),
              CustomClRectangleCheckboxWithQuestionWidget2( question: 'I agree to the Terms of Service and Privacy Policy.',),
               

            ],
          ),
        ),
      ),
      bottomNavigationBar: const bottomBarArrowAndGoNext()
    );
  }
}
