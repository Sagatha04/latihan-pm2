import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/pegawai/controllers/pegawai_controller.dart';

class PegawaiAddView extends GetView<PegawaiController> {
  const PegawaiAddView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Matakuliah'),
        centerTitle: true,
      ),
      body: Padding(
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
              onPressed: () => controller.add(
                controller.cKodeMatakuliah.text,
                controller.cNamaMahasiswa.text,
                controller.cSksMatakuliah.text,
              ),
              child: Text("Simpan"),
            )
          ],
        ),
      ),
    );
  }
}