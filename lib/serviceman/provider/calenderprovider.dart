import 'package:flutter/material.dart';
import 'package:flutter_application_1/serviceman/api/calenderapi.dart';
import 'package:flutter_application_1/serviceman/model/calendermodel.dart';

class CalendarProvider extends ChangeNotifier {
  final CalendarService _service = CalendarService();

  Map<DateTime, List<Data>> jobMap = {};
  bool isLoading = true;

  CalendarProvider();

  Future<void> loadJobs(BuildContext context) async {
    isLoading = true;
    notifyListeners(); // safe because we are outside build

    try {
      final jobs = await _service.fetchJobs(context);

      Map<DateTime, List<Data>> grouped = {};
      for (var job in jobs) {
        final day = DateTime.utc(
          DateTime.parse(job.start!).year,
          DateTime.parse(job.start!).month,
          DateTime.parse(job.start!).day,
        );
        if (!grouped.containsKey(day)) grouped[day] = [];
        grouped[day]!.add(job);
      }

      jobMap = grouped;
    } catch (e) {
      // Handle error
      jobMap = {};
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  List<Data> getJobsForDay(DateTime day) {
    final normalizedDay = DateTime.utc(day.year, day.month, day.day);
    return jobMap[normalizedDay] ?? [];
  }
}
