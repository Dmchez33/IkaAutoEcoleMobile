import 'package:flutter/material.dart';

class StatisticsPage extends StatefulWidget {
  @override
  _StatisticsPageState createState() => _StatisticsPageState();
  late final int score;
  late final int totalquestion;

  StatisticsPage({required this.score, required this.totalquestion});
}

class _StatisticsPageState extends State<StatisticsPage> {
  Map<String, double> quizData = {
    'Quiz 1': 0.75,
    'Quiz 2': 0.90,
    'Quiz 3': 0.65,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistics'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Quiz Performance',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: quizData.entries
                    .map((e) => Container(
                  width: 150,
                  child: Column(
                    children: [
                      Text(
                        e.key,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        child: CircularProgressIndicator(
                          value: e.value,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '${(e.value * 100).toInt()}%',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ))
                    .toList(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                // navigate to detailed results page
              },
              child: Text(
                'View Detailed Results',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue
              ),
            ),
          ],
        ),
      ),
    );
  }
}
