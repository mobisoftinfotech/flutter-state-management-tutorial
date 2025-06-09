
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sample_app/model/country_model.dart';
import 'package:flutter_bloc_sample_app/screen/country_details_page.dart';
import 'bloc/country_bloc.dart';
import 'bloc/country_event.dart';
import 'bloc/country_state.dart';
import 'repository/country_repository.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Country Search',
      home: BlocProvider(
        create: (_) => CountryBloc(repository: CountryRepository()),
        child: const CountryPage(),
      ),
    );
  }
}

class CountryPage extends StatefulWidget {
  const CountryPage({super.key});

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Country')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: TextField(
                controller: controller,
                onChanged: (String value) {
                  context.read<CountryBloc>().add(SearchCountry(value));
                },
                decoration: InputDecoration(
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  border: InputBorder.none,
                  hintText: 'Search country name',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      BlocProvider.of<CountryBloc>(context)
                          .add(SearchCountry(controller.text));
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<CountryBloc, CountryState>(
                builder: (context, state) {
                  if (state is CountryLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CountryLoaded) {
                    return ListView.builder(
                      itemCount: state.countries.length,
                      itemBuilder: (context, index) {
                        final country = state.countries[index];
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CountryDetailsPage(country: country),
                              ),
                            );
                          },
                          child: Card(
                            child: ListTile(
                                title: Text(country.name?.official ?? "NA"),
                                subtitle: getCountryDetails(country)),

                          ),
                        );
                      },
                    );
                  } else if (state is CountryError) {
                    String errorMsg = state.message.replaceFirst('Exception: ', '');
                    return Center(child: Text(errorMsg));
                  }
                  return const Center(child: Text('Search for a country.'));
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getCountryDetails(CountryModel country) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Capital: ${country.capital}'),
        Text('Region: ${country.region}'),
        Text('Subregion: ${country.subregion}'),
        Text('Population: ${country.population}'),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
