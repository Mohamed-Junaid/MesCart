import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mes_kart/Bloc/Resetprfl/resetprfl_bloc.dart';
import 'package:mes_kart/Bloc/Resetpswd/resetpswd_bloc.dart';
import 'package:mes_kart/Bloc/Signin/mes_signin_bloc.dart';
import 'package:mes_kart/Bloc/Signup/meskartSignup_bloc.dart';
import 'package:mes_kart/Bloc/addAddress/add_address_bloc.dart';
import 'package:mes_kart/Bloc/addRating/add_rating_bloc.dart';
import 'package:mes_kart/Bloc/addSellerProduct/add_seller_product_bloc.dart';
import 'package:mes_kart/Bloc/addtoCart/addto_cart_bloc.dart';
import 'package:mes_kart/Bloc/banners/banner_bloc.dart';
import 'package:mes_kart/Bloc/cartPage/cart_page_bloc.dart';
import 'package:mes_kart/Bloc/createSellerAc/create_seller_ac_bloc.dart';
import 'package:mes_kart/Bloc/deleteAddress/delete_address_bloc.dart';
import 'package:mes_kart/Bloc/deleteCartProduct/delete_cart_product_bloc.dart';
import 'package:mes_kart/Bloc/getAproduct/get_aproduct_bloc.dart';
import 'package:mes_kart/Bloc/homeProducts/home_products_bloc.dart';
import 'package:mes_kart/Bloc/placeOrder/place_orders_bloc.dart';
import 'package:mes_kart/Bloc/profileAddressBloc/profile_address_bloc.dart';
import 'package:mes_kart/Bloc/profileImage/profile_image_bloc.dart';
import 'package:mes_kart/Bloc/search/search_bloc.dart';
import 'package:mes_kart/Bloc/verifyID/verify_id_bloc.dart';
import 'Bloc/allOrders/all_orders_bloc.dart';
import 'Bloc/cartPlaceOrder/cart_place_order_bloc.dart';
import 'Bloc/deleteSellerProduct/delete_seller_product_bloc.dart';
import 'Bloc/getSellerProducts/get_seller_products_bloc.dart';
import 'Bloc/productCategory/product_category_bloc.dart';
import 'Bloc/updateSellerProduct/update_seller_product_bloc.dart';
import 'Ui/splash_screen.dart';

const String basePath = 'http://62.72.12.251:9999/api';
bool isRegistered=false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 829),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => MeskartBloc(),
              ),
              BlocProvider(create: (context) => MesSigninBloc()),
              BlocProvider(create: (context) => ResetpswdBloc()),
              BlocProvider(create: (context) => ResetprflBloc()),
              BlocProvider(create: (context) => CreateSellerAcBloc()),
              BlocProvider(create: (context) => AddAddressBloc()),
              BlocProvider(create: (context) => ProfileAddressBloc()),
              BlocProvider(create: (context) => DeleteAddressBloc()),
              BlocProvider(create: (context) => ProductCategoryBloc()),
              BlocProvider(create: (context) => HomeProductsBloc()),
              BlocProvider(create: (context) => AddtoCartBloc()),
              BlocProvider(create: (context) => CartPageBloc()),
              BlocProvider(create: (context) => DeleteCartProductBloc()),
              BlocProvider(create: (context) => BannerBloc()),
              BlocProvider(create: (context) => GetAproductBloc()),
              BlocProvider(create: (context) => VerifyIdBloc()),
              BlocProvider(create: (context) => AddSellerProductBloc()),
              BlocProvider(create: (context) => GetSellerProductsBloc()),
              BlocProvider(create: (context) => DeleteSellerProductBloc()),
              BlocProvider(create: (context) => UpdateSellerProductBloc()),
              BlocProvider(create: (context) => PlaceOrdersBloc()),
              BlocProvider(create: (context) => CartPlaceOrderBloc()),
              BlocProvider(create: (context) => AllOrdersBloc()),
              BlocProvider(create: (context) => ProfileImageBloc()),
              BlocProvider(create: (context) => SearchBloc()),
              BlocProvider(create: (context) => AddRatingBloc()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Mes-Cart',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
              ),
              home: const SplashScreen(),
            ),
          );
        });
  }
}
