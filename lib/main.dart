import 'package:erisrental/providers/auth_provider.dart';
import 'package:erisrental/providers/booking_provider.dart';
import 'package:erisrental/providers/cart_provider.dart';
import 'package:erisrental/providers/mobil_provider.dart';
import 'package:erisrental/providers/transaksi_provider.dart';
import 'package:flutter/material.dart';
import 'package:erisrental/pages/cart_page.dart';
import 'package:erisrental/pages/checkout_page.dart';
import 'package:erisrental/pages/checkout_success_page.dart';
import 'package:erisrental/pages/detail_chat_page.dart';
import 'package:erisrental/pages/edit_profile_page.dart';
import 'package:erisrental/pages/home/main_page.dart';
import 'package:erisrental/pages/sign_in_page.dart';
import 'package:erisrental/pages/sign_up_page.dart';
import 'package:erisrental/pages/splash_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MobilProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransaksiProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BookingProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => const MainPage(),
          '/detail-chat': (context) => const DetailChatPage(),
          '/edit-profile': (context) => const EditProfilePage(),
          // '/product': (context) => const ProductPage(),
          '/cart': (context) => const CartPage(),
          '/checkout': (context) => CheckoutPage(),
          '/checkout-success': (context) => const CheckoutSuccessPage(),
        },
      ),
    );
  }
}
