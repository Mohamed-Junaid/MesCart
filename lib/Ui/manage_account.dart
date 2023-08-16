import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mes_kart/Bloc/Resetprfl/resetprfl_bloc.dart';
import 'package:mes_kart/Bloc/Resetpswd/resetpswd_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ManageAccount extends StatefulWidget {
  const ManageAccount({super.key});

  @override
  State<ManageAccount> createState() => _ManageAccountState();
}

String name = '';
String phoneno = '';
String emailadd = '';

class _ManageAccountState extends State<ManageAccount> {
  bool changepassword = false;

  TextEditingController username = TextEditingController(text: name);

  TextEditingController phone = TextEditingController(text: phoneno);

  TextEditingController email = TextEditingController(text: emailadd);

  TextEditingController oldpassword = TextEditingController();

  TextEditingController newpassword = TextEditingController();

  TextEditingController confirmnewpassword = TextEditingController();

  final form_key = GlobalKey<FormState>();

  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";

  @override
  void initState() {
    getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery
        .of(context)
        .size
        .width;
    var mheight = MediaQuery
        .of(context)
        .size
        .height;
    RegExp regex = RegExp(pattern);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: mheight * 0.085,
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
        title: Text('Manage Your Account',
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400),
            )),
      ),
      body: SingleChildScrollView(
          child: Center(
              child: Form(
                key: form_key,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: mheight * 0.03,
                      ),
                      Container(
                          width: mwidth * 0.9,
                          height: mheight * 0.0834,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xffEEEEEE),
                                  width: mwidth * 0.004),
                              borderRadius: BorderRadius.circular(4.r)),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: mwidth * 0.04, top: mheight * 0.008),
                            child: TextFormField(
                              controller: phone,
                              decoration: InputDecoration(
                                  suffix: SizedBox(
                                      width: mwidth * 0.3,
                                      child: Row(
                                        children: [
                                          phone.text.length == 10
                                              ? Icon(
                                            Icons.check_circle_outlined,
                                            color: Color(0xff187A3F),
                                            size: 17.sp,
                                          )
                                              : Container(),
                                          SizedBox(
                                            width: mwidth * 0.085,
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  top: 20.h),
                                              child: BlocListener<ResetprflBloc,
                                                  ResetprflState>(
                                                listener: (context, state) {
                                                  if (state is ResetprflBlocLoading) {
                                                    print("loading");
                                                    showDialog(
                                                        context: context,
                                                        builder: (
                                                            BuildContext a) =>
                                                        const Center(
                                                            child:
                                                            CircularProgressIndicator()));
                                                  }
                                                  if (state is ResetprflBlocError) {
                                                    print("error");
                                                  }
                                                  if (state is ResetprflBlocLoaded) {
                                                    updatePhone(phone.text);
                                                    Navigator.of(context).pop();
                                                    print("updated");
                                                  }
                                                },
                                                child: TextButton(
                                                  onPressed: () {
                                                    BlocProvider.of<
                                                        ResetprflBloc>(
                                                        context)
                                                        .add(Fetchresetprfl(
                                                        email: emailadd
                                                            .toString(),
                                                        username: name
                                                            .toString(),
                                                        phone: phoneno
                                                            .toString()));
                                                  },
                                                  child: Text(
                                                    'Update',
                                                    style: TextStyle(
                                                        fontSize: 14.sp),
                                                  ),
                                                ),
                                              )),
                                        ],
                                      )),
                                  hintStyle: TextStyle(
                                      color: Color(0xff101010),
                                      fontWeight: FontWeight.w400),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none),
                            ),
                          )),
                      SizedBox(
                        height: mheight * 0.02,
                      ),
                      Container(
                          width: mwidth * 0.9,
                          height: mheight * 0.0834,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xffEEEEEE),
                                  width: mwidth * 0.004),
                              borderRadius: BorderRadius.circular(4.r)),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: mwidth * 0.04, top: mheight * 0.006),
                            child: TextFormField(
                              controller: username,
                              decoration: InputDecoration(
                                  suffix: Padding(
                                    padding: EdgeInsets.only(
                                        top: 20.h, right: 10.w),
                                    child: BlocListener<
                                        ResetprflBloc,
                                        ResetprflState>(
                                      listener: (context, state) {
                                        if (state is ResetprflBlocLoading) {
                                          print("loading");
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext a) =>
                                              const Center(
                                                  child: CircularProgressIndicator()));
                                        }
                                        if (state is ResetprflBlocError) {
                                          Navigator.of(context).pop();
                                          print("error");
                                        }
                                        if (state is ResetprflBlocLoaded) {
                                          updateUsername(username.text,);
                                          Navigator.of(context).pop();
                                          print("updated");
                                        }
                                      },
                                      child: TextButton(
                                        onPressed: () {
                                          BlocProvider.of<ResetprflBloc>(
                                              context).add(
                                              Fetchresetprfl(
                                                  email: emailadd.toString(),
                                                  username: name.toString(),
                                                  phone: phoneno.toString()));
                                        },
                                        child: Text(
                                          'Update',
                                          style: TextStyle(fontSize: 14.sp),
                                        ),
                                      ),
                                    ),
                                  ),
                                  hintStyle: TextStyle(
                                      color: Color(0xff101010),
                                      fontWeight: FontWeight.w400),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none),
                            ),
                          )),
                      SizedBox(
                        height: mheight * 0.02,
                      ),
                      Container(
                          width: mwidth * 0.9,
                          height: mheight * 0.0834,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xffEEEEEE),
                                  width: mwidth * 0.004),
                              borderRadius: BorderRadius.circular(4.r)),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: mwidth * 0.04, top: mheight * 0.006),
                            child: TextFormField(
                              controller: email,
                              decoration: InputDecoration(
                                  suffix: Padding(
                                    padding: EdgeInsets.only(
                                        top: 20.h, right: 9.w),
                                    child: BlocListener<
                                        ResetprflBloc,
                                        ResetprflState>(
                                      listener: (context, state) {
                                        if (state is ResetprflBlocLoading) {
                                          print("loading");
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext a) =>
                                              const Center(
                                                  child: CircularProgressIndicator()));
                                        }
                                        if (state is ResetprflBlocError) {
                                          print("error");
                                        }
                                        if (state is ResetprflBlocLoaded) {
                                          updateEmail(email.text);
                                          Navigator.of(context).pop();
                                          print("updated");
                                        }
                                      },
                                      child: TextButton(
                                        onPressed: () {
                                          BlocProvider.of<ResetprflBloc>(
                                              context).add(
                                              Fetchresetprfl(
                                                  email: emailadd.toString(),
                                                  username: name.toString(),
                                                  phone: phoneno.toString()));
                                        },
                                        child: Text(
                                          'Update',
                                          style: TextStyle(fontSize: 14.sp),
                                        ),
                                      ),
                                    ),
                                  ),
                                  hintStyle: TextStyle(
                                      color: Color(0xff101010),
                                      fontWeight: FontWeight.w400),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none),
                            ),
                          )),
                      SizedBox(
                        height: mheight * 0.036,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            changepassword = !changepassword;
                          });
                        },
                        child: Container(
                            width: mwidth * 0.9,
                            height: mheight * 0.068,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black, width: mwidth * 0.004),
                                borderRadius: BorderRadius.circular(4.r)),
                            child: Center(
                              child: Text('Change Password',
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        color: Color(0xff463607),
                                        fontWeight: FontWeight.w800,
                                        fontSize: 16.sp),
                                  )),
                            )),
                      ),
                      SizedBox(
                        height: mheight * 0.06,
                      ),
                      changepassword == true
                          ? Column(children: [
                        Container(
                            width: mwidth * 0.9,
                            height: mheight * 0.0834,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xffEEEEEE),
                                    width: mwidth * 0.004),
                                borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: mwidth * 0.04, top: mheight * 0.006),
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                controller: oldpassword,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Field should not be empty';
                                  }
                                },
                                onSaved: (value) {
                                  oldpassword.text = value!;
                                },
                                decoration: InputDecoration(
                                    hintText: 'Current Password',
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
                        SizedBox(
                          height: mheight * 0.012,
                        ),
                        Container(
                            width: mwidth * 0.9,
                            height: mheight * 0.0834,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xffEEEEEE),
                                    width: mwidth * 0.004),
                                borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: mwidth * 0.04, top: mheight * 0.006),
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                controller: newpassword,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Field should not be empty';
                                  }
                                },
                                onSaved: (value) {
                                  newpassword.text = value!;
                                },
                                decoration: InputDecoration(
                                    hintText: 'New Password',
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
                                border: Border.all(
                                    color: Color(0xffEEEEEE),
                                    width: mwidth * 0.004),
                                borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: mwidth * 0.04, top: mheight * 0.006),
                              child: TextFormField(
                                obscureText: true,
                                textInputAction: TextInputAction.done,
                                controller: confirmnewpassword,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Field should not be empty';
                                  }
                                },
                                onSaved: (value) {
                                  confirmnewpassword.text = value!;
                                },
                                decoration: InputDecoration(
                                    hintText: 'Confirm Password',
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
                        BlocListener<ResetpswdBloc, ResetpswdState>(
                          listener: (context, state) {
                            if (state is ResetpswdBlocLoading) {
                              print("loading");
                              showDialog(
                                  context: context,
                                  builder: (BuildContext a) =>
                                  const Center(
                                      child: CircularProgressIndicator()));
                            }
                            if (state is ResetpswdBlocLoaded) {
                              ;
                              Navigator.of(context).pop();
                              changepassword = false;
                              print("loaded");
                            }
                            if (state is ResetpswdBlocError) {
                              print("error");
                            }
                          },
                          child: GestureDetector(
                            onTap: () {
                              final isvalid = form_key.currentState?.validate();
                              if (isvalid == true) {
                                form_key.currentState?.save();
                                if (newpassword.text ==
                                    confirmnewpassword.text) {} else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                          Text('Password does not match')));
                                }
                              }
                              BlocProvider.of<ResetpswdBloc>(context)
                                  .add(Fetchresetpswd(
                                newpassword: newpassword.text,
                                oldpassword: oldpassword.text,
                              ));
                            },
                            child: Container(
                                width: mwidth * 0.9,
                                height: mheight * 0.068,
                                decoration: BoxDecoration(
                                    color: Color(0xFFFF4400),
                                    borderRadius: BorderRadius.circular(4.r)),
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        left: mwidth * 0.04,
                                        top: mheight * 0.006),
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
                        ),
                      ])
                          : Container(),
                      Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery
                                  .of(context)
                                  .viewInsets
                                  .bottom))
                    ],
                  ),
                ),
              ))),
    );
  }

  getProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("UserName").toString();
      phoneno = prefs.getString("Phone").toString();
      emailadd = prefs.getString("Email").toString();
    });

  }

  updateUsername(String newName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("UserName", newName);
  }

  updateEmail(String newEmail) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("Email", newEmail);
  }

  updatePhone(String newPhone) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("Phone", newPhone);
  }
}