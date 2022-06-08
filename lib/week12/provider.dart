// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// //
// // class Counter extends ChangeNotifier {
// //   var _count = 0;
// //
// //   int get getCounter {
// //     return _count;
// //   }
// //
// //   void incrementCounter() {
// //     _count += 1;
// //     notifyListeners();
// //   }
// //
// //   void minus() {
// //     _count -= 1;
// //     notifyListeners();
// //   }
// // }
// //
// // class provider extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MultiProvider(
// //       providers: [
// //         ChangeNotifierProvider.value(
// //           value: Counter(),
// //         ),
// //       ],
// //       child: MaterialApp(
// //         debugShowCheckedModeBanner: false,
// //         title: 'Flutter Demo',
// //         theme: ThemeData(
// //           primarySwatch: Colors.blue,
// //           visualDensity: VisualDensity.adaptivePlatformDensity,
// //         ),
// //         home: MyHomePage(title: " Provider "),
// //       ),
// //     );
// //   }
// // }
// //
// // class MyHomePage extends StatelessWidget {
// //   final String title;
// //
// //   MyHomePage({required this.title});
// //
// //   void _incrementCounter(BuildContext context) {
// //     Provider.of<Counter>(context, listen: false).incrementCounter();
// //   }
// //
// //   void _minus(BuildContext context) {
// //     Provider.of<Counter>(context, listen: false).minus();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     var counter = Provider.of<Counter>(context).getCounter;
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(title),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             ElevatedButton(
// //                 onPressed: () => _incrementCounter(context),
// //                 child: Text("Press for +")),
// //             ElevatedButton(
// //                 onPressed: () => _minus(context), child: Text("Press for -")),
// //             Text(
// //               'You have pushed the button this many times:',
// //             ),
// //             Text(
// //               '$counter',
// //               style: Theme.of(context).textTheme.headline4,
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// void main() {
//   runApp(ChangeNotifierProvider(
//     create: (_) => Favorite(),
//     child: provider(),
//   ));
// }
//
// class provider extends StatefulWidget {
//   const provider({Key? key}) : super(key: key);
//
//   @override
//   State<provider> createState() => _providerState();
// }
//
// class _providerState extends State<provider> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: Text(
//               "My favorite food is " + Provider.of<Favorite>(context).fruit)),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Fruitbutton(fruit: 'Apples'),
//             Fruitbutton(fruit: 'Orange'),
//             Fruitbutton(fruit: 'Banana'),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class Fruitbutton extends StatelessWidget {
//   late final String fruit;
//
//   Fruitbutton({required this.fruit});
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(onPressed: () {
//       Provider.of<Favorite>(context,listen: false).changeFruit(fruit);
//     }, child: Text(fruit));
//   }
// }
//
// class Favorite extends ChangeNotifier {
//   String fruit = 'unknown';
//
//   void changeFruit(String newFruit) {
//     fruit = newFruit;
//     notifyListeners();
//   }
// }
