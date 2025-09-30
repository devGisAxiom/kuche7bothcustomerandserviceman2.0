import 'package:flutter/material.dart';
import 'package:flutter_application_1/serviceman/view/completedetask.dart';
import 'package:flutter_application_1/serviceman/provider/servicemancompletedlist.dart';
import 'package:flutter_application_1/serviceman/widget/completedtaskcard.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompletedTask extends StatefulWidget {
  const CompletedTask({super.key});

  @override
  State<CompletedTask> createState() => _CompletedTaskState();
}

class _CompletedTaskState extends State<CompletedTask> {
  @override
  void initState() {
    super.initState();
    _loadTokenAndFetchTasks(); // Call the async method
  }

  Future<void> _loadTokenAndFetchTasks() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      if (token != null) {
        Provider.of<ServiceManProvider>(
          context,
          listen: false,
        ).fetchCompletedTasks(token, context);
      } else {
        print("Token not found in SharedPreferences");
      }
    } catch (e) {
      print("Error fetching tasks: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final completedTaskProvider = Provider.of<ServiceManProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.task_alt_outlined),
            SizedBox(width: 18),
            Text(
              "Completed Task",
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
      body:
          completedTaskProvider.completedTask == null
              ? const Center(
                child: CircularProgressIndicator(),
              ) // Show loading indicator while fetching
              : ListView.builder(
                itemCount:
                    completedTaskProvider.completedTask?.data?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  final task =
                      completedTaskProvider.completedTask!.data![index];

                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder:
                              (context) => CompletedTaskDetailview(task: task),
                        ),
                      );
                    },
                    child: CompletedTaskCard(
                      taskName: task.taskProduct ?? '',
                      taskId: task.id?.toString() ?? '',
                      taskMode: task.taskType ?? '',
                    ),
                  );
                },
              ),
    );
  }
}
