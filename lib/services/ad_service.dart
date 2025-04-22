import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdService {
  static final AdService _instance = AdService._internal();

  factory AdService() {
    return _instance;
  }

  AdService._internal();

  InterstitialAd? _interstitialAd;
  bool _isAdLoaded = false;

  // Reklam yükleme sayaçları
  int _costAddCounter = 0;
  int _targetAddCounter = 0;

  // Test reklamları için ID'ler
  final String _interstitialAdUnitId = kDebugMode
      ? 'ca-app-pub-3940256099942544/1033173712' // Test ID
      : 'ca-app-pub-XXXXXXXXXXXXXXXX/XXXXXXXXXX'; // Gerçek ID'nizi buraya ekleyin

  Future<void> initialize() async {
    await MobileAds.instance.initialize();
    _loadInterstitialAd();
  }

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: _interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
          _isAdLoaded = true;

          // Reklam kapatıldığında yeni reklam yükle
          _interstitialAd!.fullScreenContentCallback =
              FullScreenContentCallback(
            onAdDismissedFullScreenContent: (InterstitialAd ad) {
              ad.dispose();
              _isAdLoaded = false;
              _loadInterstitialAd();
            },
            onAdFailedToShowFullScreenContent:
                (InterstitialAd ad, AdError error) {
              ad.dispose();
              _isAdLoaded = false;
              _loadInterstitialAd();
            },
          );
        },
        onAdFailedToLoad: (LoadAdError error) {
          _isAdLoaded = false;
          _interstitialAd = null;
          // Belirli bir süre sonra tekrar yüklemeyi dene
          Future.delayed(const Duration(minutes: 1), _loadInterstitialAd);
        },
      ),
    );
  }

  // Cost eklendiğinde çağrılacak metod
  void onCostAdded() {
    _costAddCounter++;

    // 2 cost eklendiğinde reklam göster
    if (_costAddCounter >= 2) {
      showInterstitialAd();
      _costAddCounter = 0; // Sayacı sıfırla
    }
  }

  // Target eklendiğinde çağrılacak metod
  void onTargetAdded() {
    _targetAddCounter++;

    // 1 target eklendiğinde reklam göster
    if (_targetAddCounter >= 1) {
      showInterstitialAd();
      _targetAddCounter = 0; // Sayacı sıfırla
    }
  }

  // Geçiş reklamını göster
  void showInterstitialAd() {
    if (_interstitialAd != null && _isAdLoaded) {
      _interstitialAd!.show();
    } else {
      // Reklam yüklü değilse yeni reklam yükle
      _loadInterstitialAd();
    }
  }

  // Uygulama kapatıldığında reklamı temizle
  void dispose() {
    _interstitialAd?.dispose();
  }
}
