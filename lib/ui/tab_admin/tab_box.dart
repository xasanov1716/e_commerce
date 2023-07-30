import 'package:flutter/material.dart';
import 'package:najot_shop/provider/tab_box_provider.dart';
import 'package:najot_shop/utils/colors/app_colors.dart';
import 'package:provider/provider.dart';

class TabBoxAdmin extends StatelessWidget {
  const TabBoxAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.watch<TabBoxProvider>().screens[context.watch<TabBoxProvider>().currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.c_13181F,
        type: BottomNavigationBarType.fixed,
        currentIndex: context.read<TabBoxProvider>().currentIndex,
        onTap: (int index){
          context.read<TabBoxProvider>().getScreen(index);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Product'),
          BottomNavigationBarItem(icon: Icon(Icons.card_travel),label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
        ],
      ),
    );
  }
}
