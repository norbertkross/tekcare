import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'file:///C:/flutter_projects/tekcare/mobile/lib/pay_consult_emergency/components/ProceedButton.dart';
import 'file:///C:/flutter_projects/tekcare/mobile/lib/pay_consult_emergency/components/ConfirmPayments.dart';
import 'file:///C:/flutter_projects/tekcare/mobile/lib/pay_consult_emergency/components/constants.dart';

enum paymentOptions {
  Momo,
  VisaCard,
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}

class PaymentMethod extends StatefulWidget {
  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  // int _value = 1;

  paymentOptions _character = paymentOptions.Momo;

  List<ListItem> _dropdownItems = [
    ListItem(1, "MTN"),
    ListItem(2, "AirtelTigo"),
    ListItem(3, "Vodafone"),
    ListItem(4, "Glo")
  ];

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(
            listItem.name,
            style: kDropDownItemsTextStyle,
          ),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.keyboard_backspace,
              color: Colors.white,
              size: 35.0,
            ),
            onPressed: () {}),
        title: Text(
          'Payment',
          style: kAppBarTextStyle,
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        // elevation: 10.0,
        child: ProceedButton(
          onPress: () {
            setState(() {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return ConfirmPayment();
                  });
            });
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // SizedBox(height: 20),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      'Choose Payment Option',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                    padding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                  ),
                  ListTile(
                    title: GestureDetector(
                      onTap: () {
                        setState(() {
                          _character = paymentOptions.Momo;
                        });
                      },
                      child: Text(
                        'Momo',
                        style: kCardTextStyle,
                      ),
                    ),
                    leading: Radio(
                      value: paymentOptions.Momo,
                      groupValue: _character,
                      onChanged: (paymentOptions value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: GestureDetector(
                      onTap: () {
                        setState(() {
                          _character = paymentOptions.VisaCard;
                        });
                      },
                      child: Text(
                        'Visa Card',
                        style: kCardTextStyle,
                      ),
                    ),
                    leading: Radio(
                      value: paymentOptions.VisaCard,
                      groupValue: _character,
                      onChanged: (paymentOptions value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                elevation: 10.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Network',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<ListItem>(
                              value: _selectedItem,
                              items: _dropdownMenuItems,
                              onChanged: (value) {
                                setState(() {
                                  _selectedItem = value;
                                });
                              }),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 25.0),
                        child: TextField(
                          decoration: new InputDecoration(
                            contentPadding:
                            EdgeInsets.symmetric(vertical: 20.0),
                            labelText: "Number (+233)",
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 17.0,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly,
                          ],
                          // Only numbers can be entered
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Container(
            //   // padding: EdgeInsets.symmetric(vertical: 120.0),
            //   child: ProceedButton(),
            // ),
          ],
        ),
      ),
    );
  }
}
