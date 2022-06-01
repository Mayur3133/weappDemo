import 'dart:async';
import 'dart:io';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const _kShouldTestAsyncErrorOnInit = false;

const _kTestingCrashlytics = true;

class crash extends StatefulWidget {
  crash({Key? key}) : super(key: key);

  @override
  _crashState createState() => _crashState();
}

class _crashState extends State<crash> {
  late Future<void> _initializeFlutterFireFuture;

  Future<void> _testAsyncErrorOnInit() async {
    Future<void>.delayed(const Duration(seconds: 2), () {
      final List<int> list = <int>[];
      print(list[100]);
    });
  }

  Future<void> _initializeFlutterFire() async {
    if (_kTestingCrashlytics) {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    } else {
      await FirebaseCrashlytics.instance
          .setCrashlyticsCollectionEnabled(!kDebugMode);
    }

    if (_kShouldTestAsyncErrorOnInit) {
      await _testAsyncErrorOnInit();
    }
  }

  @override
  void initState() {
    super.initState();
    _initializeFlutterFireFuture = _initializeFlutterFire();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crashlytics'),
      ),
      body: FutureBuilder(
        future: _initializeFlutterFireFuture,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ElevatedButton(
                    //   onPressed: () {
                    //     FirebaseCrashlytics.instance
                    //         .setCustomKey('example', 'flutterfire');
                    //     ScaffoldMessenger.of(context)
                    //         .showSnackBar(const SnackBar(
                    //       content: Text(
                    //           'Custom Key "example: flutterfire" has been set \n'
                    //           'Key will appear in Firebase Console once an error has been reported.'),
                    //       duration: Duration(seconds: 5),
                    //     ));
                    //   },
                    //   child: const Text('Key'),
                    // ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     FirebaseCrashlytics.instance
                    //         .log('This is a log example');
                    //     ScaffoldMessenger.of(context)
                    //         .showSnackBar(const SnackBar(
                    //       content: Text(
                    //           'The message "This is a log example" has been logged \n'
                    //           'Message will appear in Firebase Console once an error has been reported.'),
                    //       duration: Duration(seconds: 5),
                    //     ));
                    //   },
                    //   child: const Text('Log'),
                    // ),
                    ElevatedButton(
                      onPressed: () async {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('App will crash is 5 seconds \n'
                              'Please reopen to send data to Crashlytics'),
                          duration: Duration(seconds: 5),
                        ));
                        FirebaseCrashlytics.instance.recordError("error", null,
                            reason: 'a fatal error',
                            // Pass in 'fatal' argument
                            fatal: true);
                        sleep(const Duration(seconds: 5));

                        FirebaseCrashlytics.instance.crash();
                      },
                      child: const Text('Crash'),
                    ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     ScaffoldMessenger.of(context)
                    //         .showSnackBar(const SnackBar(
                    //       content: Text(
                    //           'Thrown error has been caught and sent to Crashlytics.'),
                    //       duration: Duration(seconds: 5),
                    //     ));
                    //
                    //     throw StateError('Uncaught error thrown by app');
                    //   },
                    //   child: const Text('Throw Error'),
                    // ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     ScaffoldMessenger.of(context)
                    //         .showSnackBar(const SnackBar(
                    //       content: Text(
                    //           'Uncaught Exception that is handled by second parameter of runZonedGuarded.'),
                    //       duration: Duration(seconds: 5),
                    //     ));
                    //
                    //     runZonedGuarded(() {
                    //       Future<void>.delayed(const Duration(seconds: 2),
                    //           () {
                    //         final List<int> list = <int>[];
                    //         print(list[100]);
                    //       });
                    //     }, FirebaseCrashlytics.instance.recordError);
                    //   },
                    //   child: const Text('Async out of bounds'),
                    // ),
                    // ElevatedButton(
                    //   onPressed: () async {
                    //     try {
                    //       ScaffoldMessenger.of(context)
                    //           .showSnackBar(const SnackBar(
                    //         content: Text('Recorded Error'),
                    //         duration: Duration(seconds: 5),
                    //       ));
                    //       throw Error();
                    //     } catch (e, s) {
                    //       await FirebaseCrashlytics.instance.recordError(e, s,
                    //           reason: 'as an example of fatal error',
                    //           fatal: true);
                    //     }
                    //   },
                    //   child: const Text('Record Fatal Error'),
                    // ),
                    // ElevatedButton(
                    //   onPressed: () async {
                    //     try {
                    //       ScaffoldMessenger.of(context)
                    //           .showSnackBar(const SnackBar(
                    //         content: Text('Recorded Error'),
                    //         duration: Duration(seconds: 5),
                    //       ));
                    //       throw Error();
                    //     } catch (e, s) {
                    //       await FirebaseCrashlytics.instance.recordError(e, s,
                    //           reason: 'as an example of non-fatal error');
                    //     }
                    //   },
                    //   child: const Text('Record Non-Fatal Error'),
                    // ),
                  ],
                ),
              );
            default:
              return const Center(child: Text('Loading'));
          }
        },
      ),
    );
  }
}
