// // void main() {
// //   for (int i = 1; i < 5; i++) {
// //     for (int j = 1; j <= i; j++) {
// //       print('*');
// //     }
// //     print('');
// //   }

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

// void main(){
//   int reminder, sum =0, temp;
//   int number = 54545;
//
//   temp = number;
//
//   // a loop to reverse a number
//   while(number>0)
//   {
//     reminder = number % 10;  //get remainder
//     sum = (sum*10)+reminder;
//     number = number~/10;
//   }
//
//   if(sum == temp)
//   {
//     print('Its A Palindrome number');
//
//   }else{
//     print('Its A Not Palindrome number');
//   }
//
//
//   // StringNumber();
// }

// import 'dart:io';
//
// void main()
// {
//    print(" \n Enter any four digit integer no.:");
//   var vlu = num.parse(stdin.readLineSync()!);
//
//   var ori = vlu as int;
//   vlu=(vlu%10*1000+vlu~/10%10*100+vlu~/10%10*10+vlu~/1000) as int;
//   if(ori==vlu)
//   {
//     print("\n no. Is palindrome");
//   }
//   else
//   {
//     print("\n no. Is not palindromes");
//   }
// }

// import 'dart:io';
//
// void main()
// {
//   int n,r,sum=0,temp;
//   print("enter the number=");
//   var vlu = num.parse(stdin.readLineSync()!);
//  // scanf("%d",&n);
//   temp=vlu as int;
//   while(vlu>0)
//   {
//     r=vlu%10 as int;
//     sum=(sum*10)+r;
//     vlu=(vlu/10) as double;
//   }
//   if(temp==sum)
//     print("palindrome number ");
//   else
//     print("not palindrome");
//   return ;
// }

/*  sorting  */

// import 'dart:io';
//
// void main() {
//   int i, v;
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
//   //print(templist);

//   templist.forEach((element) {
//     int abc = 0;
//     element.toString().split("").forEach((element) {
//       int s = int.parse(element);
//       abc = abc + s;
//     });
//     templist2.add(abc);
//   });
//   print(templist2);
//   for (var i = 0; i < templist.length; i++) {
//     for (var v = i + 1; v < templist.length; v++) {
//       if (templist2[i] < templist2[v]) {
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

/*  Palindrome number  */

// import 'dart:io';
//
//
// void main() {
//   print("Enter = ");
//   String? pal = stdin.readLineSync();
//
//   String? reverse = pal!.split('').reversed.join('');
//
//   if (pal == reverse) {
//     print('true');
//   } else {
//     print('false');
//   }
// }
//
//

//
// #include <stdio.h>
// int main()
// {
// int arr1[100], n,ctr=0;
// int i, j, k;
// printf("\n\nPrint all unique elements of an array:\n");
// printf("------------------------------------------\n");
// printf("Input the number of elements to be stored in the array: ");
// scanf("%d",&n);
// printf("Input %d elements in the array :\n",n);
// for(i=0;i<n;i++)
// {
// printf("element - %d : ",i);
// scanf("%d",&arr1[i]);
// }
// printf("\nThe unique elements found in the array are: \n");
// for(i=0; i<n; i++)
// {
// ctr=0;
// for(j=0,k=n; j<k+1; j++)
// {
// /*Increment the counter when the seaarch value is duplicate.*/
// if (i!=j)
// {
// if(arr1[i]==arr1[j])
// {
// ctr++;
// }
// }
// }
// if(ctr==0)
// {
// printf("%d ",arr1[i]);
// }
// }
// printf("\n\n");
// }

import 'dart:io';

void main() {
  var templist = [];
  var oddnumber;
  var evennumber;
  int even = 0;
  int odd = 0;

  print("enter value:");
  var m = num.parse(stdin.readLineSync()!);

  for (int k = 0; k < m; k++) {
    var vlu = num.parse(stdin.readLineSync()!);
    templist.add(vlu);
  }
  print(templist);

  for (int i = 0; i < templist.length; i++) {
    if (templist[i] % 2 == 0) {
      even++;
      evennumber = templist[i];
    }
    if (templist[i] % 2 == 1) {
      odd++;
      oddnumber = templist[i];
    }
  }

  if (odd == 1 && even == 1) {
    print('enter more then 2 numbers');
  }
  else if (even == 1) {
    print(evennumber);
  } else if (odd == 1) {
    print(oddnumber);
  } else {
    print("No value");
  }
}
