//https://flutter.github.io/samples/animations.html

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'animatedposition.dart';
import 'animation.dart';
import 'animimg.dart';
import 'logo.dart';

double windowWidth = 480;
double windowHeight = 854;

class Demo {
  final String name;
  final String route;
  final WidgetBuilder builder;

  Demo({
    required this.name,
    required this.route,
    required this.builder,
  });
}

//
// final miscDemos = [
//
//   Demo(
//       name: 'slid container',
//       route: anim.routeName,
//       builder: (context) =>  anim()),
//   Demo(
//       name: 'Carousel',
//       route: CarouselDemo.routeName,
//       builder: (context) => CarouselDemo()),
//   Demo(
//       name: 'AnimatedPositioned',
//       route: AnimatedPositionedDemo.routeName,
//       builder: (context) =>  AnimatedPositionedDemo()),
//   // Demo(
//   //     name: 'Focus Image',
//   //     route: FocusImageDemo.routeName,
//   //     builder: (context) => const FocusImageDemo()),
//   // Demo(
//   //     name: 'Card Swipe',
//   //     route: CardSwipeDemo.routeName,
//   //     builder: (context) => const CardSwipeDemo()),
//   // Demo(
//   //     name: 'Repeating Animation',
//   //     route: RepeatingAnimationDemo.routeName,
//   //     builder: (context) => const RepeatingAnimationDemo()),
//   // Demo(
//   //     name: 'Spring Physics',
//   //     route: PhysicsCardDragDemo.routeName,
//   //     builder: (context) => const PhysicsCardDragDemo()),
//   // Demo(
//   //     name: 'AnimatedList',
//   //     route: AnimatedListDemo.routeName,
//   //     builder: (context) => const AnimatedListDemo()),
//
//   // Demo(
//   //     name: 'AnimatedSwitcher',
//   //     route: AnimatedSwitcherDemo.routeName,
//   //     builder: (context) => const AnimatedSwitcherDemo()),
//   Demo(
//       name: 'Hero Animation',
//       route: HeroAnimationDemo.routeName,
//       builder: (context) =>  HeroAnimationDemo()),
//   // Demo(
//   //     name: 'Curved Animation',
//   //     route: CurvedAnimationDemo.routeName,
//   //     builder: (context) => const CurvedAnimationDemo()),
// ];

// final basicDemoRoutes =
// Map.fromEntries(basicDemos.map((d) => MapEntry(d.route, d.builder)));

// final miscDemoRoutes =
// Map.fromEntries(miscDemos.map((d) => MapEntry(d.route, d.builder)));
//
// final allRoutes = <String, WidgetBuilder>{
//   // ...basicDemoRoutes,
//   ...miscDemoRoutes,
// };

// class AnimationSamples extends StatelessWidget {
//   const AnimationSamples({Key? key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Animation Samples',
//       routes: allRoutes,
//       home:  HomePage(),
//     );
//   }
// }

class animhome extends StatelessWidget {
  const animhome({Key? key});

  @override
  Widget build(BuildContext context) {
    final headerStyle = Theme.of(context).textTheme.headline6;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Samples'),
      ),
      body: ListView(
        children: [
          // ListTile(title: Text('Basics', style: headerStyle)),
          // ...basicDemos.map((d) => DemoTile(demo: d)),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return anim();
                },
              ));
            },
            title: Text("slidecontainer"),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return CarouselDemo();
                },
              ));
            },
            title: Text("Carousel"),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return HeroAnimationDemo();
                },
              ));
            },
            title: Text("nimatedPositionedDemo"),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return AnimatedPositionedDemo();
                },
              ));
            },
            title: Text("HeroAnimation"),
          ),

          // ...miscDemos.map((d) => DemoTile(demo: d)),
        ],
      ),
    );
  }
}

// class DemoTile extends StatelessWidget {
//   final Demo demo;
//
//   const DemoTile({required this.demo, Key? key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(demo.name),
//       onTap: () {
//         Navigator.pushNamed(context, demo.route);
//       },
//     );
//   }
// }
