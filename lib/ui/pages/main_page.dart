import 'package:airplane/ad_helper.dart';
import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/ui/pages/custom_api.dart';
import 'package:airplane/ui/pages/home_page.dart';
import 'package:airplane/ui/pages/setting_page.dart';
import 'package:airplane/ui/pages/transaction_page.dart';
import 'package:airplane/ui/pages/wallet_page.dart';
import 'package:airplane/ui/widgets/custom_bottom_navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    initBannerAd();
    // TODO: implement initState
    super.initState();
  }

  late BannerAd bannerAd;
  bool isAdLoaded = false;
  initBannerAd() {
    bannerAd = BannerAd(
        size: AdSize.largeBanner,
        adUnitId: AdHelper.bannerAdUnitId,
        listener: BannerAdListener(onAdLoaded: (ad) {
          print("DANI HIDYAT");
          setState(() {
            isAdLoaded = true;
          });
        }, onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print("error");
        }),
        request: const AdRequest());
    bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return TransactionPage();
        case 2:
          return WalletPage();
        case 3:
          return SettingPage();
        case 4:
          return CustomApi();
        default:
          return HomePage();
      }
    }

    Widget customBottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.only(
            bottom: 30,
            left: defaultMargin,
            right: defaultMargin,
          ),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottomNavigationItem(
                index: 0,
                imageUrl: 'assets/icon_home.png',
              ),
              // CustomBottomNavigationItem(
              //   index: 1,
              //   imageUrl: 'assets/icon_booking.png',
              // ),
              // CustomBottomNavigationItem(
              //   index: 2,
              //   imageUrl: 'assets/icon_card.png',
              // ),
              CustomBottomNavigationItem(
                index: 3,
                imageUrl: 'assets/icon_settings.png',
              ),
              // CustomBottomNavigationItem(
              //   index: 4,
              //   imageUrl: 'assets/icon_settings.png',
              // ),
            ],
          ),
        ),
      );
    }

    Widget ads() {
      return isAdLoaded
          ? Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: SizedBox(
                height: bannerAd.size.height.toDouble() + 20,
                width: bannerAd.size.width.toDouble() + 50,
                child: AdWidget(ad: bannerAd),
              ),
            )
          : const SizedBox();
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          body: Stack(
            children: [
              buildContent(currentIndex),
              customBottomNavigation(),
              ads(),
            ],
          ),
        );
      },
    );
  }
}
