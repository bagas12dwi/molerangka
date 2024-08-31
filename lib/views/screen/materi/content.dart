import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:media_pembelajaran/controllers/materi_controller.dart';
import 'package:media_pembelajaran/controllers/quiz_controller.dart';
import 'package:media_pembelajaran/helpers/api.dart';
import 'package:media_pembelajaran/views/const/color.dart';
import 'package:media_pembelajaran/views/const/components/rounded_button.dart';
import 'package:media_pembelajaran/views/screen/materi/quiz.dart';
import 'package:photo_view/photo_view.dart';

class ContentScreen extends StatelessWidget {
  ContentScreen({super.key, required this.idSubmateri, required this.userId});
  final int idSubmateri;
  final MateriController materiController = Get.put(MateriController());
  final QuizController quizController = Get.put(QuizController());
  final int userId;
  final PageController _pageController = PageController();


  @override
  Widget build(BuildContext context) {
    materiController.getDetailSubmateri(idSubmateri);
    return FutureBuilder(
      future: materiController.getDetailSubmateri(idSubmateri),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show loading indicator while fetching data
          return Scaffold(
            appBar: AppBar(
              title: const Text('Loading...'),
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          // Show error message if data fetching fails
          return Scaffold(
            appBar: AppBar(
              title: const Text('Error'),
            ),
            body: const Center(
              child: Text('Failed to fetch data'),
            ),
          );
        } else {
          // Data fetched successfully, display the AppBar with submateri name
          final submateri = materiController.submateri.value; // Assuming submateri is an observable

// Your method to split the description

          return Scaffold(
            appBar: AppBar(
              title: Text(submateri.name),
              backgroundColor: kPrimaryColor,
              foregroundColor: kLight,
            ),
            body: Padding(
              padding: EdgeInsets.all(16.h),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.h),
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(20.h)
                      ),
                      child: HtmlWidget(
                        textStyle: TextStyle(color: kLight, fontSize: 14.h),
                        submateri.description,
                      ),
                    ),
                    SizedBox(height: 16.h,),
                    submateri.imgPath != '' ? SizedBox(
                      height: MediaQuery.of(context).size.height * .5,
                      child: PhotoView(
                        imageProvider: NetworkImage('${Api.imgUrl}/${submateri.imgPath}'),
                      ),
                    ) : Container(),
                    SizedBox(height: 10.h,),
                    Text(
                      submateri.caption,
                      style: TextStyle(
                          fontSize: 12.h,
                          fontStyle: FontStyle.italic
                      ),
                    ),
                    SizedBox(height: 16.h,),
                    submateri.name != 'Upaya Perlawanan Mempertahankan Kemerdekaan di Kabupaten Lamongan'
                    ? RoundedButton(
                        text: 'Lanjut Simulasi Kuis',
                        press: () {
                          Get.to(() => QuizSubmateriScreen(subMaterialId: submateri.id, userId: userId));
                        }
                    ) : Container()
                  ],
                ),
              ),
            ),
          );

        }
      },
    );
  }
}
