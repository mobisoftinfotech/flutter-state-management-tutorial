import 'package:flutter/material.dart';
import '../model/country_model.dart';

class CountryDetailsPage extends StatelessWidget {
  final CountryModel country;

  const CountryDetailsPage({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(country.name?.official ?? 'Country Details')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (country.flags?.png != null)
              Image.network(
                country.flags!.png!,
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getCommonWidget('Official Name', country.name?.official ?? "NA",
                      'Common Name', country.name?.common ?? "NA"),
                  SizedBox(height: 16),
                  getCommonWidget(
                      'Alternative Names',
                      country.altSpellings?.join(",") ?? "NA",
                      'Capital',
                      '${country.capital ?? "NA"}'),
                  SizedBox(height: 16),
                  getCommonWidget('Region', country.region ?? "NA", 'Subregion',
                      country.subregion ?? "NA"),
                  SizedBox(height: 16),
                  getCommonWidget('Population', '${country.population ?? "NA"}',
                      'Timezones', country.timezones?.join(", ") ?? "NA"),
                  SizedBox(height: 16),
                  getCommonWidget('Independent', '${country.independent ?? "NA"}',
                      'Status', country.status ?? "NA"),
                  SizedBox(height: 16),
                  getCommonWidget('UNMember', '${country.unMember ?? "NA"}',
                      'Languages', country.languages?.values.join(',') ?? "NA"),
                  SizedBox(height: 16),
                  getCommonWidget('Continents', '${country.continents ?? "NA"}',
                      'StartOfWeek', country.startOfWeek ?? "NA"),
                  SizedBox(height: 16),
                  getCommonWidget('Borders', '${country.borders ?? "NA"}',
                      'Landlocked', '${country.landlocked ?? "NA"}',),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getCommonWidget(String titleFirst, String subTitleFirst,
      String titleSecond, String subTitleSecond) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(titleFirst, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(
                subTitleFirst,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                softWrap: true,
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(titleSecond, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(
                subTitleSecond,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                softWrap: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
