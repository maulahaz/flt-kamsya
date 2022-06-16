import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kamsya/configs/all_configs.dart';
import 'package:kamsya/controllers/all_controllers.dart';
// import 'package:kamsya/helpers/utils_hlp.dart';
// import 'package:kamsya/models/all_models.dart';
import 'package:kamsya/widgets/all_widgets.dart';

class EditBarangPage extends StatelessWidget {
  EditBarangPage({Key? key}) : super(key: key);

  // final BarangModel barang;
  // final BarangModel barang = Get.arguments;
  final BarangController barangCtrl = Get.find();
  // final BarangEditController barangEditCtrl = Get.find(); //
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Edit Barang',
            style: myText.copyWith(color: kWhite, fontSize: 20)),
        // centerTitle: true,
        // backgroundColor: kTransparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios,
              size: 16,
            )),
        actions: [
          TextButton(
              onPressed: () {
                print('Update');
                if (_formKey.currentState != null &&
                    _formKey.currentState!.validate()) {
                  barangCtrl.editBarang();
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
                  // FormInputHidden(barangCtrl.txtBarangId, barang.id),
                  FormInputText('Nama Barang *',
                      txtController: barangCtrl.txtName),
                  FormInputText('Berat (Kg)*',
                      txtController:
                          barangCtrl.txtWeight), //, text: barang.weight
                  FormInputCurr('Harga Pasar *',
                      txtController: barangCtrl.txtMarketPrice),
                  FormInputText('Harga Beli *',
                      txtController: barangCtrl.txtBuyingPrice),
                  FormInputText('Harga *', txtController: barangCtrl.txtNotes),
                  // FormInputCurr('Catatan *',
                  //     txtController: barangCtrl.txtMarketPrice),
                  SizedBox(height: 30),
                  ElevatedButton.icon(
                      onPressed: () {
                        print('Delete');
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(kRed),
                      ),
                      icon: Icon(Icons.delete_forever),
                      label: Text('DELETE DATA'))
                ],
              ),
            )),
      ),
    );
  }
}
