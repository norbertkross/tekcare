import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tele_health/core/models/drug.dart';
import 'package:tele_health/core/services/fetch_drugs.dart';

part 'fetch_drugs_state.dart';

class FetchDrugsCubit extends Cubit<FetchDrugsState> {
  FetchDrugsCubit() : super(FetchDrugsInitial());

  List<DrugModel> _pharmacies = [];

  Future<void> loadDrugs() async {
    try {
      emit(FetchDrugsLoading());
      _pharmacies = await FetchDrugs.fetchDrugs();
      emit(FetchDrugsLoaded(_pharmacies));
    } on Exception {
      emit(FetchDrugsError("Error loading drugs"));
    }
  }
}
