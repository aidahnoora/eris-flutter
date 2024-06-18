import 'package:erisrental/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:erisrental/pages/home/home_page.dart';
import 'package:erisrental/pages/home/profile_page.dart';
import 'package:erisrental/pages/home/wishlist_page.dart';
import 'package:erisrental/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    
    Widget customButtonNav() {
      return BottomAppBar(
        color: priceColor,
        shape: const CircularNotchedRectangle(),
        notchMargin: 12,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
            backgroundColor: transparentColor,
            elevation: 0,
            currentIndex: currentIndex,
            onTap: (value) {
              // print(value);
              setState(() {
                currentIndex = value;
              });
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: 1,
                  ),
                  child: Image.asset(
                    'assets/icon_home.png',
                    width: 21,
                    color: currentIndex == 0
                        ? backgroundColor2
                        : backgroundColor6
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: 1,
                  ),
                  child: Image.asset(
                    'assets/icon_chat.png',
                    width: 20,
                    color: currentIndex == 1
                        ? backgroundColor2
                        : backgroundColor6
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: 1,
                  ),
                  child: Image.asset(
                    'assets/icon_wishlist.png',
                    width: 20,
                    color: currentIndex == 2
                        ? backgroundColor2
                        : backgroundColor6
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: 1,
                  ),
                  child: Image.asset(
                    'assets/icon_profile.png',
                    width: 18,
                    color: currentIndex == 3
                        ? backgroundColor2
                        : backgroundColor6
                  ),
                ),
                label: '',
              ),
            ]),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
        return const CartPage();
        case 2:
          return const WishlistPage();
        case 3:
          return const ProfilePage();
        default:
          return HomePage();
      }
    }

    return Scaffold(
        backgroundColor: currentIndex == 0 ? backgroundColor1 : backgroundColor3,
        // floatingActionButton: cartButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: customButtonNav(),
        body: body());
  }
}
