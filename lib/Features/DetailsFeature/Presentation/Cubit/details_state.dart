
import 'package:bitpulse/Features/DetailsFeature/Data/Models/crypto_details/crypto_details.dart';

abstract class DetailsCubitState {}

class DetailsCubitInitial extends DetailsCubitState {}

class DetailsCubitLoading extends DetailsCubitState {}

class DetailsCubitSuccess extends DetailsCubitState {
  final CryptoDetails cryptoDetails;
  
  DetailsCubitSuccess(this.cryptoDetails);
}



class DetailsCubitFailure extends DetailsCubitState {
  final String message;
  
  DetailsCubitFailure(this.message);
}