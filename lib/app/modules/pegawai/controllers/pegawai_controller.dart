import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PegawaiController extends GetxController {
  //TODO: Implement pegawaiController
  late TextEditingController cIdstaf;
  late TextEditingController cNama;
  late TextEditingController cJabatan;
  late TextEditingController cGedung;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference pegawai = firestore.collection('pegawai');
    return pegawai.get();
  }

  Stream<QuerySnapshot<Object?>> StreamData() {
    CollectionReference pegawai = firestore.collection('pegawai');
    return pegawai.snapshots();
  }

  void add(String idstaf, String nama, String jabatan, String gedung) async {
    CollectionReference pegawai = firestore.collection("pegawai");

    try {
      await pegawai.add({
        "idstaf": idstaf,
        "nama": nama,
        "jabatan": jabatan,
        "gedung": gedung,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data pegawai",
          onConfirm: () {
            cIdstaf.clear();
            cNama.clear();
            cJabatan.clear();
            cGedung.clear();
            Get.back();
            Get.back();
            Get.back();
            Get.back();
            textConfirm:
            "OK";
          });
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan pegawai.",
      );
    }
  }

  Future<DocumentSnapshot<Object?>> GetDataById(String id) async {
    DocumentReference docRef = firestore.collection("pegawai").doc(id);

    return docRef.get();
  }

  void Update(String idstaf, String nama, String jabatan, String gedung,
      String id) async {
    DocumentReference pegawaiById = firestore.collection("pegawai").doc(id);

    try {
      await pegawaiById.update({
        "idstaf": idstaf,
        "nama": nama,
        "jabatan": jabatan,
        "gedung": gedung,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data pegawai.",
        onConfirm: () {
          cIdstaf.clear();
          cNama.clear();
          cJabatan.clear();
          cGedung.clear();
          Get.back();
          Get.back();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan pegawai.",
      );
    }
  }

  void delete(String id) {
    DocumentReference docRef = firestore.collection("pegawai").doc(id);

    try {
      Get.defaultDialog(
        title: "Info",
        middleText: "Apakah anda yakin menghapus data ini ?",
        onConfirm: () {
          docRef.delete();
          Get.back();
          Get.defaultDialog(
            title: "Sukses",
            middleText: "Berhasil menghapus data",
          );
        },
        textConfirm: "Ya",
        textCancel: "Batal",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak berhasil menghapus data",
      );
    }
  }

  @override
  void onInit() {
    cIdstaf = TextEditingController();
    cNama = TextEditingController();
    cJabatan = TextEditingController();
    cGedung = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    cIdstaf.dispose();
    cNama.dispose();
    cJabatan.dispose();
    cGedung.dispose();
    super.onClose();
  }
}