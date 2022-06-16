import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kamsya/configs/all_configs.dart';
import 'package:kamsya/controllers/all_controllers.dart';
import 'package:kamsya/widgets/all_widgets.dart';

class AddBarangPage extends StatelessWidget {
  AddBarangPage({Key? key}) : super(key: key);

  final BarangController barangCtrl = Get.find();
  // final BarangEditController barangEditCtrl = Get.find(); //
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Tambah Barang',
            style: myText.copyWith(color: kWhite, fontSize: 20)),
        // centerTitle: true,
        // backgroundColor: kTransparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
              barangCtrl.clearTextEditingControllers();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 16,
            )),
        actions: [
          TextButton(
              onPressed: () {
                print('Simpan');
                if (_formKey.currentState != null &&
                    _formKey.currentState!.validate()) {
                  barangCtrl.addBarang();
                }
              },
              child: Text(
                'SIMPAN',
                style: TextStyle(color: kYellow),
              ))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  FormInputText('Nama Barang *',
                      txtController: barangCtrl.txtName),
                  FormInputText('Berat (Kg)*',
                      txtController: barangCtrl.txtWeight),
                  FormInputText('Harga Pasar *',
                      txtController: barangCtrl.txtMarketPrice),
                  FormInputText('Harga Beli *',
                      txtController: barangCtrl.txtBuyingPrice),
                  FormInputText('Catatan *',
                      txtController: barangCtrl.txtNotes),
                ],
              ),
            )),
      ),
    );
  }
}
