import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mes_kart/Repository/modelclass/productCategoryModelclass.dart';

import '../../Bloc/productCategory/product_category_bloc.dart';

class Sell extends StatefulWidget {
  const Sell({super.key});

  @override
  State<Sell> createState() => _SellState();
}

late ProductCategoryModelclass product;

List<File> images = [];
File? _image;

final picker = ImagePicker();
List<String> categories = [];

class _SellState extends State<Sell> {
  @override
  void initState() {
    BlocProvider.of<ProductCategoryBloc>(context).add(FetchaddProduct());
    super.initState();
  }
  Widget build(BuildContext context) {


    String? selectedCategory;
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
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
          ),
        ),
        title: Text(
          'Add Product',
          style: GoogleFonts.lato(
            textStyle: TextStyle(color: Colors.black),
            fontSize: 18.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25.h,
              ),
              Center(
                child: GestureDetector(
                    onTap: () {
                      getGalleryImage().then((value) {
                        images.add(_image!.absolute);
                        _image = null;
                      });
                    },
                    child: SizedBox(
                      width: 200.w,
                      height: 200.h,
                      child: _image != null
                          ? Image.file(
                              _image!.absolute,
                              fit: BoxFit.cover,
                            )
                          : Icon(
                              Icons.add_a_photo_outlined,
                              size: 80,
                            ),
                    )),
              ),
              images.isEmpty
                  ? SizedBox()
                  : Container(
                      margin: EdgeInsets.only(top: 17.h, left: 13.w),
                      height: 120.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: images.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: 100.w,
                            height: 60.h,
                            margin: EdgeInsets.only(
                              top: 20.h,
                            ),
                            child: Image.file(
                              images[index],
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 13.w,
                          );
                        },
                      ),
                    ),
              Padding(
                padding: EdgeInsets.only(
                  left: 26.w,
                  top: 25.h,
                  bottom: 7.h,
                ),
                child: Text(
                  'Product Name',
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    height: 1.17.h,
                  )),
                ),
              ),
              Center(
                child: Container(
                    margin: EdgeInsets.only(top: 8.h, left: 24.w, right: 24.w),
                    width: mwidth * 0.9,
                    height: mheight * 0.07,
                    decoration: BoxDecoration(
                        color: Color(0xFFF4F4F4),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: mwidth * 0.04, top: mheight * 0.006),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Field should not be empty';
                          }
                        },
                        onSaved: (value) {},
                        decoration: InputDecoration(
                            hintText: 'Product Name  (Required) *',
                            hintStyle: GoogleFonts.lato(
                                textStyle: TextStyle(color: Color(0xffB8B8B8)),
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
              Padding(
                padding: EdgeInsets.only(
                  left: 26.w,
                  top: 20.h,
                  bottom: 7.h,
                ),
                child: Text(
                  'Category',
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    height: 1.17.h,
                  )),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 8.h, left: 24.w, right: 24.w),
                  width: mwidth * 0.9,
                  height: mheight * 0.07,
                  decoration: BoxDecoration(
                    color: Color(0xFFF4F4F4),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: mwidth * 0.04, top: mheight * 0.006),
                    child: BlocBuilder<ProductCategoryBloc, ProductCategoryState>(
                      builder: (context, state) {
                        if (state is ProductCategoryBlocLoading) {
                        }
                        if (state is ProductCategoryBlocError) {
                          return Center(child: Text("Error"));
                        }

                        if (state is ProductCategoryBlocLoaded) {

                          product = BlocProvider.of<ProductCategoryBloc>(context)
                              .addProductModelclass;

                          return DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              hintText: 'Category (Required) *',
                              hintStyle: GoogleFonts.lato(
                                textStyle: TextStyle(color: Color(0xffB8B8B8)),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                            value: selectedCategory,
                            // You need to define and manage the selectedCategory variable.
                            onChanged: (newValue) {
                              // Update the selected category when the user makes a selection.
                              setState(() {
                                selectedCategory = newValue;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Field should not be empty';
                              }
                              return null;
                            },
                            items: product.data!.map((category) {
                              return DropdownMenuItem<String>(
                                value: category.name,
                                child: Text(category.name.toString()),
                              );
                            }).toList(),
                            icon: Padding(
                              padding: EdgeInsets.only(right: 8.0.w),
                              child: Icon(
                                Icons.arrow_drop_down,
                              ),
                            ),
                          );
                        } else {
                          return SizedBox();
                        }
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 26.w,
                  top: 20.h,
                  bottom: 7.h,
                ),
                child: Text(
                  'Price',
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    height: 1.17.h,
                  )),
                ),
              ),
              Center(
                child: Container(
                    margin: EdgeInsets.only(top: 8.h, left: 24.w, right: 24.w),
                    width: mwidth * 0.9,
                    height: mheight * 0.07,
                    decoration: BoxDecoration(
                        color: Color(0xFFF4F4F4),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: mwidth * 0.04, top: mheight * 0.006),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Field should not be empty';
                          }
                        },
                        onSaved: (value) {},
                        decoration: InputDecoration(
                            hintText: 'Price  (Required) *',
                            hintStyle: GoogleFonts.lato(
                                textStyle: TextStyle(color: Color(0xffB8B8B8)),
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
              Padding(
                padding: EdgeInsets.only(
                  left: 26.w,
                  top: 20.h,
                  bottom: 7.h,
                ),
                child: Text(
                  'Description',
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    height: 1.17.h,
                  )),
                ),
              ),
              Center(
                child: Container(
                    margin: EdgeInsets.only(top: 8.h, left: 24.w, right: 24.w),
                    width: mwidth * 0.9,
                    height: mheight * 0.2,
                    decoration: BoxDecoration(
                        color: Color(0xFFF4F4F4),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: mwidth * 0.04, top: mheight * 0.006),
                      child: TextFormField(
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.multiline,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Field should not be empty';
                          }
                        },
                        onSaved: (value) {},
                        decoration: InputDecoration(
                            hintText: 'Product Description  (Required) *',
                            hintStyle: GoogleFonts.lato(
                                textStyle: TextStyle(color: Color(0xffB8B8B8)),
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
              TextButton(
                onPressed: () {},
                child: Container(
                  width: 350.w,
                  height: 60.h,
                  margin: EdgeInsets.only(
                      top: 20.h, left: 15.w, right: 15.w, bottom: 10.h),
                  decoration: ShapeDecoration(
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F303030),
                        blurRadius: 20.r,
                        offset: Offset(0, 10),
                        spreadRadius: 0,
                      )
                    ],
                    color: Color(0xFFFF4400),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r)),
                  ),
                  child: Center(
                    child: Text(
                      'Submit',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        height: 1.44.h,
                      )),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getGalleryImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('no image found');
      }
    });
  }

  Future<void> getCameraImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('no image found');
      }
    });
  }

  @override
  void dispose() {
    categories.clear();
    images.clear();
    _image = null;
    super.dispose();
  }
}
