import 'dart:convert';
import 'dart:io';


import 'package:http/http.dart';
import 'package:mes_kart/Repository/Api/mesApi/single_file_api_client.dart';
import 'package:mes_kart/Repository/modelclass/CartPageModelclass.dart';
import 'package:mes_kart/Repository/modelclass/getAproductModelclass.dart';
import 'package:mes_kart/Repository/modelclass/productCategoryModelclass.dart';
import 'package:mes_kart/Repository/modelclass/homeProductsModelclass.dart';
import '../../../Ui/Sell/sell.dart';
import '../../modelclass/BannerModelclass.dart';
import '../../modelclass/GetSellerProductsModel1.dart';
import '../../modelclass/mesSigninModelclass.dart';
import '../../modelclass/mesSignupModelclass.dart';
import '../../modelclass/profileAddressModelclass.dart';
import 'api_client.dart';
import 'multi_file_api_client.dart';


class meskartApi{
  ApiClient apiClient = ApiClient();
  SingleFileApiClient singleFileApiClient=SingleFileApiClient();
  MultiFileApiClient multiFileApiClient=MultiFileApiClient();


  Future<MesSignupModelclass> getmeskart(String userName,String email,String phone,String password,) async {
    String trendingpath = '/auth/local/sign-up';
    var body = {
      "username":userName,
      "email":email,
      "password":password,
      "phone":phone,

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));

    return MesSignupModelclass.fromJson(jsonDecode(response.body));
  }
  Future<MesSigninModelclass> getmessignin(String email,String password,) async {
    String trendingpath = '/auth/local/sign-in';
    var body = {
      "email":email,
      "password":password,

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));

    return MesSigninModelclass.fromJson(jsonDecode(response.body));
  }
   getresetpswd({required String newpassword,required String oldpassword,}) async {
    String trendingpath = '/user/reset-password';
    var body = {
      "newPassword": newpassword,
      "oldPassword": oldpassword

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'PUT', jsonEncode(body));


  }
  getresetprfl(String username,String email,String phone, ) async {
    String trendingpath = '/user/update';
    var body = {
      "username":username,
      "email":email,
      "phone":phone,
    };
    Response response = await apiClient.invokeAPI(
        trendingpath, 'PATCH', jsonEncode(body));
  }
  getCreateSellerAc(String name,String contactNumber,String aadhar,String email,
      String collegeName,String collegePlace,String course,String academicYear,
      String admissionNumber,String storePin ) async {
    String trendingpath = '/seller/account/create';
    var body = {
      "shopname":name,
      "phone":contactNumber,
      "aadhaarNumber":aadhar,
      "email":email,
      "collegename":collegeName,
      "collegeplace":collegePlace,
      "course":course,
      "academicyear":academicYear,
      "admissionnumber":admissionNumber,
      "pin":storePin,
    };
    Response response = await apiClient.invokeAPI(
        trendingpath, 'POST', jsonEncode(body));
  }
  getaddAddress(String fullname,String phonenumber,String pincode,String state,String city,String houseNoOrBuildingName,
      String roadname,String landmark,String addressType ) async {
    String trendingpath = '/user/add-delivery-address';
    var body = {
      "fullName": fullname,
      "phone_numbers": [phonenumber],
      "pincode": pincode,
      "state": state,
      "city":city,
      "houseOrBuildingNumber": houseNoOrBuildingName,
      "roadNameOrArea": roadname,
      "landmark": landmark,
      "type": addressType
    };
    Response response = await apiClient.invokeAPI(
        trendingpath, 'POST', jsonEncode(body));
  }
  Future<ProfileAddressModelclass> getProfileAddress() async {
    String trendingpath = '/user/profile';
    var body = {
    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', jsonEncode(body));

    return ProfileAddressModelclass.fromJson(jsonDecode(response.body));
  }
  getDeleteAddress(String addressId) async {
    String trendingpath = '/user/remove-delivery-address/$addressId';
    var body = {
    };
    Response response = await apiClient.invokeAPI(
        trendingpath, 'DELETE', jsonEncode(body));
  }
  Future<ProductCategoryModelclass> getProductCategory() async {
    String trendingpath = '/categories/all';
    var body = {
    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', jsonEncode(body));

    return ProductCategoryModelclass.fromJson(jsonDecode(response.body));
  }
  Future<HomeProductsModelclass> getHomeProducts() async {
    String trendingpath = '/product/all?page=1&limit=10';
    var body = {
    };
    Response response = await apiClient.invokeAPI(
        trendingpath, 'GET', jsonEncode(body));

    return HomeProductsModelclass.fromJson(jsonDecode(response.body));
  }

  getAddtoCart (String productId,int quanity)async{
    String trendingpath = '/cart/add-to-cart';
    var body = {
      "product_id":productId,
      "quantity": quanity
    };
    Response response = await apiClient.invokeAPI(
        trendingpath, 'POST', jsonEncode(body));
  }
  getCartPage ()async{
    String trendingpath = '/cart/get';
    var body = {};
    Response response = await apiClient.invokeAPI(
        trendingpath, 'GET', jsonEncode(body));
    return CartPageModelclass.fromJson(jsonDecode(response.body));
  }
  getDeleteCartProduct(String productId) async {
    String trendingpath = '/cart/delete/$productId';
    var body = {
    };
    Response response = await apiClient.invokeAPI(
        trendingpath, 'DELETE', jsonEncode(body));
  }
  Future<BannerModelclass>  getBanners ()async{
    String trendingpath = '/banner/all';
    var body = {};
    Response response = await apiClient.invokeAPI(
        trendingpath, 'GET', jsonEncode(body));
    return  BannerModelclass.fromJson(jsonDecode(response.body));
  }
  Future<GetAproductModelclass> getAproduct (String ProductId)async{

    String trendingpath = '/product/$ProductId';
    var body = {

    };
    Response response = await apiClient.invokeAPI(
        trendingpath, 'GET', jsonEncode(body));
    return  GetAproductModelclass.fromJson(jsonDecode(response.body));
  }

  getVerifyId(File file) async {
    String trendingpath = '/seller/account/verify';
    var body = {};
    Response response = await singleFileApiClient.uploadFile(filepath: file,
        uploadPath: '/seller/account/verify', method: 'PATCH', bodyData: {});
  }

  getAddSellerProduct (
  { required List<File> selectedImages,
    required String name,
    required String cateId,
    required String price,
    required String description,
    required String stock,}
      )async{
    String trendingpath = '/seller/product/create';
    var body = {
      "Name": name,
      "CateID": cateId,
      "Stock": stock,
      "Description": description,
      "Price": price};
    Response response = await multiFileApiClient.uploadFiles(files: selectedImages,
        uploadPath: '/seller/product/create',
        bodyData: body, method: 'POST'
    );
  }
  Future<GetSellerProductsModel1> getSellerProductList ()async{

    String trendingpath = '/seller/product/all?page=1&limit=10';
    var body = {

    };
    Response response = await apiClient.invokeAPI(
        trendingpath, 'GET', body);
    return  GetSellerProductsModel1.fromJson(jsonDecode(response.body));
  }
  getDeleteSellerProduct(String productId ) async {
    String trendingpath = '/seller/product/delete/$productId';
    var body = {
    };
    Response response = await apiClient.invokeAPI(
        trendingpath, 'DELETE', jsonEncode(body));
  }
  getUpdateSellerProduct(
  {required String productId,
    required List<File> image,
    required String name,
    required int price,
    required String description,
    required int stock}
  )async{
  String trendingpath = '/seller/product/update/$productId';
  var body = {
    "Name": name,
    "Price": price,
    "Description": description,
    "Stock": stock,};
  Response response = await multiFileApiClient.uploadFiles(
  uploadPath: trendingpath,
  bodyData: body, files: [], method: 'PATCH',
  );
  }


}


