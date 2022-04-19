import 'package:flutter/material.dart';
import 'package:fluttertask/Week2/2.5.searchbar.dart';

class wgt extends StatefulWidget {
  const wgt({Key? key}) : super(key: key);

  @override
  State<wgt> createState() => _wgtState();
}

class _wgtState extends State<wgt> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 15,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Widgets'),
            bottom: TabBar(
              indicator: BoxDecoration(borderRadius: BorderRadius.circular(20)),
              isScrollable: true,
              tabs: [
                Tab(
                    icon: Icon(Icons.add_to_photos_rounded, size: 25),
                    text: "Container"),
                Tab(icon: Icon(Icons.card_membership, size: 25), text: "Card"),
                Tab(icon: Icon(Icons.view_column, size: 25), text: "Column"),
                Tab(icon: Icon(Icons.raw_off_outlined, size: 25), text: "Raw"),
                Tab(icon: Icon(Icons.image, size: 25), text: "Image"),
                Tab(icon: Icon(Icons.list, size: 25), text: "ListView"),
                Tab(
                    icon: Icon(Icons.arrow_drop_down_circle_outlined, size: 25),
                    text: "Dropdownmenu"),
                Tab(
                    icon: Icon(Icons.border_bottom_sharp, size: 25),
                    text: "BottomNavigation"),
                Tab(icon: Icon(Icons.grid_3x3, size: 25), text: "Gridview"),
                Tab(
                    icon: Icon(Icons.add_alert, size: 25),
                    text: "AlertDialogbox"),
                Tab(icon: Icon(Icons.stacked_bar_chart, size: 25), text: "Stack"),
                Tab(icon: Icon(Icons.radio_button_checked, size: 25), text: "RadioButton"),
                Tab(icon: Icon(Icons.timelapse, size: 25), text: "TimePicker"),
                Tab(icon: Icon(Icons.date_range, size: 25), text: "DatePicker"),
                Tab(icon: Icon(Icons.check_box, size: 25), text: "CheckBox"),
          //      Tab(icon: Icon(Icons.search, size: 25), text: "Searchbar"),
              ],
            ),
          ),
          body: TabBarView(children: [
            fst(),
            scd(),
            thd(),
            fr(),
            fv(),
            sx(),
            svn(),
            egt(),
            nn(),
            tn(),
            elv(),
            twl(),
            time(),
            date(),
            chkbox(),
       //     srch(),
          ]),
        ));
  }
}


