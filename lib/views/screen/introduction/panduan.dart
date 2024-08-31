import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:media_pembelajaran/views/screen/introduction/components/card_introduction.dart';
import 'package:media_pembelajaran/views/screen/introduction/components/card_panduan.dart';

class PanduanScreen extends StatelessWidget {
  const PanduanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panduan Penggunaan'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(16.h),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CardPanduan(
                  card: Column(
                    children: [
                      CardIntroduction(textTitle: 'Akses Materi: Di menu utama, pilih ikon atau tab "Materi". Anda akan melihat daftar bab dan sub-bab yang berisi informasi tentang Perang Kemerdekaan di Kabupaten Lamongan.'),
                      CardIntroduction(textTitle: 'Navigasi: Gunakan navigasi yang tersedia untuk berpindah antar bab dan sub-bab. Anda dapat membaca teks, melihat gambar yang tersedia.'),
                    ],
                  ),
                  titleUtama: '1. Menu Utama',
                  titleMateri: 'Fitur Materi'
              ),
              CardPanduan(
                  card: Column(
                    children: [
                      CardIntroduction(textTitle: 'Galeri Media: Pilih ikon atau tab "Galeri" untuk mengakses koleksi gambar dan terkait Perang Kemerdekaan di Kabupaten Lamongan.'),
                      CardIntroduction(textTitle: 'Interaksi: Anda bisa memperbesar gambar untuk mendapatkan pengalaman belajar yang lebih mendalam.'),
                    ],
                  ),
                  titleUtama: '',
                  titleMateri: 'Galeri'
              ),
              CardPanduan(
                  card: Column(
                    children: [
                      CardIntroduction(textTitle: 'Akses Simulasi Kuis: Pilih ikon atau tab "Simulasi Kuis". Di sini, Anda dapat mencoba berbagai kuis latihan untuk menguji pengetahuan Anda sebelum mengikuti kuis utama.'),
                      CardIntroduction(textTitle: 'Jawab Pertanyaan: Jawab setiap pertanyaan yang muncul. Setelah selesai, Anda akan menerima umpan balik dan skor hasil simulasi.'),
                    ],
                  ),
                  titleUtama: '',
                  titleMateri: 'Simulasi Kuis'
              ),
              CardPanduan(
                  card: Column(
                    children: [
                      CardIntroduction(textTitle: 'Akses Kuis Utama: Pilih ikon atau tab "Kuis " setelah Anda merasa siap mengikuti kuis yang sebenarnya.'),
                      CardIntroduction(textTitle: 'Mulai Kuis: Ikuti instruksi untuk memulai kuis. Jawab setiap pertanyaan dengan cermat. Anda akan mendapatkan skor akhir setelah menyelesaikan semua pertanyaan.'),
                    ],
                  ),
                  titleUtama: '',
                  titleMateri: 'Kuis'
              ),
              CardPanduan(
                  card: Column(
                    children: [
                      CardIntroduction(textTitle: 'Akses 3D Monumen: Pilih ikon atau tab "3D Monumen" untuk melihat model 3D monumen bersejarah yang terkait dengan Perang Kemerdekaan di Kabupaten Lamongan.'),
                      CardIntroduction(textTitle: 'Interaksi: Gunakan kontrol yang tersedia untuk memutar dan memperbesar model 3D. Anda dapat melihat detail dari berbagai sudut.'),
                    ],
                  ),
                  titleUtama: '',
                  titleMateri: '3D Monumen'
              ),
              CardPanduan(
                  card: Column(
                    children: [
                      CardIntroduction(textTitle: 'Profil: Pilih ikon profil untuk melihat atau mengedit informasi akun Anda.'),
                      CardIntroduction(textTitle: 'Pengaturan: Akses pengaturan untuk menyesuaikan preferensi aplikasi, seperti notifikasi dan bahasa.'),
                    ],
                  ),
                  titleUtama: '',
                  titleMateri: 'Profil dan Pengaturan'
              ),
            ],
          ),
        ),
      ),
    );
  }
}
