import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tele_health/core/bloc/cubit/fetch_pharmacies_cubit.dart';
import 'package:tele_health/core/models/pharmacy.dart';
import 'package:tele_health/not_assigned/pharmacyShop.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListPharmacies extends StatefulWidget {
  @override
  _ListPharmaciesState createState() => _ListPharmaciesState();
}

class _ListPharmaciesState extends State<ListPharmacies> {
  bool isLoading = false;
  bool isChecked = false;
  bool isCheckedOne = false;

  @override
  Widget build(BuildContext context) {
    final pharmaciesCubit = context.bloc<FetchPharmaciesCubit>();
    pharmaciesCubit.loadPharmacies();
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Pharmacy",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: BlocBuilder<FetchPharmaciesCubit, FetchPharmaciesState>(
          builder: (context, state) {
            if (state is FetchPharmaciesInitial) {
              return Center(child: CircularProgressIndicator());
            } else if (state is FetchPharmaciesLoading) {
              return loadingPharmacies();
            } else if (state is FetchPharmaciesLoaded) {
              return doneLoadingPharmacies(state.list);
            } else if (state is FetchPharmaciesError) {
              return Center(
                child: Text("Couldn't load pharmacies"),
              );
            } else {
              return Text("Couldn't load pharmacies");
            }
          },
        ));
  }

  Widget loadingPharmacies() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget doneLoadingPharmacies(List<PharmacyModel> _pharmacies) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (__) {
        __.disallowGlow();
        return false;
      },
      child: Stack(
        children: [
          ListView.builder(
              itemCount: _pharmacies.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 12.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => PharmacyShop()));
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                subtitle: SizedBox(
                                  child: Wrap(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        child: Image.asset(
                                            "assets/Region Code_48px.png"),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("  Ayeduase"),
                                      )
                                    ],
                                  ),
                                ),
                                title: SizedBox(
                                  child: Wrap(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        child: Image.asset(
                                            "assets/Mortar and Pestle_48px.png"),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child:
                                            Text("  Ayeduase gates Pharmacy"),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.black),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
