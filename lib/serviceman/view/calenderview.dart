// final prefs = await SharedPreferences.getInstance();
// String? bearerToken = prefs.getString('token');

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/sessionmanager.dart';
import 'package:flutter_application_1/serviceman/model/calendermodel.dart';
import 'package:flutter_application_1/serviceman/provider/calenderprovider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;
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
            Text(
              "Service Schedule",
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
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

  // @override
  // void initState() {
  //   super.initState();
  //   selectedDay = today;

  //   // Load provider
  //   final provider = Provider.of<CalendarProvider>(context, listen: false);
  //   provider.loadJobs();
  // }
  @override
  void initState() {
    super.initState();
    selectedDay = today;

    // Delay the call until after build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<CalendarProvider>(context, listen: false);
      provider.loadJobs(context);
    });
  }

  List<ServiceJob> _convertToServiceJobs(List<Data> dataList) {
    // Map API Data -> ServiceJob UI Model
    return dataList.map((data) {
      final date = DateTime.parse(data.start!);
      return ServiceJob(
        clientName: data.customer ?? "Unknown",
        serviceType: data.brand ?? "Unknown",
        date: date,
        startTime: date,
        endTime: date.add(Duration(hours: 1)), // default 1 hour
        location: data.location ?? "-",
        status: data.taskType ?? "Pending",
        stages: data.taskStatus ?? "",
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CalendarProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return Center(child: CircularProgressIndicator());
        }

        // Convert API data for selected day to ServiceJob list
        List<ServiceJob> jobsForDay = _convertToServiceJobs(
          provider.getJobsForDay(selectedDay!),
        );

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
                eventLoader:
                    (day) => _convertToServiceJobs(provider.getJobsForDay(day)),
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
              child:
                  jobsForDay.isEmpty
                      ? Center(
                        child: Text(
                          "No jobs scheduled.",
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                      : ListView.builder(
                        itemCount: jobsForDay.length,
                        itemBuilder: (context, index) {
                          final job = jobsForDay[index];
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
                                  if (job.stages != null &&
                                      job.stages.isNotEmpty)
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
                                        // DateFormat('jm').format(job.startTime),
                                        job.stages,
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
                                  SizedBox(height: 2),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.build_circle_rounded,
                                        size: 16,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(width: 4),
                                      Expanded(child: Text(job.status)),
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
      },
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
  final String status;
  final String stages;

  ServiceJob({
    required this.clientName,
    required this.serviceType,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.location,
    required this.status,
    required this.stages,
  });
}
