import 'package:auth/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:auth/domain/workout.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          // backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(
            title: Text('Home page'),
            leading: Icon(Icons.home_work),
            actions: <Widget>[
              FlatButton.icon(
                  onPressed: () {
                    AuthService().logOut();
                  },
                  icon: Icon(Icons.logout, color: Colors.white),
                  label: SizedBox.shrink())
            ],
          ),
          body: WorkoutLists()),
    );
  }
}

class WorkoutLists extends StatelessWidget {
  final workouts = <Workout>[
    Workout(
        title: 'Mobile & web developper',
        author: 'Berik',
        description: 'Dart',
        level: 'Advanced'),
    Workout(
        title: 'Mobile & web developper',
        author: 'Serik',
        description: 'JS, DART',
        level: 'Advanced'),
    Workout(
        title: 'Buhgalter',
        author: 'Bahon',
        description: 'Buhgalter',
        level: 'Beginner'),
    Workout(
        title: 'Buhgalter',
        author: 'Almik',
        description: 'Buhgaltrer',
        level: 'Intermediate'),
    Workout(
        title: 'Medik', author: 'Iko', description: 'Medik', level: 'Beginner'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ListView.builder(
            itemCount: workouts.length,
            itemBuilder: (context, i) {
              return Card(
                elevation: 2.0,
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Container(
                  decoration: BoxDecoration(color: Colors.green[300]),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    leading: Container(
                        padding: EdgeInsets.only(right: 12),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                              right:
                                  BorderSide(width: 1, color: Colors.white24)),
                        )),
                    title: Text(
                      workouts[i].title,
                      style: TextStyle(
                          color: Theme.of(context).textTheme.title.color,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: SubTitle(context, workouts[i]),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

Widget SubTitle(BuildContext context, Workout workout) {
  var color = Colors.grey;
  double indicatorLevel = 0;

  switch (workout.level) {
    case 'Beginner':
      color = Colors.green;
      indicatorLevel = 0.33;
      break;
    case 'Intermediate':
      color = Colors.yellow;
      indicatorLevel = 0.66;
      break;
    case 'Advanced':
      color = Colors.red;
      indicatorLevel = 1;
      break;
  }

  return Row(
    children: <Widget>[
      Expanded(
        flex: 1,
        child: LinearProgressIndicator(
          backgroundColor: Theme.of(context).textTheme.title.color,
          value: indicatorLevel,
          valueColor: AlwaysStoppedAnimation(color),
        ),
      ),
      SizedBox(
        width: 10,
      ),
      Expanded(
        flex: 3,
        child: Text(workout.level,
            style: TextStyle(color: Theme.of(context).textTheme.title.color)),
      )
    ],
  );
}
