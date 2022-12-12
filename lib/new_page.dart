import 'package:boichuk_lab/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'main.dart';
import 'my_home_page.dart';

class NewPage extends StatefulWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    logger.i('PAGE INITILIZATION');
    super.initState();
  }

  @override
  void dispose() {
    logger.i('PAGE DISPOSE');
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached || state == AppLifecycleState.inactive) {
      return;
    }
    if (state == AppLifecycleState.paused) {
      logger.i('PAUSE APPLICATION');
    } else if (state == AppLifecycleState.resumed) {
      logger.i('RESUME APPLICATION');
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.newPage.tr()),
        shadowColor: Colors.red,
        backgroundColor: Colors.blue.withOpacity(0.5),
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.white,
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 30),
              const Text('Виберіть мову користування'),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.setLocale(const Locale(ENGLISH_LOCALE_CODE));
                      setState(() {});
                    },
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 500),
                      style: TextStyle(fontSize: context.locale == const Locale(ENGLISH_LOCALE_CODE) ? 20 : 10),
                      child: const Text('ENGLISH'),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.setLocale(const Locale(UKRAINE_LOCALE_CODE));
                      setState(() {});
                    },
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 500),
                      style: TextStyle(fontSize: context.locale == const Locale(UKRAINE_LOCALE_CODE) ? 20 : 10),
                      child: const Text('УКРАЇНСЬКА'),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                AppStrings.thisIsNewPage.tr(),
                style: const TextStyle(color: Colors.red, fontSize: 25, wordSpacing: 40, fontWeight: FontWeight.w800),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ],
      ),
    );
  }
}
