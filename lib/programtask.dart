// import 'dart:math';
//
// void main() {
//   List<int> array = [10, 12, 63, 23, 40, 19, 85, 17, 88];
//   List<int> b = [];
//   int temp = 0;
//   int temp2 = 0;
//
//   array.forEach((element) {
//     int sum = 0;
//     element.toString().split("").forEach((element) {
//       int a = int.parse(element);
//       sum = sum + a;
//     });
//     b.add(sum);
//   });
//   print(b);
//
//   for (int i = 0; i < array.length; i++) {
//     for (int j = i + 1; j < array.length; j++) {
//       if (b[i] > b[j]) {
//         temp = b[i];
//         b[i] = b[j];
//         b[j] = temp;
//
//         temp2 = array[i];
//         array[i] = array[j];
//         array[j] = temp2;
//       }
//     }
//   }
//   print(b);
//   print(array);
// }



//
// import 'dart:io';
//
// void main() {
//   int temp = 0;
//   int temp2 = 0;
//
//   var templist = [];
//   var templist2 = [];
//
//   print("enter value:");
//   var m = num.parse(stdin.readLineSync()!);
//
//   for (int k = 0; k < m; k++) {
//     var vlu = num.parse(stdin.readLineSync()!);
//     templist.add(vlu);
//   }
//
//   templist.forEach((element) {
//     int abc = 0;
//     element.toString().split("").forEach((element) {
//       int s = int.parse(element);
//       abc = abc + s;
//     });
//     templist2.add(abc);
//   });
//   print(templist2);
//
//   for (var i = 0; i < templist.length; i++) {
//     for (var v = i + 1; v < templist.length; v++) {
//       if (templist2[i] > templist2[v]) {
//         temp = templist2[i];
//         templist2[i] = templist2[v];
//         templist2[v] = temp;
//
//         temp2 = templist[i];
//         templist[i] = templist[v];
//         templist[v] = temp2;
//       }
//     }
//   }
//   print(templist2);
//   print(templist);
// }

//
// import 'dart:io';
//
// void main()
// {
//   int arra1; int ctr=0;
//
//   print("Enter value \n");
//   print("-------------- \n");
//   print("Input the number of elements to be stored in the array: ");
//   var m = num.parse(stdin.readLineSync()!);
//   print("Input %d elements in the array :\n",m);
//
//   for( int i=0;i<m;i++)
//  {
//   print("element - %d : ",i);
//   var a = num.parse(stdin.readLineSync()!);
//
//  }
//
// }
//



void main(){
  int x=10,y=20;
  x=x+y;
  y=x-y;
  x=x-y;
  print(" x=$x \n y=$y");
}





















