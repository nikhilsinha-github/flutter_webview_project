import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nepalbestdeal/helper/route_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Nepal Best Deal",
      debugShowCheckedModeBanner: false,
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:nepalbestdeal/util/app_constants.dart';
// import 'package:nepalbestdeal/view/backevent_notifier.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(ChangeNotifierProvider(
//     create: (context) => BackEventNotifier(),
//     child: const MyApp(),
//   ));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Webpage(),
//     );
//   }
// }

// class Webpage extends StatelessWidget {
//   late WebViewController _controll;

//   final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

//   Webpage({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: _onBack,
//       child: Scaffold(
//         key: _globalKey,
//         appBar: AppBar(
//           title: const Text('Webview Back Button '),
//         ),
//         body: WebView(
//           initialUrl: AppConstants.url,
//           javascriptMode: JavascriptMode.unrestricted,
//           onWebViewCreated: (webViewController) {
//             _controll = webViewController;
//           },
//           onProgress: (int progress) {
//             print("WebView is loading (progress : $progress%)");
//           },
//           javascriptChannels: <JavascriptChannel>{
//             _toasterJavascriptChannel(context),
//           },
//           navigationDelegate: (NavigationRequest request) {
//             print('allowing navigation to $request');
//             return NavigationDecision.navigate;
//           },
//           onPageStarted: (String url) {
//             print('Page started loading: $url');
//           },
//           onPageFinished: (String url) {
//             print('Page finished loading: $url');
//           },
//           gestureNavigationEnabled: true,
//         ),
//       ),
//     );
//   }

//   JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
//     return JavascriptChannel(
//         name: 'Toaster',
//         onMessageReceived: (JavascriptMessage message) {
//           // ignore: deprecated_member_use
//           Scaffold.of(context).showSnackBar(
//             SnackBar(content: Text(message.message)),
//           );
//         });
//   }

//   Future<bool> _onBack() async {
//     var value = await _controll.canGoBack(); // check webview can go back

//     if (value) {
//       _controll.goBack(); // perform webview back operation

//       return false;
//     } else {
//       late BackEventNotifier _notifier;
//       await showDialog(
//           context: _globalKey.currentState!.context,
//           builder: (context) =>
//               Consumer<BackEventNotifier>(builder: (context, event, child) {
//                 _notifier = event;
//                 return AlertDialog(
//                   title: const Text('Confirmation ',
//                       style: TextStyle(color: Colors.purple)),
//                   content: const Text('Do you want exit app ? '),
//                   actions: <Widget>[
//                     TextButton(
//                       onPressed: () {
//                         Navigator.of(context).pop(false);
//                         event.add(false);
//                       },

//                       child: const Text("No"), // No
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                         event.add(true);
//                       },
//                       child: const Text("Yes"), // Yes
//                     ),
//                   ],
//                 );
//               }));

//       //Navigator.pop(_globalKey.currentState!.context);
//       print("_notifier.isBack ${_notifier.isBack}");
//       return _notifier.isBack;
//     }
//   }
// }
