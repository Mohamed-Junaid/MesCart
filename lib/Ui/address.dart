import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mes_kart/Bloc/profileAddressBloc/profile_address_bloc.dart';

import '../Repository/modelclass/profileAddressModelclass.dart';
import 'add_address.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  State<Address> createState() => _AddressState();
}

late ProfileAddressModelclass address;

List<bool> checkboxValues = [];

class _AddressState extends State<Address> {
  void initState() {
    BlocProvider.of<ProfileAddressBloc>(context).add(FetchProfileAddress());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const AddDeliveryAdress())),
          backgroundColor: Colors.white,
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
          elevation: 6.sp,
        ),
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
            title: Text(
              'Shipping address',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                color: Color(0xFF303030),
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              )),
            )),
        body: BlocBuilder<ProfileAddressBloc, ProfileAddressState>(
          builder: (context, state) {
            if (state is ProfileAddressBlocLoading) {
              return CircularProgressIndicator();
            }
            if (state is ProfileAddressBlocError) {
              return Center(
                child: Text("error"),
              );
            }

            if (state is ProfileAddressBlocLoaded) {
              address =
                  BlocProvider.of<ProfileAddressBloc>(context).addressModel;
              return ListView.separated(
                  itemCount: address.user!.deliveryAddresses!.length,
                  itemBuilder: (BuildContext context, int index) {
                    for (int i = 1;
                        i <= address.user!.deliveryAddresses!.length;
                        i++) {
                      checkboxValues.add(false);
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 19.h),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: const Color(0xff264050),
                          title: Text(
                            'Use as the shipping address',
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                              color: Color(0xFF232323),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                            )),
                          ),
                          value: checkboxValues[index],
                          onChanged: (bool? value) {
                            setState(() {
                              checkboxValues[index] = !checkboxValues[index];
                            });
                          },
                          contentPadding: EdgeInsets.only(left: 10.w),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 20.w, right: 20.w, top: 15.h),
                          width: 335.w,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r)),
                            shadows: [
                              BoxShadow(
                                color: Color(0x338A959E),
                                blurRadius: 40.r,
                                offset: Offset(0, 8),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20.w, top: 15.h),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 260.w,
                                      child: Text( address
                                        .user!.deliveryAddresses![index].fullName
                                       .toString(),
                                        style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                          color: Color(0xFF303030),
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w700,
                                        )),overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        maxLines: 1,
                                      ),
                                    ),
                                    Container(
                                      width: 40.w,
                                      height: 20.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),color: Color(0xFF808080),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "${address.user!.deliveryAddresses![index].type.toString()}",
                                          style:
                                          TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w400,
                                            height: 1.79.h,
                                          ),
                                        ),
                                      ),
                                    )

                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Divider(
                                thickness: 1.w,
                                color: Color(0xFFF0F0F0),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 20.w, top: 2.h, right: 19.w),
                                width: 296.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "${address.user!.deliveryAddresses![index].houseOrBuildingNumber.toString()},"
                                        "${address.user!.deliveryAddresses![index].roadNameOrArea.toString()},"
                                        "${address.user!.deliveryAddresses![index].landmark.toString()},"
                                        "${address.user!.deliveryAddresses![index].city.toString()},"
                                        "${address.user!.deliveryAddresses![index].state.toString()},\n"
                                        "${address.user!.deliveryAddresses![index].pincode.toString()},\n",
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                            color: Color(0xFF808080),
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400,
                                            height: 1.79.h,
                                          ),
                                        )),
                                    Text(
                                        "${address.user!.deliveryAddresses![index].phoneNumbers!.first.toString()}\n",
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                            color: Color(0xFF808080),
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                            height: 1.79.h,
                                          ),
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 31.h,
                    );
                  });
            } else {
              return SizedBox();
            }
          },
        ));
  }
}
