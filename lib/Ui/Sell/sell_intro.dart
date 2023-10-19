import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mes_kart/Ui/Sell/register.dart';
import 'package:mes_kart/Ui/Sell/seller_home.dart';


class SellerLogin extends StatefulWidget {
  const SellerLogin({super.key});

  @override
  State<SellerLogin> createState() => _SellerLoginState();
}

class _SellerLoginState extends State<SellerLogin> {
  LocalAuthentication authentication = LocalAuthentication();
  final LocalAuthentication auth = LocalAuthentication();
  String msg = "You are not authorized.";

  Future<bool> authenticate() async {
    final bool? isBiometricAvailable = await authentication.isDeviceSupported();
    print(isBiometricAvailable);
    if (isBiometricAvailable == null)
      return false; // Provide a default value when it's null
    try {
      return await authentication.authenticate(
          localizedReason: "Authenticate to Continue",
          options: const AuthenticationOptions(
            biometricOnly: true,
            useErrorDialogs: true,
            stickyAuth: true,
          ));
    } on PlatformException catch (e) {
      return false; // Handle the error case appropriately
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF4400),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          SizedBox(
            height: 115.h,
          ),
          Image.asset(
            "assets/meslogo.png",
            width: 250.w,
          ),
          SizedBox(
            height: 70.h,
          ),
          Container(
              width: 375.w,
              height: 343.h,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 25.w, top: 45.h),
                      child: Text(
                        'Enter your store pin?',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            color: Color(0xFF27214D),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.20.sp,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    OtpTextField(
                      numberOfFields: 6,
                      borderColor: Color(0xFF512DA8),
                      focusedBorderColor: Color(0xFFFF4400),
                      showFieldAsBox: true,
                      onCodeChanged: (String code) {},
                      onSubmit: (String verificationCode) {
                        setState(() {});
                      }, // end onSubmit
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () async {
                          try {
                            bool pass = await auth.authenticate(
                                localizedReason: 'Authenticate with pattern/pin/passcode');
                            if (pass) {
                              msg = "You are Authenticated.";
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SellerHome(),
                                  ));
                                  setState(()
                              {});
                          }
                          } on PlatformException catch (e) {
                          msg = "Error while opening fingerprint/face scanner";
                          }
                        },
                        child: Container(
                          width: 250.w,
                          height: 60.h,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFF4400),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Log In',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -0.20.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account ?  ',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              color: Color(0xFF27214D),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.20.sp,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ));
                          },
                          child: Text(
                            ' Create an account',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Color(0xFFFF4400),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.20.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ])
          ),
        ]
        ),
      ),
    );
  }
}
