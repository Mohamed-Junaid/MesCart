import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../Bloc/getSellerProducts/get_seller_products_bloc.dart';
import '../../Bloc/updateSellerProduct/update_seller_product_bloc.dart';
import '../../Repository/modelclass/GetSellerProductsModel1.dart';
import 'my_store.dart';


class UpdateSellerProduct extends StatefulWidget {
  final String productName;
  final String price;
  final String quantity;
  final String description;
  final GetSellerProductsModel1? sellerModal;
  final int? index;

  const UpdateSellerProduct({ Key? key,
    required this.productName,
    required this.price, required this.quantity, required this.description, required this.sellerModal, required this.index,
  }) : super(key: key);

  @override
  State<UpdateSellerProduct> createState() => _UpdateSellerProductState();
}

String productName ="";
String price ="";
String quantity ="";
String description ="";
String image ="";


// late McGetAllCategories allcategories;

List<File> images = [];
dynamic _image;
String selectedCatId = '';
final picker = ImagePicker();
List<String> categories = [];
TextEditingController nameController = TextEditingController(text: productName);
TextEditingController priceController = TextEditingController(text: price);
TextEditingController descriptionController = TextEditingController(text: description);
TextEditingController stockController = TextEditingController(text: quantity);


class _UpdateSellerProductState extends State<UpdateSellerProduct> {
  @override
  void initState() {
    nameController.text = widget.productName;
    priceController.text = widget.price;
    descriptionController.text = widget.description;
    stockController.text = widget.quantity;

    super.initState();
  }
  final form_key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String? selectedCategory;
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
        child: Form(
          key: form_key,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 26.w,
                    top: 40.h,
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
                          controller: nameController,
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
                          controller: priceController,
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
                    'Quantity',
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
                          controller: stockController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field should not be empty';
                            }
                          },
                          onSaved: (value) {},
                          decoration: InputDecoration(
                              hintText: 'Available Quantity  (Required) *',
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
                      height: mheight * 0.25,
                      decoration: BoxDecoration(
                          color: Color(0xFFF4F4F4),
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: mwidth * 0.04, top: mheight * 0.006),
                        child: TextFormField(
                          controller: descriptionController,
                          textInputAction: TextInputAction.newline,
                          maxLines: 10
                          ,
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
                BlocListener<UpdateSellerProductBloc, UpdateSellerProductState>(
  listener: (context, state) {
    if (state is UpdateSellerProductBlocLoading) {
      print("loading");
      showDialog(
          context: context,
          builder: (BuildContext a) =>
          const Center(child: CircularProgressIndicator()));
    }
    if (state is UpdateSellerProductBlocLoaded) {
      BlocProvider.of<GetSellerProductsBloc>(context).add(FetchSellerProducts());
      Navigator.of(context).pop();
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => MyStore(),));
      print("loaded");
    }
    if (state is UpdateSellerProductBlocError) {
      print("error");
    }
  },
  child: TextButton(
                  onPressed: () {
                    BlocProvider.of<UpdateSellerProductBloc>(context).add(
                        FetchUpdateSellerProducts(
                          stock: int.parse(stockController.text),
                          description: descriptionController.text.toString(),
                          price: int.parse(priceController.text),
                          name: nameController.text.toString(),
                          productId: widget.sellerModal!.data![widget.index!].id.toString(),
                          context: context, image:images,
                          // cateId: selectedCatId,
                        ));
                  },
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
                        'Update',
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
                ),
),
              ],
            ),
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
    stockController.clear();
    descriptionController.clear();
    priceController.clear();
    nameController.clear();
    categories.clear();
    images.clear();
    _image = null;
    super.dispose();
  }
}
