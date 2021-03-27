import 'package:flutter/material.dart';
import 'package:tele_health/core/bloc/cubit/fetch_drugs_cubit.dart';
import 'package:tele_health/core/models/drug.dart';
import 'package:tele_health/not_assigned/finishDrugs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PharmacyShop extends StatefulWidget {
  @override
  _PharmacyShopState createState() => _PharmacyShopState();
}

class _PharmacyShopState extends State<PharmacyShop> {
  @override
  Widget build(BuildContext context) {
    final drugsCubit = context.bloc<FetchDrugsCubit>();
    drugsCubit.loadDrugs();
    return Scaffold(
      body: BlocBuilder<FetchDrugsCubit, FetchDrugsState>(
        builder: (context, state) {
          if (state is FetchDrugsInitial) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FetchDrugsLoading) {
            return loadingDrugs();
          } else if (state is FetchDrugsLoaded) {
            return doneLoadingDrugs(state.list);
          } else if (state is FetchDrugsError) {
            return Center(
              child: Text("Couldn't load pharmacies"),
            );
          } else {
            return Center(
              child: Text("Couldn't load pharmacies"),
            );
          }
        },
      ),
    );
  }

  Widget loadingDrugs() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget doneLoadingDrugs(List<DrugModel> _drugs) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (__) {
        __.disallowGlow();
        return false;
      },
      child: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(vertical: 0),
            children: [
              Container(
                color: Theme.of(context).primaryColor,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => FinishDrugs()));
                      },
                      leading: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      trailing: Icon(
                        Icons.add_shopping_cart,
                        color: Theme.of(context).canvasColor,
                      ),
                      title: Text(
                        "Opharm Pharmacy",
                        style: TextStyle(
                            color: Theme.of(context).canvasColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                " Drugs",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              for (int i = 0; i <= _drugs.length; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 12.0),
                  child: Card(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: SizedBox(
                              child: Wrap(
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    child: Image.asset(
                                        "assets/Price Tag_48px.png"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("   \$ ${_drugs[i].price} "),
                                  )
                                ],
                              ),
                            ),
                          ),
                          title: Text(
                            "${_drugs[i].drugName}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: Checkbox(value: false, onChanged: (_) {}),
                          leading: Container(
                            height: 30,
                            width: 30,
                            child: Image.asset("assets/Pill_48px.png"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Positioned(
            top: 130,
            left: 0.0,
            right: 0.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Card(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              icon: Icon(
                                Icons.search,
                                color: Theme.of(context).primaryColor,
                              ),
                              onPressed: () {}),
                          hintText: " Search drug",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
