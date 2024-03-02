import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/apply_job/presentation/views/widgets/job_details_people_tile.dart';
import 'package:sizer/sizer.dart';

class JobDetailsPepoleScreen extends StatelessWidget {
  const JobDetailsPepoleScreen({
    super.key,
  });

  @override
  
  Widget build(BuildContext context) {
    String selectedValue = "UI/UX Designer";
  List<String> empplyeesTitle = ['Front', 'UI/UX Designer'];
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('3 Employees For',
                  style: Styles.textStyle11.copyWith(color: AppTheme.neutral9)),
              subtitle: Text('UI/UX Design',
                  style: Styles.textStyle10(color: AppTheme.neutral5)),
              trailing: SizedBox(
                width: 40.w,
                child: DropdownButtonFormField(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Iconsax.arrow_down_14,
                    color: AppTheme.neutral9,
                    size: 14.sp,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: const BorderSide(
                        color: AppTheme.neutral3,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppTheme.primary5),
                    ),
                  ),
                  value: selectedValue,
                  onChanged: (String? newValue) {
                    selectedValue = newValue!;
                  },
                  items: empplyeesTitle.map((String title) {
                    return DropdownMenuItem(
                      value: title,
                      child: Text(
                        title,
                        style: Styles.textStyle10(
                          color: AppTheme.neutral9,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => JobDetailsPeopleTile(
                    image:
                        "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTZClNi2dGGXiI5K7tZaMrc2CT6Ysy5zmeBXaORUA7dz2ZNFYeR",
                    name: "Dimas Adi Saputro",
                    job: "Senior UI/UX Designer at Twitter",
                    yearsOfExp: "5 Years"),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: 5),
          ],
        ),
      ),
    );
  }
}
