// final prefs = await SharedPreferences.getInstance();
// String? bearerToken = prefs.getString('token');

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalenderView extends StatefulWidget {
  const CalenderView({super.key});

  @override
  State<CalenderView> createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      //appBar: AppBar(title: Text("Service Schedule")),
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.today),
            SizedBox(width: 18),
            Text("Service Schedule",
                style: TextStyle(fontWeight: FontWeight.w300)),
          ],
        ),
      ),

      body: CalendarJobView(),
    );
  }
}

class CalendarJobView extends StatefulWidget {
  @override
  _CalendarJobViewState createState() => _CalendarJobViewState();
}

class _CalendarJobViewState extends State<CalendarJobView> {
  DateTime today = DateTime.now();
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;

  Map<DateTime, List<ServiceJob>> jobMap = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    selectedDay = today;
    _loadJobs();
  }

  Future<void> _loadJobs() async {
    // Simulate API call
    List<ServiceJob> jobs = await _fetchJobsFromBackend();

    // Group jobs by date
    Map<DateTime, List<ServiceJob>> grouped = {};
    for (var job in jobs) {
      final day = DateTime.utc(job.date.year, job.date.month, job.date.day);
      if (!grouped.containsKey(day)) {
        grouped[day] = [];
      }
      grouped[day]!.add(job);
    }

    setState(() {
      jobMap = grouped;
      isLoading = false;
    });
  }

  Future<List<ServiceJob>> _fetchJobsFromBackend() async {
    await Future.delayed(Duration(seconds: 1)); // simulate loading

    return [
      ServiceJob(
        clientName: 'John Doe',
        serviceType: 'Kuche7',
        date: DateTime.now(),
        startTime: DateTime.now().add(Duration(hours: 9)),
        endTime: DateTime.now().add(Duration(hours: 10)),
        location: '123 Street, City',
      ),
      ServiceJob(
        clientName: 'Alice Smith',
        serviceType: 'Nolta',
        date: DateTime.now().add(Duration(days: 1)),
        startTime: DateTime.now().add(Duration(days: 1, hours: 10)),
        endTime: DateTime.now().add(Duration(days: 1, hours: 11)),
        location: '456 Avenue, Town',
      ),
    ];
  }

  List<ServiceJob> _getJobsForDay(DateTime day) {
    final normalizedDay = DateTime.utc(day.year, day.month, day.day);
    return jobMap[normalizedDay] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    return Column(
      children: [
        // Calendar UI
        Container(
          height: 220,
          margin: EdgeInsets.all(12),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color.fromARGB(197, 220, 213, 243),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(
                  100,
                  189,
                  131,
                  131,
                ).withOpacity(0.05),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: TableCalendar<ServiceJob>(
            firstDay: today,
            lastDay: today.add(Duration(days: 13)),
            focusedDay: focusedDay,
            calendarFormat: CalendarFormat.twoWeeks,
            selectedDayPredicate: (day) => isSameDay(day, selectedDay),
            eventLoader: _getJobsForDay,
            onDaySelected: (selected, focused) {
              setState(() {
                selectedDay = selected;
                focusedDay = focused;
              });
            },
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.redAccent,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
              markerDecoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              cellMargin: EdgeInsets.symmetric(vertical: 4),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(fontWeight: FontWeight.bold),
              weekendStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),

        // Job List
        Expanded(
          child: _getJobsForDay(selectedDay!).isEmpty
              ? Center(
                  child: Text(
                    "No jobs scheduled.",
                    style: TextStyle(fontSize: 16),
                  ),
                )
              : ListView.builder(
                  itemCount: _getJobsForDay(selectedDay!).length,
                  itemBuilder: (context, index) {
                    final job = _getJobsForDay(selectedDay!)[index];
                    return Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(16),
                        leading: Icon(
                          Icons.build,
                          color: Colors.blue,
                          size: 30,
                        ),
                        title: Row(
                          children: [
                            Text(
                              job.serviceType,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 6),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                DateFormat('jm').format(job.startTime),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                                SizedBox(width: 4),
                                Text(job.clientName),
                              ],
                            ),
                            SizedBox(height: 2),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                                SizedBox(width: 4),
                                Expanded(child: Text(job.location)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

class ServiceJob {
  final String clientName;
  final String serviceType;
  final DateTime date;
  final DateTime startTime;
  final DateTime endTime;
  final String location;

  ServiceJob({
    required this.clientName,
    required this.serviceType,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.location,
  });
}
