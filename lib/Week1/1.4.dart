import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(home: cycle()));
}

class cycle extends StatefulWidget {
  const cycle({Key? key}) : super(key: key);

  @override
  State<cycle> createState() => _cycleState();
}

class _cycleState extends State<cycle> with WidgetsBindingObserver {
  String abc = '';


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    print("InitState");
  }

  @override
  void deactivate() {
    print("Deactivate");
    super.deactivate();
  }

  @override
  void dispose() {
    print("Dispose");
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.inactive:
        print(' inactive');
        setState(() {
          abc += '\ninactive';
        });
        break;
        
      case AppLifecycleState.resumed:
        print(' resumed');
        setState(() {
          abc += '\nresumed';
        });
        break;
      case AppLifecycleState.paused:
        print(' paused');
        setState(() {
          abc += '\npaused';
        });
        break;
      case AppLifecycleState.detached:
        print(' detached');
        setState(() {
          abc += '\ndetached';
        });
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Cycle'),
      ),
      body: Center(

        child: Container(
          height: double.infinity,
          width: double.infinity,
        //  decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF9ccc65),Color(0xFFc5E1A5)]),),
           child: Text(abc,textAlign: TextAlign.center,),

        ),
      ),
    );
  }
}
