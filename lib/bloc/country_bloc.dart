import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sample_app/repository/country_repository.dart';

import 'country_event.dart';
import 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final CountryRepository _repository;
  Timer? _debounceTimer;

  CountryBloc({required CountryRepository repository})
      : _repository = repository,
        super(CountryInitial()) {
    on<SearchCountry>(_onSearchCountry);
  }

  Future<void> _onSearchCountry(SearchCountry event, Emitter<CountryState> emit) async {
    _debounceTimer?.cancel();

    final completer = Completer();

    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      emit(CountryLoading());
      try {
        final countries = await _repository.searchCountry(event.name);
        emit(CountryLoaded(countries));
      } catch (e) {
        emit(CountryError(e.toString()));
      } finally {
        completer.complete();
      }
    });

    await completer.future;
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }
}
