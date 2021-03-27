part of 'fetch_pharmacies_cubit.dart';

@immutable
abstract class FetchPharmaciesState {
  const FetchPharmaciesState();
}

class FetchPharmaciesInitial extends FetchPharmaciesState {
  FetchPharmaciesInitial();
}

class FetchPharmaciesLoading extends FetchPharmaciesState {
  FetchPharmaciesLoading();
}

class FetchPharmaciesLoaded extends FetchPharmaciesState {
  final List<PharmacyModel> list;
  FetchPharmaciesLoaded(this.list);
}

class FetchPharmaciesError extends FetchPharmaciesState {
  final String message;
  FetchPharmaciesError(this.message);
}
