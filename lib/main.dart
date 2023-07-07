import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}



class MyHomePage extends StatelessWidget {
  int itemCount = 10; // Replace 10 with your actual item count
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildProfileRow(),
            SizedBox(height: 24.0),
            buildSectionHeader('History',itemCount),
            SizedBox(height: 16.0),
            buildHistoryListView(),
            SizedBox(height: 24.0),
            buildSectionHeaderWithAction('Keys',itemCount),
            SizedBox(height: 16.0),
            buildKeysGridView(context),
            SizedBox(height: 16.0),
            buildSectionHeader('Activity Logs',itemCount),
            SizedBox(height: 16.0),
            buildActivityLogsListView(),
          ],
        ),
      ),
    );
  }

  Widget buildProfileRow() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Image.network(
              'https://avatars.githubusercontent.com/u/84311059?v=4',
              width: 100.0,
              height: 100.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Baisalya',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildSectionHeader(String title,int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$title ($count)',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget buildSectionHeaderWithAction(String title,int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$title ($count)',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: () {
            // Perform action when "View All" is tapped
          },
          child: Text(
            'View All',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildHistoryListView() {
    final int itemCount = 5;

    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          return buildHistoryCard(index);
        },
      ),
    );
  }

  Widget buildHistoryCard(int index) {
    return Card(
      child: Container(
        width: 120.0,
        height: 120,
        margin: EdgeInsets.only(right: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                ListTile(
                  leading: Icon(Icons.airplanemode_inactive),
                  trailing: Icon(Icons.add_circle_outline),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text('Keys $index'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildKeysGridView(BuildContext context) {
    final int itemCount = 10;

    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          return buildKeyCard(index);
        },
      ),
    );
  }

  Widget buildKeyCard(int index) {
    return Card(
      child: Container(
        width: double.infinity,
        height: 120.0,
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.lock),
            Text('Key $index'),
          ],
        ),
      ),
    );
  }

  Widget buildActivityLogsListView() {
    final int itemCount = 8;

    return Expanded(
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          return buildActivityLogItem(index);
        },
      ),
    );
  }

  Widget buildActivityLogItem(int index) {
    return GestureDetector(
      onTap: () {
        // Perform action when list item is tapped
      },
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/84311059?v=4'),
          ),
          title: Text('User Name'),
          subtitle: Text('Time'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}




