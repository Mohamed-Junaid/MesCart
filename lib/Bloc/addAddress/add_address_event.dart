part of 'add_address_bloc.dart';

@immutable
abstract class AddAddressEvent {}
class FetchaddAddress extends AddAddressEvent{
  final String fullname;
  final String phonenumber;
  final String pincode;
  final String state;
  final String city;
  final String houseNoOrBuildingName;
  final String roadname;
  final String landmark;
  final String addressType;
  FetchaddAddress({required this.fullname,required this.phonenumber,required this.pincode,
    required this.state,required this.city,required this.houseNoOrBuildingName,required this.roadname,
    required this.landmark,required this.addressType});
}
