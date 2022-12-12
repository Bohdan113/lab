import 'package:boichuk_lab/app_strings.dart';
import 'package:boichuk_lab/new_page.dart';
import 'package:boichuk_lab/shared_util.dart';
import 'package:boichuk_lab/web_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    textController = TextEditingController();
    _sharedText();
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _sharedText() async {
    var text = await SharedPreferenceUtils().getText();
    if (text != null) {
      textShared = text;
    } else {
      textShared = '';
    }
    setState(() {});
  }

  var val = true;
  var textShared = '';
  late TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.appName.tr()),
          backgroundColor: Colors.blue,
          actions: [
            ElevatedButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              child: const Icon(
                Icons.output,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Text(
              AppStrings.sharedText.tr(
                namedArgs: {'text': textShared},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textController,
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  if (textController.text.isNotEmpty) {
                    await SharedPreferenceUtils().saveText(text: textController.text);
                    textController.clear();
                    _sharedText();
                  }
                },
                child: Text(
                  AppStrings.saveTextInSharedPreferences.tr(),
                )),
            ElevatedButton(
              onPressed: () async {
                if (textShared.isNotEmpty) {
                  await SharedPreferenceUtils().deleteText();
                  _sharedText();
                }
              },
              child: Text(
                AppStrings.deleteSharedText.tr(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: !val,
                  onChanged: (e) {
                    setState(() {
                      val = false;
                    });
                  },
                ),
                Checkbox(
                  value: val,
                  onChanged: (e) {
                    setState(() {
                      val = true;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: false,
                  onChanged: (e) {
                    setState(() {
                      val = false;
                    });
                  },
                  groupValue: val,
                ),
                Radio(
                  value: true,
                  onChanged: (e) {
                    setState(() {
                      val = true;
                    });
                  },
                  groupValue: val,
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const OpenWebViewScreen();
                      },
                    ),
                  );
                },
                child: Text(
                  AppStrings.goToWebView.tr(),
                )),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const NewPage();
                      },
                    ),
                  );
                },
                child: Text(
                  AppStrings.goToNewPage.tr(),
                )),
            Text(
              AppStrings.youHavePushedTheButtonThisManyTimes.tr(),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              heroTag: 's12',
              onPressed: () {
                setState(() {
                  _counter = 0;
                });
              },
              tooltip: 'Refresh',
              child: const Icon(Icons.refresh_outlined),
            ),
            const SizedBox(width: 10),
            FloatingActionButton(
              heroTag: 's',
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
