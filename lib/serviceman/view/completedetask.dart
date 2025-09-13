import 'package:flutter_application_1/serviceman/model/servicemancompleted.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class CompletedTaskDetailview extends StatefulWidget {
  final Data task;
  const CompletedTaskDetailview({super.key, required this.task});

  @override
  State<CompletedTaskDetailview> createState() =>
      _CompletedTaskDetailviewState();
}

class _CompletedTaskDetailviewState extends State<CompletedTaskDetailview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 218, 246, 239),
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.task_alt_outlined), // Icon before the text
            SizedBox(width: 18), // Space between icon and text
            Text(
              "Completed Task",
              style: TextStyle(fontWeight: FontWeight.w300),
            ), // Title text
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 33, left: 22, right: 22),
              child: Container(
                //height: 400,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 244, 249, 238),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.person,
                            color: Color.fromARGB(255, 12, 100, 2),
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            widget.task.customer!.name ?? "",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.phone,
                            color: Color.fromARGB(255, 12, 100, 2),
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            widget.task.customer!.contactNumber ?? "",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Divider(color: Colors.grey, thickness: 1, height: 20),
                      Row(
                        children: [
                          Icon(
                            Icons.home,
                            color: Color.fromARGB(255, 12, 100, 2),
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              '${widget.task.customer!.location},${widget.task.customer!.state}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(color: Colors.grey, thickness: 1, height: 20),
                      Row(
                        children: [
                          Icon(
                            Icons.kitchen,
                            color: Color.fromARGB(255, 12, 100, 2),
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              widget.task.taskProduct ?? 'N/A',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(color: Colors.grey, thickness: 1, height: 20),
                      Row(
                        children: [
                          Icon(
                            Icons.date_range,
                            color: Color.fromARGB(255, 12, 100, 2),
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              widget.task.taskDate ?? "",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(color: Colors.grey, thickness: 1, height: 20),
                      Row(
                        children: [
                          const Icon(
                            Icons.build,
                            color: Color.fromARGB(255, 12, 100, 2),
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              widget.task.taskType ?? 'N/A',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (widget.task.subTasks != null &&
                          widget.task.subTasks!.isNotEmpty &&
                          widget.task.subTasks![0].taskPhase != null)
                        Padding(
                          padding: const EdgeInsets.only(left: 34),
                          child: Row(
                            children: [
                              const Text(
                                "Task Phase:",
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  // Display the first subtask's phase if available
                                  widget.task.subTasks != null &&
                                          widget.task.subTasks!.isNotEmpty
                                      ? "Phase ${widget.task.subTasks![0].taskPhase}" // Display phase number
                                      : "N/A", // Fallback if no subtasks exist
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (widget.task.taskNote != null)
                        Divider(color: Colors.grey, thickness: 1, height: 20),
                      if (widget.task.taskNote != null)
                        Row(
                          children: [
                            const Icon(
                              Icons.note,
                              color: Color.fromARGB(255, 12, 100, 2),
                              size: 30,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                widget.task.taskNote ?? 'N/A',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 33, left: 22, right: 22),
              child: Container(
                height: 350,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 244, 249, 238),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Row(
                      //   children: [
                      //     // Container for the image
                      //     Container(
                      //       height: 100, // Diameter of the circle
                      //       width: 99, // Diameter of the circle
                      //       decoration: const BoxDecoration(
                      //         color: Color.fromARGB(133, 197, 220, 197),
                      //         borderRadius: BorderRadius.all(
                      //             Radius.circular(11)), // Circle shape
                      //       ),
                      //       child: ClipRRect(
                      //         borderRadius: BorderRadius.all(Radius.circular(
                      //             11)), // Apply the same borderRadius to the image
                      //         child: widget.task.fileTypes != null &&
                      //                 widget.task.fileTypes!.isNotEmpty &&
                      //                 widget
                      //                     .task.fileTypes![0].image!.isNotEmpty
                      //             ? Image.network(
                      //                 'https://kuche7.devcom.live/public/storage/${widget.task.fileTypes![0].image}',
                      //                 fit: BoxFit.cover,
                      //                 loadingBuilder:
                      //                     (context, child, loadingProgress) {
                      //                   if (loadingProgress == null) {
                      //                     return child;
                      //                   } else {
                      //                     return Center(
                      //                         child:
                      //                             CircularProgressIndicator());
                      //                   }
                      //                 },
                      //                 errorBuilder:
                      //                     (context, error, stackTrace) {
                      //                   return Image.asset(
                      //                       'asset/key.png'); // Fallback to local image if network image fails
                      //                 },
                      //               )
                      //             : Image.asset(
                      //                 'asset/key.png'), // Fallback to local image if no URL
                      //       ),
                      //     ),
                      //     const SizedBox(width: 10),

                      //     // Column for text content
                      //     Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         // Row for serviceMan's name
                      //         Row(
                      //           children: [
                      //             Icon(Icons.support_agent),
                      //             SizedBox(width: 3),
                      //             Text(
                      //               widget.task.serviceMan != null &&
                      //                       widget.task.serviceMan!.name !=
                      //                           null &&
                      //                       widget.task.serviceMan!.name!
                      //                           .isNotEmpty
                      //                   ? widget.task.serviceMan!.name!
                      //                   : "", // Fallback to an empty string if the name is null or empty
                      //               style: TextStyle(
                      //                 fontSize: 22,
                      //                 fontWeight: FontWeight.bold,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //         const SizedBox(
                      //             height:
                      //                 8), // Space between the name and the ID
                      //         // Display the file type ID
                      //         Text(
                      //           widget.task.fileTypes != null &&
                      //                   widget.task.fileTypes!.isNotEmpty
                      //               ? "#${widget.task.fileTypes![0].id}"
                      //               : "", // Fallback to an empty string if the fileTypes is null or empty
                      //           style: TextStyle(
                      //             fontSize: 11,
                      //             fontWeight: FontWeight.w400,
                      //             color: Colors.grey, // Optional, for styling
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                      Row(
                        children: [
                          // Container for the image
                          GestureDetector(
                            onTap: () {
                              // Show full screen image when tapped
                              showDialog(
                                context: context,
                                builder:
                                    (_) => Dialog(
                                      child: PhotoView(
                                        imageProvider:
                                            widget.task.fileTypes != null &&
                                                    widget
                                                        .task
                                                        .fileTypes!
                                                        .isNotEmpty &&
                                                    widget
                                                        .task
                                                        .fileTypes![0]
                                                        .image!
                                                        .isNotEmpty
                                                ? NetworkImage(
                                                  'https://kuche7.devcom.live/public/storage/${widget.task.fileTypes![0].image}',
                                                )
                                                : AssetImage('asset/key.png')
                                                    as ImageProvider, // Fallback to local image if no URL
                                        minScale:
                                            PhotoViewComputedScale.contained,
                                        maxScale:
                                            PhotoViewComputedScale.covered,
                                      ),
                                    ),
                              );
                            },
                            child: Container(
                              height: 100, // Diameter of the circle
                              width: 99, // Diameter of the circle
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(133, 197, 220, 197),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(11),
                                ), // Circle shape
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(11),
                                ), // Apply the same borderRadius to the image
                                child:
                                    widget.task.fileTypes != null &&
                                            widget.task.fileTypes!.isNotEmpty &&
                                            widget
                                                .task
                                                .fileTypes![0]
                                                .image!
                                                .isNotEmpty
                                        ? Image.network(
                                          'https://kuche7.devcom.live/public/storage/${widget.task.fileTypes![0].image}',
                                          fit: BoxFit.cover,
                                          loadingBuilder: (
                                            context,
                                            child,
                                            loadingProgress,
                                          ) {
                                            if (loadingProgress == null) {
                                              return child;
                                            } else {
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                          },
                                          errorBuilder: (
                                            context,
                                            error,
                                            stackTrace,
                                          ) {
                                            return Image.asset(
                                              'assets/key.png',
                                            ); // Fallback to local image if network image fails
                                          },
                                        )
                                        : Image.asset(
                                          'assets/key.png',
                                        ), // Fallback to local image if no URL
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),

                          // Column for text content
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Row for serviceMan's name
                              Row(
                                children: [
                                  Icon(Icons.support_agent),
                                  SizedBox(width: 3),
                                  Text(
                                    widget.task.serviceMan != null &&
                                            widget.task.serviceMan!.name !=
                                                null &&
                                            widget
                                                .task
                                                .serviceMan!
                                                .name!
                                                .isNotEmpty
                                        ? widget.task.serviceMan!.name!
                                        : "", // Fallback to an empty string if the name is null or empty
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ), // Space between the name and the ID
                              // Display the file type ID
                              Text(
                                widget.task.fileTypes != null &&
                                        widget.task.fileTypes!.isNotEmpty
                                    ? "#${widget.task.fileTypes![0].id}"
                                    : "", // Fallback to an empty string if the fileTypes is null or empty
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey, // Optional, for styling
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(Icons.date_range),
                          SizedBox(width: 12),
                          Text(
                            "Date :",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 12),
                          Text(
                            widget.task.taskDate ?? "",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(Icons.insert_drive_file_outlined),
                          SizedBox(width: 12),
                          Text(
                            "File Type :",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 12),
                          Text(
                            widget.task.fileTypes![0].name ?? "",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      //note
                      // if (widget.task.subTasks != null &&
                      //     widget.task.subTasks!.isNotEmpty &&
                      //     widget.task.subTasks![0].taskNote != null)
                      // Row(
                      //   children: [
                      //     Icon(Icons.notes_outlined),
                      //     const SizedBox(width: 12),
                      //     const Text(
                      //       "Note :",
                      //       style: TextStyle(
                      //         fontSize: 18,
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //     const SizedBox(width: 12),
                      //     Expanded(
                      //       child: Text(
                      //         widget.task.subTasks![0].taskNote ?? "",
                      //         style: const TextStyle(
                      //           fontSize: 18,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //         // overflow: TextOverflow.ellipsis, // Handles long text
                      //       ),
                      //     ),
                      //   ],
                      // )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 22),
          ],
        ),
      ),
    );
  }
}
