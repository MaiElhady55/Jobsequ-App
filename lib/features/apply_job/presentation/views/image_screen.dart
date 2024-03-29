import 'package:flutter/material.dart';
import 'package:jobsque/core/app_widgets/custom_appbar.dart';
import 'package:jobsque/features/apply_job/presentation/view_models/cubit/job_cubit.dart';
import 'package:photo_view/photo_view.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  late JobCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = JobCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          customAppBar(cubit.selectedOtherFile!.path.split('/').last, context),
      body: Container(
          color: Colors.white,
          child: PhotoView(
            imageProvider: FileImage(cubit.selectedOtherFile!),
          )),
    );
  }
}
