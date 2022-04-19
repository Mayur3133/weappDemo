// //
// // void main() {
// //   for (int i = 1; i < 5; i++) {
// //     for (int j = 1; j <= i; j++) {
// //       print('*');
// //     }
// //     print('');
// //   }
// //
// //
// //   var i = 1;
// //   while (i <= 5) {
// //     var j = 1;
// //     while (j <= 10) {
// //       print(i * j);
// //       print('  ');
// //       j++;
// //     }
// //     print('\n');
// //     i++;
// //   }
// //
// //   int k = 0;
// //   do {
// //     if (k % 2 == 0) {
// //       print(k);
// //     }
// //     k++;
// //   } while (k < 10);
// // }
// //
//
// //
// // import 'dart:io';
// //
// // void main() {
// //   var templist = [];
// //
// //   while (true) {
// //     list(templist) {
// //       print('enter value');
// //
// //       var vlu = num.parse(stdin.readLineSync()!);
// //       for (var i = 0; i < vlu; i++)
// //       {
// //         String? addlst = stdin.readLineSync();
// //
// //         templist.add(addlst);
// //       }
// //
// //       print(templist);
// //       return '';
// //     }
// //
// //
// //     sorting(templist) {
// //       if (templist.isEmpty) {
// //         print('Error............');
// //       } else {
// //         List sortlist = templist;
// //         templist = sortlist..sort();
// //         print('$templist');
// //         templist = List.from(sortlist.reversed);
// //         print(templist);
// //       }
// //       return '';
// //     }
// //
// //     user(templist) {
// //       print('  1> Creat List \n 2> Sorting ');
// //       dynamic choice = stdin.readLineSync();
// //       switch (choice) {
// //         case '1':
// //           return list(templist);
// //           break;
// //         case '2':
// //           return sorting(templist);
// //           break;
// //         default:
// //           return 'plz select valid number';
// //       }
// //     }
// //
// //     String choice = user(templist);
// //     print(choice);
// //   }
// // }
// import 'dart:io';
//
// void main() {
//   var templist = [];
//   print("enter value:");
//   var m = num.parse(stdin.readLineSync()!);
//
//   for (int k = 0; k < m; k++) {
//     var vlu = num.parse(stdin.readLineSync()!);
//     templist.add(vlu);
//   }
//   print(templist);
//
//     for (var i = 0; i < m; i++) {
//       for (var v = i + 1; v < m; v++) {
//         if (templist[i] > templist[v]) {
//           var tmp = templist[i];
//           templist[i] = templist[v];
//           templist[v] = tmp;
//         }
//       }
//     }
//   print(templist);
// }
