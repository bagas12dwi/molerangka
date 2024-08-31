import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:media_pembelajaran/views/const/color.dart';
import 'package:media_pembelajaran/views/screen/introduction/components/card_introduction.dart';

class TujuanScreen extends StatelessWidget {
  const TujuanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tujuan Pembelajaran'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        child: Padding(
          padding: EdgeInsets.all(16.h),
          child: const Column(
            children: [
              CardIntroduction(textTitle: '1.	Peserta didik mampu mengidentifikasi Perlawanan-Perlawanan Bangsa Indonesia melalui perlawanan fisik Agresi Milliter II di Kabupaten Lamongan.'),
              CardIntroduction(textTitle: '2.	Peserta didik mampu mengevaluasi berbagai strategi perlawanan fisik Bangsa Indonesia dalam Agresi Militer II menghadapi pasukan Belanda di Kabupaten Lamongan.'),
              CardIntroduction(textTitle: '3.	Peserta didik mampu mengidentifikasi berbagai dampak Agresi Militer II di Kabupaten Lamongan.'),
              CardIntroduction(textTitle: '4.	Peserta didik mampu mengevaluasi berbagai dampak Agresi Militer II di Kabupaten Lamongan.'),
            ],
          )
        ),
      ),
    );
  }
}
