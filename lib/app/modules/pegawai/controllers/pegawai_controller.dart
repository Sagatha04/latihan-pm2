import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PegawaiController extends GetxController {
  late TextEditingController cKodeMatakuliah;
  late TextEditingController cNamaMahasiswa;
  late TextEditingController cSksMatakuliah;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference matakuliah =
        firestore.collection('matakuliah_22312094');
    return matakuliah.get();
  }

  Stream<QuerySnapshot<Object?>> StreamData() {
    CollectionReference matakuliah =
        firestore.collection('matakuliah_22312094');
    return matakuliah.snapshots();
  }

  void add(
      String kodeMatakuliah, String namaMahasiswa, String sksMatakuliah) async {
    CollectionReference matakuliah =
        firestore.collection("matakuliah_22312094");

    try {
      await matakuliah.add({
        "kode_matakuliah": kodeMatakuliah,
        "nama_mahasiswa": namaMahasiswa,
        "sks_matakuliah": sksMatakuliah,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data matakuliah",
          onConfirm: () {
            cKodeMatakuliah.clear();
            cNamaMahasiswa.clear();
            cSksMatakuliah.clear();
            Get.back();
            Get.back();
          });
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan matakuliah.",
      );
    }
  }

  Future<DocumentSnapshot<Object?>> GetDataById(String id) async {
    DocumentReference docRef =
        firestore.collection("matakuliah_22312094").doc(id);
    return docRef.get();
  }

  void Update(String kodeMatakuliah, String namaMahasiswa, String sksMatakuliah,
      String id) async {
    DocumentReference matakuliahById =
        firestore.collection("matakuliah_22312094").doc(id);

    try {
      await matakuliahById.update({
        "kode_matakuliah": kodeMatakuliah,
        "nama_mahasiswa": namaMahasiswa,
        "sks_matakuliah": sksMatakuliah,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data matakuliah.",
        onConfirm: () {
          cKodeMatakuliah.clear();
          cNamaMahasiswa.clear();
          cSksMatakuliah.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal mengubah matakuliah.",
      );
    }
  }

  void delete(String id) {
    DocumentReference docRef =
        firestore.collection("matakuliah_22312094").doc(id);

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
    cKodeMatakuliah = TextEditingController();
    cNamaMahasiswa = TextEditingController();
    cSksMatakuliah = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    cKodeMatakuliah.dispose();
    cNamaMahasiswa.dispose();
    cSksMatakuliah.dispose();
    super.onClose();
  }
}
