import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePin extends StatefulWidget {
  const ChangePin({super.key});

  @override
  State<ChangePin> createState() => _ChangePinState();
}

TextEditingController oldPin = TextEditingController();

TextEditingController newPin = TextEditingController();

TextEditingController confirmPin = TextEditingController();

final form_key = GlobalKey<FormState>();

class _ChangePinState extends State<ChangePin> {
  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Text('Change Pin',
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400),
            )),
      ),
      body: Column(children: [
        SizedBox(
          height: 28.h,
        ),
        Center(
          child: Container(
              width: mwidth * 0.9,
              height: mheight * 0.0834,
              decoration: BoxDecoration(
                  border:
                      Border.all(color: Color(0xffEEEEEE), width: mwidth * 0.004),
                  borderRadius: BorderRadius.circular(4)),
              child: Padding(
                padding:
                    EdgeInsets.only(left: mwidth * 0.04, top: mheight * 0.006),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: oldPin,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field should not be empty';
                    }
                  },
                  onSaved: (value) {
                    oldPin.text = value!;
                  },
                  decoration: InputDecoration(
                      hintText: 'Current Pin',
                      hintStyle: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: Color(0xffCACACA),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500)),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none),
                ),
              )),
        ),
        SizedBox(
          height: mheight * 0.012,
        ),
        Container(
            width: mwidth * 0.9,
            height: mheight * 0.0834,
            decoration: BoxDecoration(
                border:
                    Border.all(color: Color(0xffEEEEEE), width: mwidth * 0.004),
                borderRadius: BorderRadius.circular(4)),
            child: Padding(
              padding:
                  EdgeInsets.only(left: mwidth * 0.04, top: mheight * 0.006),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                controller: newPin,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Field should not be empty';
                  }
                },
                onSaved: (value) {
                  newPin.text = value!;
                },
                decoration: InputDecoration(
                    hintText: 'New Pin',
                    hintStyle: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: Color(0xffCACACA),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500)),
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none),
              ),
            )),
        SizedBox(
          height: mheight * 0.012,
        ),
        Container(
            width: mwidth * 0.9,
            height: mheight * 0.0834,
            decoration: BoxDecoration(
                border:
                    Border.all(color: Color(0xffEEEEEE), width: mwidth * 0.004),
                borderRadius: BorderRadius.circular(4)),
            child: Padding(
              padding:
                  EdgeInsets.only(left: mwidth * 0.04, top: mheight * 0.006),
              child: TextFormField(
                obscureText: true,
                textInputAction: TextInputAction.done,
                controller: confirmPin,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Field should not be empty';
                  }
                },
                onSaved: (value) {
                  confirmPin.text = value!;
                },
                decoration: InputDecoration(
                    hintText: 'Confirm Pin',
                    hintStyle: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: Color(0xffCACACA),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500)),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none),
              ),
            )),
        SizedBox(
          height: mheight * 0.02,
        ),
        GestureDetector(
          onTap: () {
            final isvalid = form_key.currentState?.validate();
            if (isvalid == true) {}
          },
          child: Container(
              width: mwidth * 0.9,
              height: mheight * 0.068,
              decoration: BoxDecoration(
                  color: Color(0xFFFF4400),
                  borderRadius: BorderRadius.circular(4.r)),
              child: Padding(
                  padding: EdgeInsets.only(
                      left: mwidth * 0.04, top: mheight * 0.006),
                  child: Center(
                    child: Text('SAVE DETAILS',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 18.sp),
                        )),
                  ))),
        ),
      ]),
    );
  }
}
