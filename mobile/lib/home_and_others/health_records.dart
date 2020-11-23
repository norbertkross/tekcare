import "package:flutter/material.dart";

class HealthRecords extends StatefulWidget {
  HealthRecords({
    Key key,
  }) : super(key: key);

  @override
  _HealthRecordsState createState() => _HealthRecordsState();
}

class _HealthRecordsState extends State<HealthRecords> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Health Records"),
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _expansionCard("Medical Information", [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Gender"), Text("Male")],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Blood Type"), Text("A+")],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Height"), Text("70m")],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("BP"), Text("100/70mmHg")],
                  )
                ]),
                _expansionCard("Labs", [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Gender"), Text("Male")],
                  ),
                ]),
                _expansionCard("Vitals", [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Gender"), Text("Male")],
                  ),
                ]),
                _expansionCard("Prescriptions", [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Gender"), Text("Male")],
                  ),
                ])
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _expansionCard(String title, List<Widget> children) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: ExpansionTile(
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: TextStyle(fontSize: 22),
        ),
        trailing: Icon(Icons.edit),
        childrenPadding: EdgeInsets.symmetric(horizontal: 15.0),
        children: children,
      ),
    );
  }
}
