import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/route/app_route.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/profile/data/models/pdf_args.dart';
import 'package:sizer/sizer.dart';

class CustomPortfolioItem extends StatelessWidget {
  final String text;
  final String size;
  final File selectedFile;
  final bool? isImage;
  const CustomPortfolioItem(
      {super.key,
      required this.text,
      required this.size,
      this.isImage = false,
      required this.selectedFile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: AppTheme.neutral3),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Image.network(
            isImage!
                ? 'https://cdn.icon-icons.com/icons2/2570/PNG/512/image_icon_153794.png'
                : 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRZJY2YZTyHwVQqbb9Dzsrz2bAdR2JfJCzito195cDsUnjnjCSf',
            width: 5.5.h,
            height: 5.5.h,
          ),
          title: Text(text,
              style: Styles.textStyle11.copyWith(
                color: AppTheme.neutral9,
              )),
          subtitle: Text(isImage! ? 'IMG $size MB' : 'CV.pdf $size MB',
              style: Styles.textStyle10(
                color: AppTheme.neutral5,
              )),
          trailing: SizedBox(
            width: 27.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    if (isImage!) {
                      Navigator.pushNamed(context, AppRoute.imageScreen);
                    } else {
                      final PdfScreenArguments args =
                          PdfScreenArguments(selectedFile, text);

                      Navigator.pushNamed(context, AppRoute.pdfScreen,
                          arguments: args);
                    }
                  },
                  icon: Icon(
                    Iconsax.edit_2,
                    color: AppTheme.primary5,
                    size: 20.sp,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Iconsax.close_circle,
                    color: AppTheme.danger5,
                    size: 20.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
