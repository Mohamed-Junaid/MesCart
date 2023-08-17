import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mes_kart/Bloc/addAddress/add_address_bloc.dart';

import '../Bloc/profileAddressBloc/profile_address_bloc.dart';
import 'Widget/address_type.dart';
import 'Widget/toast_message.dart';

class AddDeliveryAdress extends StatefulWidget {
  const AddDeliveryAdress({Key? key}) : super(key: key);

  @override
  State<AddDeliveryAdress> createState() => _AddDeliveryAdressState();
}

class _AddDeliveryAdressState extends State<AddDeliveryAdress> {
  TextEditingController fullname = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController houseNoOrBuildingName = TextEditingController();
  TextEditingController roadname = TextEditingController();
  TextEditingController landmark = TextEditingController();
  final form_key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: mheight * 0.085,
          titleSpacing: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 1,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          title: Text(
            'Add delivery address',
            style: GoogleFonts.lato(
                textStyle: TextStyle(color: Colors.black),
                fontSize: 18.sp,
                fontWeight: FontWeight.w400),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: form_key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: mheight * 0.035,
                ),
                Center(
                  child: Container(
                      width: mwidth * 0.9,
                      height: mheight * 0.077,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(0xffEEEEEE), width: mwidth * 0.004),
                          borderRadius: BorderRadius.circular(3)),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: mwidth * 0.04, top: mheight * 0.006),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: fullname,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field should not be empty';
                            }
                          },
                          onSaved: (value) {
                            fullname.text = value!;
                          },
                          decoration: InputDecoration(
                              hintText: 'Full Name  (Required) *',
                              hintStyle: GoogleFonts.lato(
                                  textStyle:
                                      TextStyle(color: Color(0xffB8B8B8)),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400),
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              disabledBorder: InputBorder.none),
                        ),
                      )),
                ),
                SizedBox(
                  height: mheight * 0.015,
                ),
                Center(
                  child: Container(
                      width: mwidth * 0.9,
                      height: mheight * 0.077,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(0xffEEEEEE), width: mwidth * 0.004),
                          borderRadius: BorderRadius.circular(3)),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: mwidth * 0.04, top: mheight * 0.006),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: phonenumber,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 10) {
                              return 'Phone number should be  10 character';
                            }
                          },
                          onSaved: (value) {
                            phonenumber.text = value!;
                          },
                          decoration: InputDecoration(
                              hintText: 'Phone Number  (Required) *',
                              hintStyle: GoogleFonts.lato(
                                  textStyle:
                                      TextStyle(color: Color(0xffB8B8B8)),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              errorBorder: InputBorder.none),
                        ),
                      )),
                ),
                SizedBox(
                  height: mheight * 0.015,
                ),
                Center(
                  child: Container(
                    width: mwidth * 0.9,
                    height: mheight * 0.077,
                    child: Row(
                      children: [
                        Container(
                            width: mwidth * 0.43,
                            height: mheight * 0.077,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xffEEEEEE),
                                    width: mwidth * 0.004),
                                borderRadius: BorderRadius.circular(3)),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: mwidth * 0.04, top: mheight * 0.006),
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                controller: pincode,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Pincode should not be empty';
                                  }
                                },
                                onSaved: (value) {
                                  pincode.text = value!;
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    hintText: 'Pincode  (Required) *',
                                    hintStyle: GoogleFonts.lato(
                                        textStyle:
                                            TextStyle(color: Color(0xffB8B8B8)),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400),
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none),
                              ),
                            )),
                        SizedBox(
                          width: mwidth * 0.039,
                        ),
                        Container(
                            width: mwidth * 0.43,
                            height: mheight * 0.077,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xffEEEEEE),
                                    width: mwidth * 0.004),
                                borderRadius: BorderRadius.circular(3)),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: mwidth * 0.04, top: mheight * 0.006),
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'State should not be empty';
                                  }
                                },
                                onSaved: (value) {
                                  state.text = value!;
                                },
                                controller: state,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                    hintText: 'State  (Required) *',
                                    hintStyle: GoogleFonts.lato(
                                        textStyle:
                                            TextStyle(color: Color(0xffB8B8B8)),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400),
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: mheight * 0.015,
                ),
                Center(
                  child: Container(
                      width: mwidth * 0.9,
                      height: mheight * 0.077,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(0xffEEEEEE), width: mwidth * 0.004),
                          borderRadius: BorderRadius.circular(3)),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: mwidth * 0.04, top: mheight * 0.006),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: city,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'City should not be empty';
                            }
                          },
                          onSaved: (value) {
                            city.text = value!;
                          },
                          decoration: InputDecoration(
                              hintText: 'City (Required) *',
                              hintStyle: GoogleFonts.lato(
                                  textStyle:
                                      TextStyle(color: Color(0xffB8B8B8)),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400),
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              disabledBorder: InputBorder.none),
                        ),
                      )),
                ),
                SizedBox(
                  height: mheight * 0.015,
                ),
                Center(
                  child: Container(
                      width: mwidth * 0.9,
                      height: mheight * 0.077,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(0xffEEEEEE), width: mwidth * 0.004),
                          borderRadius: BorderRadius.circular(3)),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: mwidth * 0.04, top: mheight * 0.006),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: houseNoOrBuildingName,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field should not be empty';
                            }
                          },
                          onSaved: (value) {
                            houseNoOrBuildingName.text = value!;
                          },
                          decoration: InputDecoration(
                              hintText: 'House No., Building Name (Required) *',
                              hintStyle: GoogleFonts.lato(
                                  textStyle:
                                      TextStyle(color: Color(0xffB8B8B8)),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400),
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              disabledBorder: InputBorder.none),
                        ),
                      )),
                ),
                SizedBox(
                  height: mheight * 0.015,
                ),
                Center(
                  child: Container(
                      width: mwidth * 0.9,
                      height: mheight * 0.077,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(0xffEEEEEE), width: mwidth * 0.004),
                          borderRadius: BorderRadius.circular(3)),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: mwidth * 0.04, top: mheight * 0.006),
                        child: TextFormField(
                          textInputAction: TextInputAction.done,
                          controller: roadname,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field should not be empty';
                            }
                          },
                          onSaved: (value) {
                            roadname.text = value!;
                          },
                          decoration: InputDecoration(
                              hintText: 'Road name, Area, Colony (Required) *',
                              hintStyle: GoogleFonts.lato(
                                  textStyle:
                                      TextStyle(color: Color(0xffB8B8B8)),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400),
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              disabledBorder: InputBorder.none),
                        ),
                      )),
                ),
                SizedBox(
                  height: mheight * 0.015,
                ),
                Center(
                  child: Container(
                      width: mwidth * 0.9,
                      height: mheight * 0.077,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(0xffEEEEEE), width: mwidth * 0.004),
                          borderRadius: BorderRadius.circular(3)),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: mwidth * 0.04, top: mheight * 0.006),
                        child: TextFormField(
                          textInputAction: TextInputAction.done,
                          controller: landmark,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field should not be empty';
                            }
                          },
                          onSaved: (value) {
                            landmark.text = value!;
                          },
                          decoration: InputDecoration(
                              hintText: 'Landmark (Required) *',
                              hintStyle: GoogleFonts.lato(
                                  textStyle:
                                      TextStyle(color: Color(0xffB8B8B8)),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400),
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              disabledBorder: InputBorder.none),
                        ),
                      )),
                ),
                SizedBox(
                  height: mheight * 0.035,
                ),
                Padding(
                  padding: EdgeInsets.only(left: mwidth * 0.05),
                  child: Text('Type of address',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: Color(0xffB8B8B8),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400),
                      )),
                ),
                SizedBox(
                  height: mheight * 0.025,
                ),
                Padding(
                    padding: EdgeInsets.only(left: mwidth * 0.045),
                    child: AddressType()),
                SizedBox(
                  height: mheight * 0.064,
                ),
                Center(
                  child: BlocListener<AddAddressBloc, AddAddressState>(
                    listener: (context, state){
                      if (state is AddAddressBlocLoading) {
                        print("loading");
                        showDialog(
                            context: context,
                            builder: (BuildContext a) => const Center(child: CircularProgressIndicator()));
                        Navigator.of(context).pop();

                      }
                      if (state is AddAddressBlocLoaded) {
                        BlocProvider.of<ProfileAddressBloc>(context).add(FetchProfileAddress());
                        Navigator.of(context).pop();
                       print("loaded");
                      }
                      if (state is AddAddressBlocError) {
                        print("error");

                      }
                    },
                    child: GestureDetector(
                      onTap: () {
                        final isvalid = form_key.currentState?.validate();
                        if (isvalid == true) {
                          form_key.currentState?.save();
                          BlocProvider.of<AddAddressBloc>(context).add(
                              FetchaddAddress(fullname: fullname.text, phonenumber: phonenumber.text, pincode: pincode.text,
                                  state: state.text, city: city.text, houseNoOrBuildingName: houseNoOrBuildingName.text,
                                  roadname: roadname.text, landmark: landmark.text, addressType: addressType));
                        } else {
                          ToastMessage().toastmessage(
                              message: 'Please Select Your Address Type');
                        }
                      },
                      child: Container(
                          width: mwidth * 0.9,
                          height: mheight * 0.068,
                          decoration: BoxDecoration(
                              color: Color(0xFFFF4400),
                              borderRadius: BorderRadius.circular(4)),
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: mwidth * 0.04, top: mheight * 0.006),
                              child: Center(
                                child: Text('SAVE ADDRESS',
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18.sp),
                                    )),
                              ))),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom)),
                SizedBox(
                  height: 20.h,
                )
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    fullname.clear();
    pincode.clear();
    phonenumber.clear();
    state.clear();
    city.clear();
    houseNoOrBuildingName.clear();
    landmark.clear();
    // TODO: implement dispose
    super.dispose();
  }
}
