import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:najot_shop/provider/category_provider.dart';
import 'package:najot_shop/ui/tab_admin/category/categories.dart';
import 'package:najot_shop/utils/colors/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../data/models/category/category_model.dart';



class AddCategories extends StatefulWidget {
  const AddCategories({Key? key}) : super(key: key);

  @override
  State<AddCategories> createState() => _AddCategoriesState();
}

class _AddCategoriesState extends State<AddCategories> {


  File? image;


  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading :  IconButton(onPressed: (){
            context.read<CategoryProvider>().nameController.clear();
            context.read<CategoryProvider>().descriptionController.clear();
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back))
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter name',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(width: 1, color: AppColors.c_C4C5C4),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(width: 1, color: AppColors.c_C4C5C4),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(width: 1, color: AppColors.c_C4C5C4),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(width: 1, color: AppColors.c_C4C5C4),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(width: 1, color: AppColors.c_C4C5C4),
                ),
              ),
              controller: context.read<CategoryProvider>().nameController,
            ),
            SizedBox(height: 12,),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter description',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(width: 1, color: AppColors.c_C4C5C4),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(width: 1, color: AppColors.c_C4C5C4),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(width: 1, color: AppColors.c_C4C5C4),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(width: 1, color: AppColors.c_C4C5C4),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(width: 1, color: AppColors.c_C4C5C4),
                ),
              ),
              controller: context.read<CategoryProvider>().descriptionController,
            ),

            SizedBox(height: 32,),
            ElevatedButton(
                onPressed: () {
                  pickImage();
                },
                child: const Text('Select image')),
            ElevatedButton(
                onPressed: () {
                  pickCamera();
                },
                child: const Text('Select camera')),
            SizedBox(height: 32,),
            ElevatedButton(onPressed: (){
              if(context.read<CategoryProvider>().descriptionController.text.isNotEmpty && context.read<CategoryProvider>().nameController.text.isNotEmpty) {
                context.read<CategoryProvider>().addCategory(
                  context: context,
                  categoryModel: CategoryModel(
                    categoryId: "1",
                    categoryName: context
                        .read<CategoryProvider>()
                        .nameController
                        .text,
                    description: context
                        .read<CategoryProvider>()
                        .descriptionController
                        .text,
                    imageUrl: image!.path,
                    createdAt: DateTime.now().toString(),
                  ),
                );
              Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=>Categories()));
              }
              context.read<CategoryProvider>().nameController.clear();
              context.read<CategoryProvider>().descriptionController.clear();
            }, child: Text('Add'))
          ],
        ),
      ),
    );
  }
}
