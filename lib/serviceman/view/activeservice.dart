import 'package:flutter/material.dart';
import 'package:flutter_application_1/serviceman/api/acceptandrejecttask.dart';
import 'package:flutter_application_1/serviceman/provider/activeserviceprovider.dart';
import 'package:flutter_application_1/serviceman/view/clientdetailpage.dart';
import 'package:flutter_application_1/serviceman/widget/todayscard.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ActiveService extends StatefulWidget {
  const ActiveService({super.key});

  @override
  State<ActiveService> createState() => _ActiveServiceState();
}

class _ActiveServiceState extends State<ActiveService> {
  @override
  void initState() {
    super.initState();
    _loadData(silent: true); // Initial load (silent)
  }

  Future<void> _loadData({bool silent = false}) async {
    if (!silent && mounted) {
      setState(() {}); // Trigger rebuild to show current data while loading
    }

    final provider = Provider.of<ActiveServiceProvider>(context, listen: false);
    //////////////////////////////////////////////////////////
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    //remove this token after testing //////////////////////////////
    await provider.fetchActiveServiceRequests(
      token!,
      context,
    ); // Replace with actual token

    if (mounted) {
      setState(() {}); // Ensure UI updates with new data
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.home_repair_service_rounded),
            SizedBox(width: 18),
            Text(
              "Active Service",
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
      body: Consumer<ActiveServiceProvider>(
        builder: (context, provider, child) {
          // Handle loading state (only show indicator for initial load)
          if (provider.isLoading && provider.activeServiceRequest == null) {
            return const Center(child: CircularProgressIndicator());
          }

          // Check for null or empty data
          if (provider.activeServiceRequest == null ||
              provider.activeServiceRequest!.data == null ||
              provider.activeServiceRequest!.data!.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/Animation.json',
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "No Task found!",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 120, 113, 113),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: _loadData,
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.blue.shade300),
                      backgroundColor: Colors.blue.shade50,
                      elevation: 1,
                    ),
                    child: Text("Retry"),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: provider.activeServiceRequest!.data!.length,
            itemBuilder: (context, index) {
              List<String> materials = [];
              var task = provider.activeServiceRequest!.data![index];
              int taskPhase =
                  task.subTasks != null && task.subTasks!.isNotEmpty
                      ? task.subTasks![0].taskPhase ?? 0
                      : 0;

              if (task.taskType == 'Installation' &&
                  task.subTasks != null &&
                  task.subTasks!.isNotEmpty) {
                materials =
                    task.subTasks![0].materials
                        ?.map((material) => material.name ?? "")
                        .toList() ??
                    [];
              }

              if (task.taskType == 'Service' &&
                  materials.isEmpty &&
                  task.materials != null) {
                materials =
                    task.materials!
                        .map((material) => material.name ?? "")
                        .toList();
              }

              return Todaystaskcard(
                id: task.id ?? 0,
                taskType: task.taskType ?? "",
                taskphase: taskPhase,
                taskdate: task.taskDate ?? "",
                materials: materials,
                taskstatus: task.taskStatus ?? "",
                onAccept: () async {
                  final taskService = TaskService();
                  await taskService.acceptTask(task.id ?? 0, context);
                  await _loadData(silent: true); // Silent refresh
                },
                onReject: () async {
                  final taskService = TaskService();
                  await taskService.rejectTask(task.id ?? 0, context);
                  await _loadData(silent: true); // Silent refresh
                },
                customername: task.customer!.name ?? "",
                customeremail: task.customer!.email ?? '',
                customerPhone: task.customer!.contactNumber ?? "",
                location: task.customer!.location ?? '',
                locationlink: task.taskGoogleLink ?? '',
                onTapWhenAccepted: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              WorkDetails(task: task, pagename: 'Active'),
                    ),
                  );
                  // Automatically refresh when returning without indicator
                  await _loadData(silent: true);
                },
              );
            },
          );
        },
      ),
    );
  }
}
