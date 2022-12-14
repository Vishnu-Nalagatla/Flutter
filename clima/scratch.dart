void main() {
  performTasks();
}

void performTasks() async {
  task1();
  await task2();
  // print(task2Data);
  task3();
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future task2() async {
  String result;
  Duration threeSec = Duration(seconds: 3);

  await Future.delayed(threeSec, () {
    result = 'task 2 data';
    print('Task 2 complete');
  });

  // return result;
}

void task3() {
  String result = 'task 3 data';
  print('Task 3 complete');
}
