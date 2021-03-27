/// A class representing the drug model
/// and how it is represented in the database
/// It has methods that data to a map
/// and destruct it back from the map.

class DrugModel {
  int drugId;
  String drugName;
  String prescription;
  int price;
  int pharmId;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'drug_id': drugId,
      'drug_name': drugName,
      'prescription': prescription,
      'price': price,
      'pharm_id': pharmId
    };
    return map;
  }

  DrugModel.fromMap(Map<String, dynamic> map) {
    drugId = map['drug_id'];
    drugName = map['drug_name'];
    prescription = map['prescription'];
    price = map['price'];
    pharmId = map['pharm_id'];
  }
}
