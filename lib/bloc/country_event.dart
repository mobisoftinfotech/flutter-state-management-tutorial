abstract class CountryEvent {}
class SearchCountry extends CountryEvent {
  final String name;
  SearchCountry(this.name);
}