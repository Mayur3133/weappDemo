// // import 'dart:async';
// // import 'dart:io';
// //
// // import 'package:flutter/material.dart';
// // import 'package:path_provider/path_provider.dart';
// //
// // class FlutterDemo extends StatefulWidget {
// //   const FlutterDemo({Key? key, required this.storage});
// //
// //   final CounterStorage storage;
// //
// //   @override
// //   _FlutterDemoState createState() => _FlutterDemoState();
// // }
// //
// // class _FlutterDemoState extends State<FlutterDemo> {
// //   int _counter = 0;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     widget.storage.readCounter().then((value) {
// //       setState(() {
// //         _counter = value;
// //       });
// //     });
// //   }
// //
// //   Future<File> _incrementCounter() {
// //     setState(() {
// //       _counter++;
// //     });
// //
// //     // Write the variable as a string to the file.
// //     return widget.storage.writeCounter(_counter);
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Reading and Writing Files'),
// //       ),
// //       body: Center(
// //         child: Text(
// //           ' Button tapped $_counter time${_counter == 1 ? '' : 's'}.',
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: _incrementCounter,
// //         tooltip: 'Increment',
// //         child: const Icon(Icons.add),
// //       ),
// //     );
// //   }
// // }
// //
// // class CounterStorage {
// //   Future<String> get _localPath async {
// //     final directory = await getApplicationDocumentsDirectory();
// //
// //     return directory.path;
// //   }
// //
// //   Future<File> get _localFile async {
// //     final path = await _localPath;
// //     return File('$path/counter.txt');
// //   }
// //
// //   Future<int> readCounter() async {
// //     try {
// //       final file = await _localFile;
// //
// //       // Read the file
// //       final contents = await file.readAsString();
// //
// //       return int.parse(contents);
// //     } catch (e) {
// //       // If encountering an error, return 0
// //       return 0;
// //     }
// //   }
// //
// //   Future<File> writeCounter(int counter) async {
// //     final file = await _localFile;
// //
// //     // Write the file
// //     return file.writeAsString('$counter');
// //   }
// // }
//
// import 'dart:developer';
// import 'dart:io';
// import 'dart:typed_data';
//
// import 'package:file_picker/file_picker.dart';
// import 'package:file_saver/file_saver.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:syncfusion_flutter_xlsio/xlsio.dart' as x;
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   TextEditingController textEditingController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('File Saver'),
//       ),
//       body: Column(
//         children: [
//           Center(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: textEditingController,
//                 decoration: const InputDecoration(
//                     labelText: "Name",
//                     hintText: "Something",
//                     border: OutlineInputBorder()),
//               ),
//             ),
//           ),
//           ElevatedButton(
//               onPressed: () async {
//                 if (!kIsWeb) {
//                   if (Platform.isIOS ||
//                       Platform.isAndroid ||
//                       Platform.isMacOS) {
//                     bool status = await Permission.storage.isGranted;
//
//                     if (!status) await Permission.storage.request();
//                   }
//                 }
//                 final x.Workbook workbook = x.Workbook();
//                 final x.Worksheet excel =
//                     workbook.worksheets.addWithName('Sheet1');
//                 excel.insertColumn(1, 3);
//                 for (int i = 1; i < 10; i++) {
//                   excel.insertRow(i);
//                 }
//                 List<int> sheets = workbook.saveAsStream();
//
//                 workbook.dispose();
//                 Uint8List data = Uint8List.fromList(sheets);
//                 MimeType type = MimeType.MICROSOFTEXCEL;
//                 String path = await FileSaver.instance.saveFile(
//                     textEditingController.text == ""
//                         ? "File"
//                         : textEditingController.text,
//                     data,
//                     "xlsx",
//                     mimeType: type);
//                 print(path);
//                 log(path);
//               },
//               child: const Text("Save File")),
//           if (!kIsWeb)
//             if (Platform.isAndroid || Platform.isIOS || Platform.isMacOS)
//               ElevatedButton(
//                 onPressed: () async {
//                   final x.Workbook workbook = x.Workbook();
//                   final x.Worksheet excel =
//                       workbook.worksheets.addWithName('Sheet1');
//                   excel.insertColumn(1, 3);
//                   for (int i = 1; i < 10; i++) {
//                     excel.insertRow(i);
//                   }
//                   List<int> sheets = workbook.saveAsStream();
//                   workbook.dispose();
//                   Uint8List data = Uint8List.fromList(sheets);
//                   MimeType type = MimeType.MICROSOFTEXCEL;
//                   String path = await FileSaver.instance.saveAs(
//                       textEditingController.text == ""
//                           ? "File"
//                           : textEditingController.text,
//                       data,
//                       "custome123",
//                       type);
//                   log(path);
//                 },
//                 child: const Text("Generate Excel and Open Save As Dialog"),
//               ),
//           ElevatedButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(
//                   builder: (context) {
//                     return FilePickerDemo();
//                   },
//                 ));
//               },
//               child: Text("get"))
//         ],
//       ),
//     );
//   }
// }
//
// class FilePickerDemo extends StatefulWidget {
//   @override
//   _FilePickerDemoState createState() => _FilePickerDemoState();
// }
//
// class _FilePickerDemoState extends State<FilePickerDemo> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
//   String? _fileName;
//   String? _saveAsFileName;
//   List<PlatformFile>? _paths;
//   String? _directoryPath;
//   String? _extension;
//   bool _isLoading = false;
//   bool _userAborted = false;
//   bool _multiPick = false;
//   FileType _pickingType = FileType.any;
//   TextEditingController _controller = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     _controller.addListener(() => _extension = _controller.text);
//   }
//
//   void _pickFiles() async {
//     _resetState();
//     try {
//       _directoryPath = null;
//       _paths = (await FilePicker.platform.pickFiles(
//         type: _pickingType,
//         allowMultiple: _multiPick,
//         onFileLoading: (FilePickerStatus status) => print(status),
//         allowedExtensions: (_extension?.isNotEmpty ?? false)
//             ? _extension?.replaceAll(' ', '').split(',')
//             : null,
//       ))
//           ?.files;
//     } on PlatformException catch (e) {
//       _logException('Unsupported operation' + e.toString());
//     } catch (e) {
//       _logException(e.toString());
//     }
//     if (!mounted) return;
//     setState(() {
//       _isLoading = false;
//       _fileName =
//           _paths != null ? _paths!.map((e) => e.name).toString() : '...';
//       _userAborted = _paths == null;
//     });
//   }
//
//   void _clearCachedFiles() async {
//     _resetState();
//     try {
//       bool? result = await FilePicker.platform.clearTemporaryFiles();
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           backgroundColor: result! ? Colors.green : Colors.red,
//           content: Text((result
//               ? 'Temporary files removed with success.'
//               : 'Failed to clean temporary files')),
//         ),
//       );
//     } on PlatformException catch (e) {
//       _logException('Unsupported operation' + e.toString());
//     } catch (e) {
//       _logException(e.toString());
//     } finally {
//       setState(() => _isLoading = false);
//     }
//   }
//
//   void _selectFolder() async {
//     _resetState();
//     try {
//       String? path = await FilePicker.platform.getDirectoryPath();
//       setState(() {
//         _directoryPath = path;
//         _userAborted = path == null;
//       });
//     } on PlatformException catch (e) {
//       _logException('Unsupported operation' + e.toString());
//     } catch (e) {
//       _logException(e.toString());
//     } finally {
//       setState(() => _isLoading = false);
//     }
//   }
//
//   Future<void> _saveFile() async {
//     _resetState();
//     try {
//       String? fileName = await FilePicker.platform.saveFile(
//         allowedExtensions: (_extension?.isNotEmpty ?? false)
//             ? _extension?.replaceAll(' ', '').split(',')
//             : null,
//         type: _pickingType,
//       );
//       setState(() {
//         _saveAsFileName = fileName;
//         _userAborted = fileName == null;
//       });
//     } on PlatformException catch (e) {
//       _logException('Unsupported operation' + e.toString());
//     } catch (e) {
//       _logException(e.toString());
//     } finally {
//       setState(() => _isLoading = false);
//     }
//   }
//
//   void _logException(String message) {
//     print(message);
//     _scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
//     _scaffoldMessengerKey.currentState?.showSnackBar(
//       SnackBar(
//         content: Text(message),
//       ),
//     );
//   }
//
//   void _resetState() {
//     if (!mounted) {
//       return;
//     }
//     setState(() {
//       _isLoading = true;
//       _directoryPath = null;
//       _fileName = null;
//       _paths = null;
//       _saveAsFileName = null;
//       _userAborted = false;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       scaffoldMessengerKey: _scaffoldMessengerKey,
//       home: Scaffold(
//         key: _scaffoldKey,
//         appBar: AppBar(
//           title: const Text('File Picker example app'),
//         ),
//         body: Center(
//           child: Padding(
//             padding: const EdgeInsets.only(left: 10.0, right: 10.0),
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.only(top: 20.0),
//                     child: DropdownButton<FileType>(
//                         hint: const Text('LOAD PATH FROM'),
//                         value: _pickingType,
//                         items: FileType.values
//                             .map((fileType) => DropdownMenuItem<FileType>(
//                                   child: Text(fileType.toString()),
//                                   value: fileType,
//                                 ))
//                             .toList(),
//                         onChanged: (value) => setState(() {
//                               _pickingType = value!;
//                               if (_pickingType != FileType.custom) {
//                                 _controller.text = _extension = '';
//                               }
//                             })),
//                   ),
//                   ConstrainedBox(
//                     constraints: const BoxConstraints.tightFor(width: 100.0),
//                     child: _pickingType == FileType.custom
//                         ? TextFormField(
//                             maxLength: 15,
//                             autovalidateMode: AutovalidateMode.always,
//                             controller: _controller,
//                             decoration: InputDecoration(
//                               labelText: 'File extension',
//                             ),
//                             keyboardType: TextInputType.text,
//                             textCapitalization: TextCapitalization.none,
//                           )
//                         : const SizedBox(),
//                   ),
//                   ConstrainedBox(
//                     constraints: const BoxConstraints.tightFor(width: 200.0),
//                     child: SwitchListTile.adaptive(
//                       title: Text(
//                         'Pick multiple files',
//                         textAlign: TextAlign.right,
//                       ),
//                       onChanged: (bool value) =>
//                           setState(() => _multiPick = value),
//                       value: _multiPick,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
//                     child: Column(
//                       children: <Widget>[
//                         ElevatedButton(
//                           onPressed: () => _pickFiles(),
//                           child: Text(_multiPick ? 'Pick files' : 'Pick file'),
//                         ),
//                         SizedBox(height: 10),
//                         ElevatedButton(
//                           onPressed: () => _selectFolder(),
//                           child: const Text('Pick folder'),
//                         ),
//                         SizedBox(height: 10),
//                         ElevatedButton(
//                           onPressed: () => _saveFile(),
//                           child: const Text('Save file'),
//                         ),
//                         SizedBox(height: 10),
//                         ElevatedButton(
//                           onPressed: () => _clearCachedFiles(),
//                           child: const Text('Clear temporary files'),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Builder(
//                     builder: (BuildContext context) => _isLoading
//                         ? Padding(
//                             padding: const EdgeInsets.only(bottom: 10.0),
//                             child: const CircularProgressIndicator(),
//                           )
//                         : _userAborted
//                             ? Padding(
//                                 padding: const EdgeInsets.only(bottom: 10.0),
//                                 child: const Text(
//                                   'User has aborted the dialog',
//                                 ),
//                               )
//                             : _directoryPath != null
//                                 ? ListTile(
//                                     title: const Text('Directory path'),
//                                     subtitle: Text(_directoryPath!),
//                                   )
//                                 : _paths != null
//                                     ? Container(
//                                         padding:
//                                             const EdgeInsets.only(bottom: 30.0),
//                                         height:
//                                             MediaQuery.of(context).size.height *
//                                                 0.50,
//                                         child: Scrollbar(
//                                             child: ListView.separated(
//                                           itemCount: _paths != null &&
//                                                   _paths!.isNotEmpty
//                                               ? _paths!.length
//                                               : 1,
//                                           itemBuilder: (BuildContext context,
//                                               int index) {
//                                             final bool isMultiPath =
//                                                 _paths != null &&
//                                                     _paths!.isNotEmpty;
//                                             final String name =
//                                                 'File $index: ' +
//                                                     (isMultiPath
//                                                         ? _paths!
//                                                             .map((e) => e.name)
//                                                             .toList()[index]
//                                                         : _fileName ?? '...');
//                                             final path = kIsWeb
//                                                 ? null
//                                                 : _paths!
//                                                     .map((e) => e.path)
//                                                     .toList()[index]
//                                                     .toString();
//
//                                             return ListTile(
//                                               title: Text(
//                                                 name,
//                                               ),
//                                               subtitle: Text(path ?? ''),
//                                             );
//                                           },
//                                           separatorBuilder:
//                                               (BuildContext context,
//                                                       int index) =>
//                                                   const Divider(),
//                                         )),
//                                       )
//                                     : _saveAsFileName != null
//                                         ? ListTile(
//                                             title: const Text('Save file'),
//                                             subtitle: Text(_saveAsFileName!),
//                                           )
//                                         : const SizedBox(),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // import 'dart:io';
// // import 'dart:async';
// //
// // import 'package:path_provider/path_provider.dart';
// //
// // import 'package:flutter/material.dart';
// // import 'package:flutter/foundation.dart';
// //
// //
// // class Home extends StatefulWidget {
// //   final Storage storage;
// //
// //   Home({Key? key, required this.storage}) : super(key: key);
// //
// //   @override
// //   HomeState createState() => HomeState();
// // }
// //
// // class HomeState extends State<Home> {
// //   TextEditingController controller = TextEditingController();
// //   String? state;
// //   late Future<Directory> _appDocDir;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     widget.storage.readData().then((String value) {
// //       Storage();
// //       setState(() {
// //         state = value;
// //       });
// //     });
// //   }
// //
// //   Future<File> writeData() async {
// //     setState(() {
// //       state = controller.text;
// //       controller.text = '';
// //     });
// //
// //     return widget.storage.writeData(state!);
// //   }
// //
// //   void getAppDirectory() {
// //     setState(() {
// //       _appDocDir = getApplicationDocumentsDirectory();
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Reading and Writing Files'),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //           children: <Widget>[
// //             Text('${state ?? "File is Empty"}'),
// //             TextField(
// //               controller: controller,
// //             ),
// //             RaisedButton(
// //               onPressed: writeData,
// //               child: Text('Write to File'),
// //             ),
// //             RaisedButton(
// //               child: Text("Get DIR path"),
// //               onPressed: getAppDirectory,
// //             ),
// //             FutureBuilder<Directory>(
// //               future: _appDocDir,
// //               builder:
// //                   (BuildContext context, AsyncSnapshot<Directory> snapshot) {
// //                 Text text = Text('');
// //                 if (snapshot.connectionState == ConnectionState.done) {
// //                   if (snapshot.hasError) {
// //                     text = Text('Error: ${snapshot.error}');
// //                   } else if (snapshot.hasData) {
// //                     text = Text('Path: ${snapshot.data!.path}');
// //                   } else {
// //                     text = Text('Unavailable');
// //                   }
// //                 }
// //                 return new Container(
// //                   child: text,
// //                 );
// //               },
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class Storage {
// //   Future<String> get localPath async {
// //     final dir = await getApplicationDocumentsDirectory();
// //     return dir.path;
// //   }
// //
// //   Future<File> get localFile async {
// //     final path = await localPath;
// //     return File('$path/db.txt');
// //   }
// //
// //   Future<String> readData() async {
// //     try {
// //       final file = await localFile;
// //       String body = await file.readAsString();
// //
// //       return body;
// //     } catch (e) {
// //       return e.toString();
// //     }
// //   }
// //
// //   Future<File> writeData(String data) async {
// //     final file = await localFile;
// //     return file.writeAsString("$data");
// //   }
// // }

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'list.dart';

class FileOperationsScreen extends StatefulWidget {
  FileOperationsScreen() : super();

  @override
  _FileOperationsScreenState createState() => _FileOperationsScreenState();
}

class _FileOperationsScreenState extends State<FileOperationsScreen> {
  String fileContents = "No Data";
  final name_controller = TextEditingController();
  final msg_controller = TextEditingController();
  var  _scaffold_key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffold_key,
      appBar: AppBar(
        title: Text(
          "Save & Get File",
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: "File Name"),
              controller: name_controller,
            ),
            SizedBox(height: 10,),
            TextField(maxLines: 5,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: "data"),
              controller: msg_controller,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  if (name_controller.text.length <= 0) {
                    _scaffold_key.currentState!.showSnackBar(
                        SnackBar(content: Text("Please Enter File name")));
                    return;
                  }
                  if (msg_controller.text.length <= 10) {
                    _scaffold_key.currentState!.showSnackBar(
                        SnackBar(content: Text("Please Enter File Data")));
                    return;
                  }
                  FileUtils.saveToFile(
                          "${name_controller.text}.txt", msg_controller.text)
                      .then(
                    (value) => {
                      FileUtils.getFiles().then(
                        (value) => {
                          setState(
                            () {
                              listFiles = value;
                            },
                          )
                        },
                      )
                    },
                  );
                  name_controller.clear();
                  msg_controller.clear();
                },
                child: Text("Save File")),
            // RaisedButton(
            //   child: Text(
            //     "Save File",
            //   ),
            //   onPressed: () {
            //     if (name_controller.text.length <= 0) {
            //       _scaffold_key.currentState!.showSnackBar(
            //           SnackBar(content: Text("Please Enter File name")));
            //       return;
            //     }
            //     if (msg_controller.text.length <= 10) {
            //       _scaffold_key.currentState!.showSnackBar(
            //           SnackBar(content: Text("Please Enter File Data")));
            //       return;
            //     }
            //     FileUtils.saveToFile(
            //             "${name_controller.text}.txt", msg_controller.text)
            //         .then(
            //       (value) => {
            //         FileUtils.getFiles().then(
            //           (value) => {
            //             setState(
            //               () {
            //                 listFiles = value;
            //               },
            //             )
            //           },
            //         )
            //       },
            //     );
            //   },
            // ),


            // Expanded(
            //   child: ListView.builder(
            //     shrinkWrap: true,
            //     itemCount: listFiles.length,
            //     itemBuilder: (context, index) {
            //       String dt = '';
            //       String path = listFiles[index].path;
            //       String file_name = path.substring(path.lastIndexOf("/") + 1);
            //       FileUtils.readFromFile(file_name).then(
            //         (contents) {
            //           setState(() {
            //             dt = contents;
            //           });
            //         },
            //       );
            //       return Card(
            //         elevation: 0,
            //         margin: EdgeInsets.all(10),
            //         child: ListTile(
            //           title: Text(file_name),
            //           onTap: () {
            //             FileUtils.readFromFile(file_name).then(
            //               (contents) {
            //                 _scaffold_key.currentState!.showBottomSheet(
            //                   (context) {
            //                     return Container(
            //                       decoration: BoxDecoration(
            //                           color: Color(0xEE1C1B1B),
            //                           borderRadius: BorderRadius.only(
            //                               topLeft: Radius.circular(30),
            //                               topRight: Radius.circular(30))),
            //                       height: 250,
            //                       width: MediaQuery.of(context).size.width,
            //                       child: Padding(
            //                         padding: const EdgeInsets.only(
            //                             top: 20, left: 20, right: 20),
            //                         child: SingleChildScrollView(
            //                           child: Column(
            //                             children: [
            //                               Text(
            //                                 contents,
            //                                 textAlign: TextAlign.justify,
            //                                 style: TextStyle(
            //                                   color: Colors.white60,
            //                                   fontSize: 18,
            //                                 ),
            //                               ),
            //                             ],
            //                           ),
            //                         ),
            //                       ),
            //                     );
            //                   },
            //                 );
            //               },
            //             );
            //           },
            //         ),
            //       );
            //     },
            //   ),
            // ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return lst();
                    },
                  ));
                },
                child: Text("View"))
          ],
        ),
      ),
    );
  }
}

class FileUtils {
  static String folderName = "MyFiles";

  static Future<String> get getFilePath async {
    final directory = await getExternalStorageDirectory();
    final Directory _appDocDirFolder =
        Directory('${directory!.path}/${folderName}/');

    if (await _appDocDirFolder.exists()) {
      //if folder already exists return path
      return _appDocDirFolder.path;
    } else {
      //if folder not exists create folder and then return its path
      final Directory _appDocDirNewFolder =
          await _appDocDirFolder.create(recursive: true);
      return _appDocDirNewFolder.path;
    }
  }

  static Future<List> getFiles() async {
    final directory = await getExternalStorageDirectory();
    final Directory _appDocDirFolder =
        Directory('${directory!.path}/${folderName}/');
    print(_appDocDirFolder);

    if (await _appDocDirFolder.exists()) {
      //if folder already exists return path
      return _appDocDirFolder.listSync();
    }
    return List.empty(growable: true);
  }

  static Future<File> getFile(String name) async {
    final path = await getFilePath;

    return File('$path/$name');
  }

  static Future<File> saveToFile(String name, data) async {
    print(name);
    final file = await getFile(name);
    return file.writeAsString(data);
  }

  static Future<String> readFromFile(name) async {
    try {
      final file = await getFile(name);
      String fileContents = await file.readAsString();
      return fileContents;
    } catch (e) {
      return "";
    }
  }

  static Future<String> createFolderInAppDocDir(String folderName) async {
    //Get this App Document Directory
    final Directory? _appDocDir = await getExternalStorageDirectory();
    //App Document Directory + folder name
    final Directory _appDocDirFolder =
        Directory('${_appDocDir!.path}/$folderName/');

    if (await _appDocDirFolder.exists()) {
      //if folder already exists return path
      return _appDocDirFolder.path;
    } else {
      //if folder not exists create folder and then return its path
      final Directory _appDocDirNewFolder =
          await _appDocDirFolder.create(recursive: true);
      return _appDocDirNewFolder.path;
    }
  }
}
