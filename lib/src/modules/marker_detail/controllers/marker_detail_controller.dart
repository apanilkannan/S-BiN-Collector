import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';


class MarkerDetailController extends GetxController {

  final ref = FirebaseDatabase.instance.ref();
  var binStatus = ''.obs;
  var temp = ''.obs;
  var gas = ''.obs;
  var foodWaste = ''.obs;
  var binNum;


  @override
  void onInit() {

    super.onInit();

  }


  getBinStatus(args) async{
    final snapshot = await ref.child('bins/bins 0$args').get().then((value) {
      debugPrint("bins data : ${value.value}");
      debugPrint("Plastic waste : ${value.child('Plastic Waste').value}");
      binStatus.value = '${value.child('Plastic Waste').value}';
      temp.value = '${value.child('Temp').value}';
      gas.value = '${value.child('Gas').value}';
      foodWaste.value = '${value.child('Food Waste').value}';
      debugPrint('bin status : ${binStatus.value}  , ${temp.value}  , ${gas.value}  ,  ${foodWaste.value}');
    });
    if (snapshot.exists) {
      print(snapshot.value);
      print(" Food waste : ${snapshot.child('Gas').value.toString()}");

     }else {
      print('No data available.');
    }
  }
}
