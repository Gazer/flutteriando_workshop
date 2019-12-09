import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHome(),
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == '/details') {
          Color color = settings.arguments;

          return MaterialPageRoute(builder: (_) {
            return SecondPage(color: color);
          });
        }

        return null;
      },
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          RotatedBox(
            quarterTurns: 2,
            child: Icon(
              Icons.sort,
              color: Colors.blueGrey,
            ),
          ),
        ],
        backgroundColor: Colors.grey.withOpacity(0.2),
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: SafeArea(
          child: ListView.separated(
            itemCount: 10000,
            itemBuilder: (context, idx) {
              return ListTile(
                leading: Icon(Icons.add),
                title: Text("Item $idx"),
                subtitle: Text("$idx"),
              );
            },
            separatorBuilder: (context, idx) {
              return Container(
                height: 3,
                color: Colors.red,
              );
            },
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            flex: 2,
            child: _bloque1(context),
          ),
          Flexible(
            flex: 1,
            child: _bloque2(),
          ),
          Flexible(
            flex: 3,
            child: _bloque3(),
          ),
          Flexible(
            flex: 3,
            child: _bloque4(context),
          ),
        ],
      ),
    );
  }

  Widget _bloque1(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.2),
      padding: EdgeInsets.all(32.0),
      child: Container(
        padding: EdgeInsets.all(32.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Colors.white,
        ),
        child: Row(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: Colors.white,
                ),
                child: Placeholder(),
              ),
            ),
            SizedBox(
              width: 32.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Ricardo Markiewicz",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Flutter Wanabe",
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(fontSize: 20),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _bloque2() {
    return Placeholder();
  }

  Widget _bloque3() {
    return Placeholder();
  }

  Widget _bloque4(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text("Popular Courses"),
            Text("(23)"),
            Text("See all"),
          ],
        ),
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              _buildCourse(context, Colors.red),
              _buildCourse(context, Colors.green),
              _buildCourse(context, Colors.yellow),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildCourse(BuildContext context, Color color) {
    return GestureDetector(
      onTap: () {
        var nav = Navigator.of(context);
        nav.pushNamed('/details', arguments: color);
      },
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: AspectRatio(
          aspectRatio: 4 / 3.0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final Color color;

  const SecondPage({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
      ),
    );
  }
}
