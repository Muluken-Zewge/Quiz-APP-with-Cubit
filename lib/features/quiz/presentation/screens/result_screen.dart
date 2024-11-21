import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final List<Map<String, dynamic>> summaries;

  const ResultScreen({super.key, required this.summaries});

  @override
  Widget build(BuildContext context) {
    final correctCount =
        summaries.where((summary) => summary['isCorrect'] as bool).length;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade800, Colors.purple.shade800],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  "Quiz Results",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Column(children: [
                  Text(
                    '$correctCount',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'out of ${summaries.length}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                  )
                ]),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Summary',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: summaries.length,
                    itemBuilder: (context, index) {
                      final summary = summaries[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: summary['isCorrect']
                            ? Colors.green.withOpacity(0.1)
                            : Colors.red.withOpacity(0.1),
                        child: ListTile(
                          title: Text(
                            summary['question'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Row(children: [
                                const Text(
                                  "Correct Answer: ",
                                  style: TextStyle(
                                    color: Colors.white70,
                                  ),
                                ),
                                Text(
                                  '${summary['correctAnswer']}',
                                  style: const TextStyle(
                                    color: Colors.green,
                                  ),
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                )
                              ]),
                              Row(children: [
                                const Text(
                                  "Your Answer: ",
                                  style: TextStyle(
                                    color: Colors.white70,
                                  ),
                                ),
                                Text(
                                  '${summary['selectedAnswer']}',
                                  style: TextStyle(
                                    color: summary['isCorrect']
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                )
                              ]),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    icon: const Icon(Icons.home),
                    label: const Text("Back to Home"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
