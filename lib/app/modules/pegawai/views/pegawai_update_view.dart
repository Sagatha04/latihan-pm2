import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/pegawai/controllers/pegawai_controller.dart';

class PegawaiUpdateView extends GetView<PegawaiController> {
  const PegawaiUpdateView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Matakuliah'),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.GetDataById(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.data() as Map<String, dynamic>;
            controller.cKodeMatakuliah.text = data['kode_matakuliah'];
            controller.cNamaMahasiswa.text = data['nama_mahasiswa'];
            controller.cSksMatakuliah.text = data['sks_matakuliah'];
            return Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  TextField(
                    controller: controller.cKodeMatakuliah,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(labelText: "Kode Matakuliah"),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: controller.cNamaMahasiswa,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(labelText: "Nama Mahasiswa"),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: controller.cSksMatakuliah,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(labelText: "SKS Matakuliah"),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () => controller.Update(
                      controller.cKodeMatakuliah.text,
                      controller.cNamaMahasiswa.text,
                      controller.cSksMatakuliah.text,
                      Get.arguments,
                    ),
                    child: Text("Ubah"),
                  )
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}