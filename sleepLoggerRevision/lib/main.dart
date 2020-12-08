import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sleep Logger App Demo 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Sleep Logger Demo 2'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _inprogress = "START";
  DateTime _clock_start;
  DateTime _clock_ended;
  Duration _difference;
  int _starthour = 0;
  int _startmin = 0;
  int _endhour = 0;
  int _endmin = 0;
  int _diffmins = 0;
  int _diffhours = 0;

  void _timeTracker() {
    setState(() {
      if(_inprogress == "START"){
        _clock_start = DateTime.now();
        _starthour = _clock_start.hour;
        _startmin = _clock_start.minute;
        _endmin = 0;
        _endhour = 0;
        _diffmins = 0;
        _diffhours = 0;
        _inprogress = "STOP";
      } else if(_inprogress == "STOP"){
        _clock_ended = DateTime.now();
        _endhour = _clock_ended.hour;
        _endmin = _clock_ended.minute;

        _difference = _clock_ended.difference(_clock_start);
        _diffhours = _difference.inHours;
        if(_diffhours > 0){
          _diffmins = _difference.inMinutes - _diffhours * 60;
        } else {
          _diffmins = _difference.inMinutes;
        }
        _inprogress = "START";
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            new Icon(
              Icons.airline_seat_individual_suite,
              size: 100,
            ),

            new Container(
              height: 70,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.lightBlue,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text('Starting Time:',
                    style: Theme.of(context).textTheme.headline5
                ),
                ),
              ),
            Spacer(
              flex: 1,
            ),
            new Container(
              height: 35,
              width: 70,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.lightBlue,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text('$_starthour' + ' : ' + '$_startmin',
                    style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            new Container(
              height: 70,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.redAccent,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text('Ending Time:',
                  style: Theme.of(context).textTheme.headline5,
                ),
                ),
              ),
            Spacer(
              flex: 1,
            ),
            new Container(
              height: 35,
              width: 70,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.redAccent,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text('$_endhour' + ' : ' + '$_endmin',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            new Container(
              height: 70,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.lightBlue,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text('Duration of Sleep:',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            new Container(
              height: 60,
              width: 220,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.lightBlue,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text('Hours: ' + '$_diffhours'+ ', Minutes: $_diffmins',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
            Spacer(
              flex: 1,
            ),
          ],
        ),
      ),

      
      floatingActionButton: FloatingActionButton(
        onPressed: _timeTracker,
        child: Text(
          '$_inprogress',
          style: Theme.of(context).textTheme.button,
        ),
      ),

    );
  }
}
