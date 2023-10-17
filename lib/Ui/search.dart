import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mes_kart/Bloc/homeProducts/home_products_bloc.dart';
import 'package:mes_kart/Ui/selected_product.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../Repository/modelclass/homeProductsModelclass.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

late HomeProductsModelclass allproducts;

TextEditingController keyvalue = TextEditingController();
bool isVisible = false;
bool animateButton = false;

class _SearchPageState extends State<SearchPage> {
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  void onRecognitionResult(String text) {
    setState(() {
      keyvalue.text = text;
    });
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {
      animateButton = true;
    });
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {
      animateButton = false;
    });
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
      keyvalue.text = result.recognizedWords;
      animateButton = false;
    });
  }

  @override
  void initState() {
    BlocProvider.of<HomeProductsBloc>(context)
        .add(FetchHomeProducts());
    super.initState();
    _initSpeech();
  }

  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Visibility(
        visible: isVisible,
        child: AvatarGlow(
          animate: animateButton,
          glowColor: Colors.red,
          duration: Duration(milliseconds: 2000),
          repeatPauseDuration: Duration(milliseconds: 100),
          repeat: true,
          endRadius: 80,
          child: FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed:
            _speechToText.isNotListening ? _startListening : _stopListening,
            tooltip: 'Listen',
            child:
            Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic),
          ),
        ),
      ),
      appBar: AppBar(
          toolbarHeight: mheight * 0.13,
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            Column(
              children: [
                SizedBox(
                  height: mheight * 0.03,
                ),
                Container(
                  width: mwidth * 0.95,
                  height: mheight * 0.07,
                  decoration: BoxDecoration(
                      color: Color(0xffF3F3F3),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: mheight * 0.0065, right: mwidth * 0.03),
                    child: TextFormField(
                      controller: keyvalue,
                      onChanged: (value) {
                        BlocProvider.of<HomeProductsBloc>(context)
                            .add(FetchHomeProducts());
                      },
                      onFieldSubmitted:(value) {
                        BlocProvider.of<HomeProductsBloc>(context)
                            .add(FetchHomeProducts());
                      } ,
                      autofocus: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          color: Color(0xff828282),
                          size: 25.sp,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.mic,
                            color: Color(0xff828282),
                            size: 25.sp,
                          ),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'Search by keyword or Brand',
                        hintStyle: TextStyle(
                            color: Color(0xffA5A5A5),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: mwidth * 0.02,
            )
          ]),
      body: BlocBuilder<HomeProductsBloc, HomeProductsState>(
        builder: (context, state) {
          if (state is HomeProductsBlocLoading) {}

          if (state is HomeProductsBlocError) {
            return const Center(child: Text("Error"));
          }

          if (state is HomeProductsBlocLoaded) {
            allproducts =
                BlocProvider.of<HomeProductsBloc>(context).homeProductsModelclass;
            return allproducts.data==null?Center(child: Text("No Data"),):ListView.separated(
                padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                itemBuilder: (context, index) {
                  if (keyvalue.text.toUpperCase() ==
                      allproducts.data![index].name.toString().toUpperCase()) {
                    return Center(
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => SelectedProduct(
                                    productId: allproducts.data![index].id
                                        .toString()))),
                        child: Container(
                          width: 350.w,
                          height: 100.h,
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20.r)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5.sp),
                                spreadRadius: 5.r,
                                blurRadius: 7.r,
                                offset:
                                Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 90.w,
                                height: 100.h,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.r),
                                  child: allproducts.data![index].image == null
                                      ? Image.asset(
                                    "assets/img.png",
                                    fit: BoxFit.cover,
                                  )
                                      : Image.network(
                                    allproducts.data![index].image![0].url
                                        .toString(),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    allproducts.data![index].name.toString(),
                                    style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 19.sp)),
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    maxLines: 1,
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    "Quantity: ${allproducts.data![index].stock.toString()}",
                                    style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            color:
                                            Colors.black.withOpacity(0.5),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.sp)),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    "Price: ₹${allproducts.data![index].price.toString()}",
                                    style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            color:
                                            Colors.black.withOpacity(0.9),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.sp)),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: 0,
                    );
                  }
                },
                separatorBuilder: (context, index) {
                  if (keyvalue.text.toUpperCase() ==
                      allproducts.data![index].name.toString().toUpperCase()) {
                    return SizedBox(
                      height: 10.h,
                    );
                  } else {
                    return SizedBox();
                  }
                },
                itemCount: allproducts.data!.length);
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    keyvalue.clear();
    _speechToText.cancel();
    isVisible = false;
    super.dispose();
  }
}