
import 'package:flutter_bloc_sample_app/model/country_model.dart';

abstract class CountryState {}
class CountryInitial extends CountryState {}
class CountryLoading extends CountryState {}
class CountryLoaded extends CountryState {
  final List<CountryModel> countries;
  CountryLoaded(this.countries);
}
class CountryError extends CountryState {
  final String message;
  CountryError(this.message);
}