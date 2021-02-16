import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tele_health/core/models/pharmacy.dart';
import 'package:tele_health/core/services/fetch_pharmacies.dart';

part 'fetch_pharmacies_state.dart';

class FetchPharmaciesCubit extends Cubit<FetchPharmaciesState> {
  FetchPharmaciesCubit() : super(FetchPharmaciesInitial());

  List<PharmacyModel> _pharmacies = [];

  Future<void> loadPharmacies() async {
    try {
      emit(FetchPharmaciesLoading());
      _pharmacies = await FetchPharmacies.fetchPharmacies();
      emit(FetchPharmaciesLoaded(_pharmacies));
    } on Exception {
      emit(FetchPharmaciesError("Error loading available pharmacies"));
    }
  }
}
