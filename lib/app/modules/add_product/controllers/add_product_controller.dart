import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {

  late TextEditingController cNama;
  late TextEditingController cNPM;
  late TextEditingController cAlamat;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addProduct(String npm, String nama, String alamat) async{
    CollectionReference products = firestore.collection('mahasiswa_21312027');

    try{
      await products.add({
        "nama" : nama,
        "npm" : npm,
        "alamat" : alamat,
        });
        Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data product",
          onConfirm: () {
            cNPM.clear();
            cNama.clear();
            cAlamat.clear();
            Get.back();
            Get.back();
            textConfirm: "OK";
          }
        );
    }catch(e){
      
        print(e);
        Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Gagal Menambahkan Product.",
        );
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
  cNPM = TextEditingController();
  cNama=TextEditingController();
  cAlamat=TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cNPM.dispose();
    cNama.dispose();
    cAlamat.dispose();
    super.onClose();
  }
}
