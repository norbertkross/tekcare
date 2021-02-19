part of 'fetch_drugs_cubit.dart';

@immutable
abstract class FetchDrugsState {}

class FetchDrugsInitial extends FetchDrugsState {
  FetchDrugsInitial();
}

class FetchDrugsLoading extends FetchDrugsState {
  FetchDrugsLoading();
}

class FetchDrugsLoaded extends FetchDrugsState {
  final List<DrugModel> list;
  FetchDrugsLoaded(this.list);
}

class FetchDrugsError extends FetchDrugsState {
  final String message;
  FetchDrugsError(this.message);
}
