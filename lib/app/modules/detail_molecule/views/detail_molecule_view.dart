import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_molecule_controller.dart';

class DetailMoleculeView extends GetView<DetailMoleculeController> {
  const DetailMoleculeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailMoleculeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailMoleculeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
