import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';

class WidgetTitleAndTextfield extends StatelessWidget {
  final String? textFieldTitle;
  final String textFieldHint;
  final dynamic onChanged;
  final Icon? suffixIcon;
  final String? initialValueExisitingCust;
  final TextEditingController? textFieldController;

  Color fillColor ;

  WidgetTitleAndTextfield({
    super.key,
    this.textFieldTitle,
    required this.textFieldHint,
    required this.onChanged,
    this.textFieldController,
    this.suffixIcon,
    this.initialValueExisitingCust,
    this.fillColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textFieldTitle == null
            ? SizedBox()
            : Text(
                textFieldTitle.toString(),
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    color: ColorConstant.gray800,
                    fontSize: 14),
              ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
            // autofocus: true,
            onChanged: onChanged,
            controller: textFieldController,
            initialValue:
                initialValueExisitingCust.toString() == "null" ? null : null,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              hintText: initialValueExisitingCust.toString() == "null"
                  ? textFieldHint
                  : null,
              hintStyle: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  color: ColorConstant.blueGray900,
                  fontSize: 14),
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0, color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              filled: true, //<-- SEE HERE
              fillColor: fillColor,
              suffixIcon: suffixIcon,
            )),

        // Text(initialValueExisitingCust.toString()),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class WidgetTitleAndTextfieldSharedPreff extends StatelessWidget {
  final String textFieldTitle;

  final String textFieldHint;
  final Icon? suffixIcon;
  final String sharedPreffID;
  final dynamic onChangedd;

  TextEditingController? textFieldController = TextEditingController();

  WidgetTitleAndTextfieldSharedPreff({
    super.key,
    required this.textFieldTitle,
    required this.textFieldHint,
    this.textFieldController,
    this.suffixIcon,
    required this.sharedPreffID,
    this.onChangedd,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textFieldTitle,
          style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              color: ColorConstant.gray800,
              fontSize: 14),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
            onChanged: onChangedd,
            controller: textFieldController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              hintText: textFieldHint,
              hintStyle: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  color: ColorConstant.blueGray900,
                  fontSize: 14),
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0, color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              filled: true, //<-- SEE HERE
              fillColor: Colors.grey.shade100,
              suffixIcon: suffixIcon,
            )),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class WidgetTitleAndTextfieldColorChangeble extends StatefulWidget {
  final String textFieldTitle;

  final String textFieldHint;
  final dynamic onChanged;
  final Color textFieldFillColor;
  final Color? titleFontColor;
  final String? defaultText;

  TextEditingController? textFieldController = TextEditingController();

  WidgetTitleAndTextfieldColorChangeble({
    super.key,
    required this.textFieldTitle,
    required this.textFieldHint,
    this.onChanged,
    this.textFieldFillColor = Colors.white,
    this.titleFontColor,
    this.textFieldController,
    this.defaultText,
  });


  @override
  State<WidgetTitleAndTextfieldColorChangeble> createState() =>
      _WidgetTitleAndTextfieldColorChangebleState();
}

class _WidgetTitleAndTextfieldColorChangebleState
    extends State<WidgetTitleAndTextfieldColorChangeble> {
 

 
 @override
  void initState() {
    super.initState();
 widget.textFieldController = TextEditingController(text: widget.defaultText);
  }
  
 
 
 
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.textFieldTitle,
          style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              color: ColorConstant.gray800,
              fontSize: 14),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 40,
          child: TextField(
              onChanged: widget.onChanged,
              controller: widget.textFieldController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: widget.textFieldHint,
                hintStyle: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    color: ColorConstant.blueGray900,
                    fontSize: 14),
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 0, color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
                filled: true, //<-- SEE HERE
                // fillColor: Colors.grey.shade100,
                fillColor: widget.textFieldFillColor,
              )),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class WidgetTitleAndTextfieldWhiteBackground extends StatelessWidget {
  final String textFieldTitle;

  final String textFieldHint;
  final dynamic onChanged;

  TextEditingController _textFieldController = TextEditingController();

  WidgetTitleAndTextfieldWhiteBackground({
    super.key,
    required this.textFieldTitle,
    required this.textFieldHint,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textFieldTitle,
          style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              // color: ColorConstant.clGreyFontColor3,
              fontSize: DeviceSize.itemWidth / 11.413),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
            onChanged: onChanged,
            // controller: _textFieldController,

            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              hintText: textFieldHint,
              hintStyle: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  // color: ColorConstant.clGreyFontColor3,
                  fontSize: DeviceSize.itemWidth / 11.413),
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0, color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              filled: true, //<-- SEE HERE
              fillColor: Colors.white,
            )),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class WidgetTitleAndTextfieldWhiteBgAdjHeight extends StatelessWidget {
  final String textFieldTitle;
  TextEditingController? textFieldController = TextEditingController();

  final String textFieldHint;
  final dynamic onChanged;
  final int maxLines;

  TextEditingController _textFieldController = TextEditingController();

  WidgetTitleAndTextfieldWhiteBgAdjHeight({
    super.key,
    required this.textFieldTitle,
    required this.textFieldHint,
    required this.onChanged,
    required this.maxLines,
    this.textFieldController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textFieldTitle,
          style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              color: ColorConstant.gray800,
              fontSize: 14),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          // height: 200,
          child: TextField(
              controller: textFieldController,
              // expands: true,
              maxLines: maxLines,
              minLines: null,
              onChanged: onChanged,
              // controller: _textFieldController,

              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: textFieldHint,
                hintStyle: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    // color: ColorConstant.clGreyFontColor3,
                    fontSize: DeviceSize.itemWidth / 14),
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 0, color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
                filled: true, //<-- SEE HERE
                fillColor: Colors.white,
              )),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class WidgetTitleAndTextfielGreyBgAdjHeight extends StatelessWidget {
  final String textFieldTitle;

  final String textFieldHint;
  final dynamic onChanged;
  final int maxLines;

  TextEditingController? textFieldController = TextEditingController();

  //
  Function? validator;

  WidgetTitleAndTextfielGreyBgAdjHeight({
    super.key,
    required this.textFieldTitle,
    required this.textFieldHint,
    required this.onChanged,
    required this.maxLines,
    this.textFieldController,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textFieldTitle,
          style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              // color: ColorConstant.clGreyFontColor3,
              fontSize: DeviceSize.itemWidth / 13.413),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          // height: 200,
          child: TextFormField(
            controller: textFieldController,
            autofocus: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: const Color(0xfff4f4f4),
                hintText: textFieldHint,
                hintStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15)),
            maxLines: 5,
            minLines: 4,
            validator: (String? value) {
              return validator!(value);
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class WidgetTitleAndTextfieldSuffixCalendar extends StatefulWidget {
  final String textFieldTitle;

  final String textFieldHint;
  final dynamic onChanged;
  final Icon suffixIcon;

  TextEditingController? textFieldController = TextEditingController();

  WidgetTitleAndTextfieldSuffixCalendar(
      {super.key,
      required this.textFieldTitle,
      required this.textFieldHint,
      required this.onChanged,
      this.textFieldController,
      required this.suffixIcon});

  @override
  State<WidgetTitleAndTextfieldSuffixCalendar> createState() =>
      _WidgetTitleAndTextfieldSuffixCalendarState();
}

class _WidgetTitleAndTextfieldSuffixCalendarState
    extends State<WidgetTitleAndTextfieldSuffixCalendar> {
  TextEditingController dateinput = TextEditingController();

  saveToSharedPrefferences(String nameOfID, String valueToSave) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString(nameOfID, valueToSave);
  }

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.textFieldTitle,
          style: TextStyle(
              fontFamily: 'Roboto',
               fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
            onChanged: widget.onChanged,
            controller: widget.textFieldController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              // hintText:  dateinput == "" ? widget.textFieldHint : dateinput.text,
              hintText:
                  dateinput.text == "" ? widget.textFieldHint : dateinput.text,

              hintStyle: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  color: ColorConstant.blueGray900,
                  fontSize: 14),
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0, color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              filled: true, //<-- SEE HERE
              fillColor: Colors.grey.shade100,
              suffixIcon: GestureDetector(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(
                            2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        dateinput.text =
                            formattedDate; //set output date to TextField value.
                      });

                      saveToSharedPrefferences(
                          "dateofBirthPrimary", dateinput.text);
                    } else {
                      print("Date is not selected");
                    }
                  },
                  child: widget.suffixIcon),
            )),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}



