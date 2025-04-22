import 'package:flutter/material.dart';
import 'package:pocketPath/services/ad_service.dart';

class AdMobTestPage extends StatefulWidget {
  const AdMobTestPage({Key? key}) : super(key: key);

  @override
  State<AdMobTestPage> createState() => _AdMobTestPageState();
}

class _AdMobTestPageState extends State<AdMobTestPage> {
  final AdService _adService = AdService();
  int _costCounter = 0;
  int _targetCounter = 0;

  @override
  void initState() {
    super.initState();
    _adService.initialize();
  }

  void _simulateAddCost() {
    _costCounter++;
    _adService.onCostAdded();
    setState(() {});
  }

  void _simulateAddTarget() {
    _targetCounter++;
    _adService.onTargetAdded();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdMob Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Cost Ekleme Sayacı: $_costCounter',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              '2 cost eklendiğinde reklam gösterilecek',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _simulateAddCost,
              child: const Text('Cost Ekle'),
            ),
            const SizedBox(height: 40),
            Text(
              'Target Ekleme Sayacı: $_targetCounter',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              '1 target eklendiğinde reklam gösterilecek',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _simulateAddTarget,
              child: const Text('Target Ekle'),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => _adService.showInterstitialAd(),
              child: const Text('Reklamı Manuel Göster'),
            ),
          ],
        ),
      ),
    );
  }
}
