part of 'create_seller_ac_bloc.dart';

@immutable
abstract class CreateSellerAcEvent {}
class FetchCreateSellerAc extends CreateSellerAcEvent{
  final String name;
  final String contactNumber;
  final String aadhar;
  final String email;
  final String collegeName;
  final String collegePlace;
  final String course;
  final String academicYear;
  final String admissionNumber;
  final String storePin;
 FetchCreateSellerAc({required this.name,required this.contactNumber,required this.aadhar,
  required this.email,required this.collegeName,required this.collegePlace,required this.course,
  required this.academicYear,required this.admissionNumber,required this.storePin});
}




