
import 'package:flutter/material.dart';
import 'package:najot_shop/ui/tab/cart/cart_screen.dart';
import 'package:najot_shop/ui/tab/profile/profile_screen.dart';
import 'package:najot_shop/ui/tab_admin/category/categories.dart';
import 'package:najot_shop/ui/tab_admin/product/product.dart';

import '../ui/tab/home/home_screen.dart';

class TabBoxProvider with ChangeNotifier{

  List<Widget> screens = [Product(),Categories(),ProfileScreen()];

  int currentIndex = 0;

  getScreen(int index){
    currentIndex = index;
    notifyListeners();
  }



}