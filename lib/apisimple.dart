import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ApiSimple extends StatefulWidget {
  const ApiSimple({Key? key}) : super(key: key);

  @override
  State<ApiSimple> createState() => _ApiSimpleState();
}

class _ApiSimpleState extends State<ApiSimple> {
  BannerAd? banner;

  @override
  void initState() {
    super.initState();
    createbannerad();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: banner == null
            ? Container()
            : Container(
                margin: EdgeInsets.only(bottom: 12),
                height: 52,
                child: AdWidget(ad: banner!)),
        body: Container());
  }

  createbannerad() async {
    banner = BannerAd(
        size: AdSize.fullBanner,
        adUnitId: 'ca-app-pub-3940256099942544~3347511713',
        listener: BannerAdListener(onAdFailedToLoad: (ad, error) {
          ad.dispose();
        }),
        request: AdRequest());
      banner!.load();
  }
}
