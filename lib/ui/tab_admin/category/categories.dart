import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:najot_shop/ui/tab_admin/category/update_categories.dart';
import 'package:provider/provider.dart';

import '../../../data/models/category/category_model.dart';
import '../../../provider/category_provider.dart';
import 'add_categories.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context)=>AddCategories()));
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: StreamBuilder<List<CategoryModel>>(
        stream: context.read<CategoryProvider>().getCategories(),
        builder: (BuildContext context,
            AsyncSnapshot<List<CategoryModel>> snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.isNotEmpty
                ? ListView(
              children: List.generate(
                snapshot.data!.length,
                    (index) {
                  CategoryModel categoryModel = snapshot.data![index];
                  return ListTile(
                    onLongPress: () {
                      context.read<CategoryProvider>().deleteCategory(
                        context: context,
                        categoryId: categoryModel.categoryId,
                      );
                    },
                    title: Image.file(categoryModel.imageUrl as File),
                    subtitle: Text(categoryModel.description),

                    trailing: IconButton(
                      onPressed: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context)=>UpdateCategories()));
                        // Navigator.push(context, CupertinoPageRoute(builder: (context)=>UpdateCategories()));
                      },
                      icon: const Icon(Icons.edit),
                    ),
                  );
                },
              ),
            )
                : const Center(child: Text("Empty!"));
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
