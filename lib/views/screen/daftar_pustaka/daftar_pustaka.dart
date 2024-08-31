import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:media_pembelajaran/views/screen/introduction/components/card_introduction.dart';

class DaftarPustakaScreen extends StatelessWidget {
  const DaftarPustakaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Pustaka'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        child: Padding(
            padding: EdgeInsets.all(16.h),
            child: const Column(
              children: [
                CardIntroduction(textTitle: 'Chambali, A. (2017). Figur-Figur Kiaiku. Dinas Perpustakaan Daerah Kabupaten Lamongan Bidang Dokumentasi Dan Informasi.'),
                CardIntroduction(textTitle: 'Christian, R. A. (2011). Agresi Militer Belanda I dan II (Periode 1947-1949) Dalam Sudut Pandang Hukum Internasional. Skripsi (Online). Depok: Universita Indonesia.'),
                CardIntroduction(textTitle: 'Dinas Sejarah Militer, I. A. D. (1977). Seri monumen sejarah T.N.I. Angkatan Darat (1st ed.). Dinas Sejarah Tentara Nasional Indonesia Angkatan Darat.'),
                CardIntroduction(textTitle: 'Kartomihardjo, P., Saptono, P., & Soekarsono. (1986). Monumen Perjuangan Jawa Timur. Departemen Pendidikan dan Kebudayaan Direktorat Sejarah dan Nilai Tradisional Proyek Investarisasi dan Dokumentasi Sejarah Nasional.'),
                CardIntroduction(textTitle: 'Leimena, J. (1949). Perselisihan Indoesia -Belanda. Penerbit Grafica.'),
                CardIntroduction(textTitle: 'Moekhardi. (1979). Pendidikan perwira TNI-AD di masa revolusi Jilid 1. PT Inaltu 1979.'),
                CardIntroduction(textTitle: 'Moentalip. (1975). Memori Perjuangan Pahlawan Kadet Soewoko. Panitia Pembangunan Monumen Memori Lamongan.'),
                CardIntroduction(textTitle: 'Moestadjab et al. (2005). Peristiwa Perjuangan dalam Agresi II di Kabupaten Tuban dan Pembudayaan Nilai Kejuangan Melalui Napak Tilas. DHC 45.'),
                CardIntroduction(textTitle: 'Poesponegoro, M. D., & Notosusanto, N. (2019). Sejarah Nasional Indonesia Jilid 6 Zaman Jepang & Zaman Republik (pp. xiv–808). Balai Pustaka.'),
                CardIntroduction(textTitle: 'Ricklefs, M. C. (2008). Sejarah Indonesia Modern 1200-2008. PT. Serambi Ilmu Semesta.'),
                CardIntroduction(textTitle: 'Ronggolawe, P. P. S. B. (1985). Pengabdian Selama Perang Kemerdekaan Bersama Brigade Ronggolawe. PT Aries Lima.'),
                CardIntroduction(textTitle: 'Sapto, A. (2012). Sisi Lain Revolusi Indonesia: Gerilya Kota di Probolinggo. Aditya Media.'),
                CardIntroduction(textTitle: 'Sapto, A. (2013). Perang, Militer Dan Masyarakat: Pemerintahan Militer pada Masa Revolusi dan Pengaruhnya pada Indonesia Kini. Sejarah Dan Budaya, 7(1), 18–32.'),
                CardIntroduction(textTitle: 'Sapto, A. (2018). Republik dalam Pusaran Elite Sipil dan Milite. Matapadi Presindo.'),
                CardIntroduction(textTitle: 'Sinjai, D., Militer Yogya, A., & Harapan Baru, Y. (1996). Laporan kepada bangsa : Militer Akademi Yogya. Sinar Harapan.'),
                CardIntroduction(textTitle: 'Sjamsudduha, Mughni, S. A., Mufrodi, A., Syihabudin, A., & Faidullah, A. (1994). Lamongan Memayu Raharjaning Praja. Pemerintah Kabupaten Daerah Tingkat II Lamongan.'),
                CardIntroduction(textTitle: 'Soewito, I. H. N. H. (1994). Rakyat Jawa Timur mempertahankan kemerdekaan : 2. Gramedia Widiasarana Indonesia.'),
                CardIntroduction(textTitle: 'Sub-Direktorat Sejarah. (1987). Monumen Perjuangan Polisi I. Direktorat Personil Markas Besar Kepolisian Negara Republik Indonesia.'),
                CardIntroduction(textTitle: 'Suherly, T. (1971). Sedjarah perang kemerdekaan Indonesia. Pusat Sejarah ABRI Departemen Pertahanan Keamanan.'),
                CardIntroduction(textTitle: 'Tim Penyusun Buku. (1985). Lintasan Perjalanan Kepolisian RI Sejak Proklamasi-1950. Kepolisian Republik Indonesia.'),
                CardIntroduction(textTitle: 'Tim Penyusun Naskah Buku. (1992). Dharma Bhakti Pejuang Kepada Bangsa Dan Negara Pada Revolusi Fisik Tahun 1945-1950 Di Kabupaten Lamongan.'),
                CardIntroduction(textTitle: 'Tradisional, D. pendidikan dan kebudayaan direktorat sejarah dan nilai. (1989). Revolusi Nasional Tingkat Lokal. Departemen Pendidikan dan Kebudayaan Direktorat Sejarah dan Nilai Tradisional Proyek Inventarisasi.'),
                CardIntroduction(textTitle: 'Ministeria Van defensie, https://beeldbank.nimh.nl. diakses Maret 2024'),
                CardIntroduction(textTitle: 'Museum Maritiem, https://www.maritiemdigitaal.nl/index.cfm?event=page.home. di akses Maret 2024'),
              ],
            )
        ),
      ),
    );
  }
}
