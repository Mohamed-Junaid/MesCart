import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Bloc/profileAddressBloc/profile_address_bloc.dart';
import '../Repository/modelclass/profileAddressModelclass.dart';
import 'add_address.dart';
import 'address.dart';
import 'bottom_navigation.dart';
import 'login_screen.dart';
import 'manage_account.dart';

String name = '';
String email = '';
String phone = '';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

late ProfileAddressModelclass address;

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    BlocProvider.of<ProfileAddressBloc>(context).add(FetchProfileAddress());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFFFF4400),
      body: SafeArea(
        child: BlocBuilder<ProfileAddressBloc, ProfileAddressState>(
            builder: (context, state) {
          if (state is ProfileAddressBlocLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is ProfileAddressBlocError) {
            return Center(child: Text("Error"));
          }

          if (state is ProfileAddressBlocLoaded) {
            address = BlocProvider.of<ProfileAddressBloc>(context).addressModel;
            return Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: 147.w, right: 146.w, top: 70.h),
                  child: CircleAvatar(
                    radius: 41.r,
                    backgroundImage: const AssetImage("assets/profile.png"),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Container(
                  margin: EdgeInsets.only(left: 125.w, right: 115.w),
                  width: 145.w,
                  height: 20.h,
                  child: Center(
                    child: Text(
                      address.user!.username.toString(),
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.h,
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.r),
                          topRight: Radius.circular(40.r),
                        ),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 24.w, top: 30.h),
                            child: Text(
                              'Email Address',
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                color: const Color(0xFF797C7B),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                height: 1.h,
                              )),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 28.w, top: 10.h),
                            child: Text(
                              address.user!.email.toString(),
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                color: Color(0xFF000D07),
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                height: 1.h,
                              )),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 24.w, top: 30.h),
                            child: Text(
                              'Address',
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                color: const Color(0xFF797C7B),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                height: 1.h,
                              )),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 24.w, top: 10.h),
                            child: address.user!.deliveryAddresses!.isEmpty
                                ? IconButton(
                                    onPressed: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) =>  AddDeliveryAdress())),
                                    icon: Icon(
                                      Icons.add_location_alt,
                                      color: Colors.black,
                                    ),
                                  )
                                : Row(
                                    children: [
                                      SizedBox(
                                        width: 275.w,
                                        child: Text(
                                          "${address.user!.deliveryAddresses![selectedIndex].houseOrBuildingNumber.toString()},"
                                          " ${address.user!.deliveryAddresses![selectedIndex].roadNameOrArea.toString()},"
                                          " ${address.user!.deliveryAddresses![selectedIndex].landmark.toString()},"
                                          " ${address.user!.deliveryAddresses![selectedIndex].city.toString()},"
                                          " ${address.user!.deliveryAddresses![selectedIndex].state.toString()},"
                                          " ${address.user!.deliveryAddresses![selectedIndex].pincode.toString()}",
                                          style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                              color: const Color(0xFF000D07),
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w500,
                                              height: 1.h,
                                            ),
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: true,
                                          maxLines: 2,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (_) =>
                                                     Address())),
                                        child: Container(
                                          margin: EdgeInsets.only(top: 10.h),
                                          width: 20.w,
                                          height: 20.h,
                                          child: Image.asset(
                                            "assets/edit.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 24.w, top: 30.h),
                            child: Text(
                              'Phone  Number',
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                color: const Color(0xFF797C7B),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                height: 1.h,
                              )),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 28.w, top: 10.h),
                            child: Text(
                              address.user!.phone.toString(),
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                color: const Color(0xFF000D07),
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                height: 1.h,
                              )),
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (_) => ManageAccount(UserName: address.user!.username.toString(),
                                        number: address.user!.phone.toString(), emailAddress: address.user!.email.toString(),))),
                              child: Container(
                                width: mwidth * 0.92,
                                height: mheight * 0.083,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xffEEEEEE),
                                        width: mwidth * 0.004),
                                    borderRadius: BorderRadius.circular(4)),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: mwidth * 0.12,
                                      height: mheight * 0.0265,
                                      child: Image.asset(
                                          'assets/manageaccounts.png'),
                                    ),
                                    SizedBox(
                                      width: mwidth * 0.03,
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: mheight * 0.015,
                                        ),
                                        Text(
                                          'Manage Accounts',
                                          style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                                  color: Color(0xff463607),
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w700)),
                                        ),
                                        SizedBox(
                                          height: mheight * 0.007,
                                        ),
                                        Text('Your account details',
                                            style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                                  color: Color(0xffCACACA),
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400),
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      width: mwidth * 0.34,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Colors.black,
                                      size: 22.sp,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: mheight * 0.005,
                          ),
                          Divider(
                            thickness: 1.sp,
                            color: Color(0xffEEEEEE),
                          ),
                          SizedBox(
                            height: mheight * 0.02,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: mwidth * 0.065),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'FAQs',
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          color: Color(0xff463607),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16.sp)),
                                ),
                                SizedBox(
                                  height: mheight * 0.012,
                                ),
                                Text(
                                  'ABOUT US',
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          color: Color(0xff463607),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16.sp)),
                                ),
                                SizedBox(
                                  height: mheight * 0.012,
                                ),
                                Text(
                                  'TERMS OF USE',
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          color: Color(0xff463607),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16.sp)),
                                ),
                                SizedBox(
                                  height: mheight * 0.012,
                                ),
                                Text(
                                  'PRIVACY POLICY',
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          color: Color(0xff463607),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16.sp)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: mheight * 0.025,
                          ),
                          Divider(
                            thickness: mwidth * 0.0067,
                            color: Color(0xffEEEEEE),
                          ),
                          SizedBox(
                            height: mheight * 0.02,
                          ),
                          Center(
                              child: GestureDetector(
                            onTap: () async {
                              final SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.clear();
                              value = false;
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => LoginScreen()));
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 9.h),
                              width: mwidth * 0.84,
                              height: mheight * 0.065,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r),
                                  border: Border.all(
                                      color: Color(0xFFFF4400),
                                      width: mwidth * 0.004)),
                              child: Center(
                                child: Text(
                                  'LOG OUT',
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          color: Color(0xFFFF4400),
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700)),
                                ),
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          } else {
            return SizedBox();
          }
        }),
      ),
    );
  }

// getProfileDetails() async{
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   setState(() {
//     name = prefs.getString("UserName").toString();
//     email = prefs.getString("Email").toString();
//     phone = prefs.getString("Phone").toString();
//   });
//
//
// }
}
