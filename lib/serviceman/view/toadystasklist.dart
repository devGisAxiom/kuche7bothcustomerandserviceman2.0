import 'package:flutter_application_1/serviceman/api/acceptandrejecttask.dart';
import 'package:flutter_application_1/serviceman/view/clientdetailpage.dart';
import 'package:flutter_application_1/serviceman/provider/todystaskprovider.dart';
//import 'package:flutter_application_1/test.dart';
import 'package:flutter_application_1/serviceman/widget/todayscard.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Todayslists extends StatefulWidget {
  const Todayslists({super.key});

  @override
  State<Todayslists> createState() => _TodayslistsState();
}

class _TodayslistsState extends State<Todayslists> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refreshData();
    });
  }

  Future<void> _refreshData() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final provider = Provider.of<ActiveServiceProviders>(
      context,
      listen: false,
    );

    await provider.fetchActiveServiceRequests(token!, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.build),
            SizedBox(width: 18),
            Text("Today's Task", style: TextStyle(fontWeight: FontWeight.w300)),
          ],
        ),
      ),
      body: Consumer<ActiveServiceProviders>(
        builder: (context, provider, child) {
          if (provider.isLoading && provider.activeServiceRequest == null) {
            return const Center(child: CircularProgressIndicator());
          }

          // RefreshIndicator wraps the entire content
          return RefreshIndicator(
            onRefresh: _refreshData,
            child: _buildContent(provider),
          );
        },
      ),
    );
  }

  Widget _buildContent(ActiveServiceProviders provider) {
    if (provider.activeServiceRequest == null ||
        provider.activeServiceRequest!.data == null) {
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
              "No Data Available",
              style: TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 120, 113, 113),
              ),
            ),
            OutlinedButton(
              onPressed: _refreshData,
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

    var acceptedTasks =
        provider.activeServiceRequest!.data!
            .where(
              (task) =>
                  task.taskStatus == "Accept" || task.taskStatus == "Pending",
            )
            .toList();

    if (acceptedTasks.isEmpty) {
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
              onPressed: _refreshData,
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
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: acceptedTasks.length,
      itemBuilder: (context, index) {
        List<String> materials = [];
        var task = acceptedTasks[index];
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
              task.materials!.map((material) => material.name ?? "").toList();
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
            await _refreshData();
          },
          onReject: () async {
            final taskService = TaskService();
            await taskService.rejectTask(task.id ?? 0, context);
            await _refreshData();
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
                    (context) => WorkDetails(
                      task: acceptedTasks[index],
                      pagename: 'Today',
                    ),
              ),
            );
            await _refreshData();
          },
        );
      },
    );
  }
}
