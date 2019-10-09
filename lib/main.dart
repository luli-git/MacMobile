import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(Bookkeeper());

class Bookkeeper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF3F5AA6),
            title: Text("Macalester", style: TextStyle(fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Sans Serif'),), centerTitle: true,
          ),
          bottomNavigationBar: menu(),
          body: TabBarView(
            children: [
              Container(child: Icon(Icons.fastfood)),
              Container(child: Icon(Icons.schedule)),
              Container(child: Icon(Icons.home)),
              Container(child: ListView.builder(
                itemBuilder: (BuildContext context, int index) =>
                    EntryItem(data[index]),
                itemCount: data.length,
              ),),
              Container(child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: Container(child: ConstrainedBox(
                    constraints: BoxConstraints.expand(), child: Ink.image(
                    image: AssetImage('assets/images/1600.png'),
                    fit: BoxFit.fill,
                    child: InkWell(onTap: _launchURL1600,),),),),),
                  Expanded(child: Container(child: ConstrainedBox(
                    constraints: BoxConstraints.expand(), child: Ink.image(
                    image: AssetImage('assets/images/moodle.png'),
                    fit: BoxFit.fill,
                    child: InkWell(onTap: _launchURLmoodle,),),),),),
                  Expanded(child: Container(child: ConstrainedBox(
                    constraints: BoxConstraints.expand(), child: Ink.image(
                    image: AssetImage('assets/images/class.png'),
                    fit: BoxFit.fill,
                    child: InkWell(onTap: _launchURLclass,),),),),),
                  Expanded(child: Container(child: ConstrainedBox(
                    constraints: BoxConstraints.expand(), child: Ink.image(
                    image: AssetImage('assets/images/academic.png'),
                    fit: BoxFit.fill,
                    child: InkWell(onTap: _launchURLacademic,),),),),),
//                  Image.asset('assets/images/1600.png'),
//                  Image.asset('assets/images/moodle.png'),
//                  Image.asset('assets/images/class.png'),
//                  Image.asset('assets/images/academic.png'),
                ],
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

  Widget menu() {
    return Container(
      color: Color(0xFF3F5AA6),
      child: TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Colors.blue,
        tabs: [
          Tab(
            text: "Dining",
            icon: Icon(Icons.fastfood),
          ),
          Tab(
            text: "Hours",
            icon: Icon(Icons.schedule),
          ),
          Tab(
            text: "Home",
            icon: Icon(Icons.home),
          ),
          Tab(
            text: "Events",
            icon: Icon(Icons.event),
          ),
          Tab(
            text: "Academic",
            icon: Icon(Icons.school),
          ),
        ],
      ),
    );
  }

  _launchURLmoodle() async {
    const url = 'https://moodle.macalester.edu';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURL1600() async {
    const url = 'https://1600grand.macalester.edu';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLacademic() async {
    const url = 'https://www.macalester.edu/registrar/academiccalendars/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLclass() async {
    const url = 'https://www.macalester.edu/registrar/schedules/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

// One entry in the multilevel list displayed by this app. https://flutter.dev/docs/catalog/samples/expansion-tile-sample
class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry(
    'Sporting Events',
    <Entry>[
      Entry(
        'Section A0',
        <Entry>[
          Entry('Item A0.1'),
          Entry('Item A0.2'),
          Entry('Item A0.3'),
        ],
      ),
      Entry('Section A1'),
      Entry('Section A2'),
    ],
  ),
  Entry(
    'Academic Events',
    <Entry>[
      Entry('Section B0'),
      Entry('Section B1'),
    ],
  ),
  Entry(
    'Student Org Events',
    <Entry>[
      Entry('Section C0'),
      Entry('Section C1'),
      Entry(
        'Section C2',
        <Entry>[
          Entry('Item C2.0'),
          Entry('Item C2.1'),
          Entry('Item C2.2'),
          Entry('Item C2.3'),
        ],
      ),
    ],
  ),
  Entry(
    'Art Events',
      <Entry>[
        Entry('Concert'),
    ]
  ),
  Entry (
    'Other',
  <Entry>[
    Entry('Kagin'),
    ]
  )
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}









