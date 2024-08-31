import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:media_pembelajaran/views/screen/introduction/components/card_introduction.dart';

class CapaianScreen extends StatelessWidget {
  const CapaianScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Capaian Pembelajaran'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(16.h),
          child: const Column(
            children: [
              CardIntroduction(textTitle: '1.	Perjuangan Mempertahakan Kemerdekaan Republik Indonesia'),
              CardIntroduction(textTitle: '2.	Elemen'),
              CardIntroduction(textTitle: '3. Peserta didik mampu menganalisis serta mengevaluasi peristiwa sejarah dalam ruang lingkup lokal, nasional, dan global; mengaitkan hubungan antara peristiwa sejarah lokal, nasional, bahkan global.'),
            ],
          ),
        ),
      ),
    );
  }
}
