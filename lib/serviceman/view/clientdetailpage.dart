// //without validation
// // import 'package:design/model/activeservicemodel.dart';
// // import 'package:flutter/material.dart';
// // import 'package:url_launcher/url_launcher.dart';

// // class WorkDetails extends StatefulWidget {
// //   final Data task;
// //   const WorkDetails({super.key, required this.task});

// //   @override
// //   State<WorkDetails> createState() => _WorkDetailsState();
// // }

// // class _WorkDetailsState extends State<WorkDetails> {
// //   String selectedPhase = "Start";
// //   final List<String> phases = ["Start", "End"];

// //   String selectedFile = "Measurement";
// //   final List<String> file = ["Measurement", "Bill"];

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: const Color.fromARGB(255, 246, 229, 218),
// //       appBar: AppBar(
// //         title: const Row(
// //           children: [
// //             Icon(
// //               Icons.work_outline_outlined,
// //             ), // Icon before the text
// //             SizedBox(width: 18), // Space between icon and text
// //             Text(
// //               "Work Details",
// //               style: TextStyle(fontWeight: FontWeight.w300),
// //             ), // Title text
// //           ],
// //         ),
// //       ),
// //       body: SingleChildScrollView(
// //         child: Column(
// //           children: [
// //             Padding(
// //               padding: const EdgeInsets.only(top: 33, left: 22, right: 22),
// //               child: Container(
// //                 //height: 200,
// //                 width: double.infinity,
// //                 decoration: const BoxDecoration(
// //                   color: Color.fromARGB(255, 244, 249, 238),
// //                   borderRadius: BorderRadius.all(Radius.circular(6)),
// //                 ),
// //                 child: Padding(
// //                   padding: EdgeInsets.all(16.0),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Row(
// //                         children: [
// //                           const Icon(
// //                             Icons.person_outline,
// //                             color: Colors.red,
// //                             size: 30,
// //                           ),
// //                           const SizedBox(width: 10),
// //                           Text(
// //                             widget.task.customer!.name ?? "N/A",
// //                             style: const TextStyle(
// //                               fontSize: 18,
// //                               fontWeight: FontWeight.bold,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                       Divider(
// //                         color: Colors.grey,
// //                         thickness: 1,
// //                         height: 20,
// //                       ),
// //                       Row(
// //                         children: [
// //                           Icon(
// //                             Icons.phone_outlined,
// //                             color: Colors.red,
// //                             size: 30,
// //                           ),
// //                           SizedBox(width: 10),
// //                           Text(
// //                             widget.task.customer!.contactNumber ?? "N/A",
// //                             style: TextStyle(
// //                               fontSize: 16,
// //                               fontWeight: FontWeight.w400,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                       Divider(
// //                         color: Colors.grey,
// //                         thickness: 1,
// //                         height: 20,
// //                       ),
// //                       Row(
// //                         children: [
// //                           Icon(
// //                             Icons.location_on_outlined,
// //                             color: Colors.red,
// //                             size: 30,
// //                           ),
// //                           SizedBox(width: 10),
// //                           Expanded(
// //                             child: Text(
// //                               '${widget.task.customer!.location},${widget.task.customer!.state}',
// //                               style: const TextStyle(
// //                                 fontSize: 16,
// //                                 fontWeight: FontWeight.w400,
// //                               ),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                       Row(
// //                         children: [
// //                           const SizedBox(width: 44),
// //                           Expanded(
// //                             child: TextButton(
// //                               onPressed: () =>
// //                                   _launchUrl(widget.task.taskGoogleLink ?? ""),
// //                               style: TextButton.styleFrom(
// //                                 foregroundColor: Colors.blue,
// //                                 padding: EdgeInsets.zero,
// //                                 minimumSize: Size.zero,
// //                                 tapTargetSize: MaterialTapTargetSize.shrinkWrap,
// //                               ),
// //                               child: Text(
// //                                 widget.task.taskGoogleLink ?? "",
// //                               ),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.only(top: 13, left: 22, right: 22),
// //               child: Container(
// //                 height: 150,
// //                 width: double.infinity,
// //                 decoration: const BoxDecoration(
// //                   color: Color.fromARGB(255, 244, 249, 238),
// //                   borderRadius: BorderRadius.all(Radius.circular(6)),
// //                 ),
// //                 child: Padding(
// //                   padding: EdgeInsets.all(16.0),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Row(
// //                         children: [
// //                           Text('Kitchen Specific :'),
// //                           SizedBox(width: 10),
// //                           Text(
// //                             widget.task.taskProduct ?? "",
// //                             style: TextStyle(
// //                               fontSize: 18,
// //                               fontWeight: FontWeight.w600,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                       Divider(
// //                         color: Colors.grey,
// //                         thickness: 1,
// //                         height: 20,
// //                       ),
// //                       Row(
// //                         children: [
// //                           Text('Task Mode :'),
// //                           SizedBox(width: 10),
// //                           Text(
// //                             widget.task.taskType ?? "",
// //                             style: TextStyle(
// //                               fontSize: 18,
// //                               fontWeight: FontWeight.w300,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ),

// //             if (widget.task.subTasks?.firstOrNull?.taskFiles?.isNotEmpty ??
// //                 false)
// //               Padding(
// //                 padding: const EdgeInsets.only(top: 13, left: 22, right: 22),
// //                 child: Column(
// //                   // Use Column instead of Row to make the layout more predictable.
// //                   children: [
// //                     Container(
// //                       constraints: BoxConstraints(
// //                         minHeight: 300, // Minimum height you want
// //                       ),
// //                       decoration: const BoxDecoration(
// //                         color: Color.fromARGB(255, 244, 249, 238),
// //                         borderRadius: BorderRadius.all(Radius.circular(6)),
// //                       ),
// //                       child: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           _buildTaskFilesDisplay(),
// //                           Padding(
// //                             padding: const EdgeInsets.only(
// //                                 top: 8, left: 11, right: 11),
// //                             child: Text(
// //                               widget.task.subTasks![0].taskName ?? "",
// //                               style: TextStyle(
// //                                   fontSize: 20, fontWeight: FontWeight.bold),
// //                               softWrap: true, // Allows text to wrap
// //                               overflow:
// //                                   TextOverflow.ellipsis, // Prevents overflow
// //                             ),
// //                           ),
// //                           Padding(
// //                             padding: EdgeInsets.only(
// //                                 top: 8, left: 11, right: 11, bottom: 11),
// //                             child: Text(
// //                               widget.task.subTasks![0].taskNote ?? "",
// //                               style: TextStyle(
// //                                   fontSize: 16, fontWeight: FontWeight.w300),
// //                               softWrap: true, // Allows text to wrap
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),

// //             Padding(
// //               padding: const EdgeInsets.only(top: 13, left: 22, right: 22),
// //               child: Container(
// //                 height: 400,
// //                 width: double.infinity,
// //                 decoration: const BoxDecoration(
// //                   color: Color.fromARGB(255, 244, 249, 238),
// //                   borderRadius: BorderRadius.all(Radius.circular(6)),
// //                 ),
// //                 child: Padding(
// //                   padding: const EdgeInsets.all(16.0),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Row(
// //                         children: [
// //                           const Text('Phase :'),
// //                           const SizedBox(width: 10),
// //                           DropdownButton<String>(
// //                             value: selectedPhase,
// //                             items: phases.map((String phase) {
// //                               return DropdownMenuItem<String>(
// //                                 value: phase,
// //                                 child: Text(phase),
// //                               );
// //                             }).toList(),
// //                             onChanged: (String? newValue) {
// //                               setState(() {
// //                                 selectedPhase = newValue!;
// //                               });
// //                             },
// //                           ),
// //                         ],
// //                       ),
// //                       const Divider(
// //                         color: Colors.grey,
// //                         thickness: 1,
// //                         height: 20,
// //                       ),
// //                       Row(
// //                         children: [
// //                           const Text('FileType :'),
// //                           const SizedBox(width: 10),
// //                           DropdownButton<String>(
// //                             value: selectedFile,
// //                             items: file.map((String phase) {
// //                               return DropdownMenuItem<String>(
// //                                 value: phase,
// //                                 child: Text(phase),
// //                               );
// //                             }).toList(),
// //                             onChanged: (String? newValue) {
// //                               setState(() {
// //                                 selectedPhase = newValue!;
// //                               });
// //                             },
// //                           ),
// //                         ],
// //                       ),
// //                       const Divider(
// //                         color: Colors.grey,
// //                         thickness: 1,
// //                         height: 20,
// //                       ),
// //                       Row(
// //                         children: [
// //                           const Text('File Upload :'),
// //                           const SizedBox(width: 10),
// //                           ElevatedButton(
// //                             onPressed: () {
// //                               // Add your button action here
// //                             },
// //                             style: ElevatedButton.styleFrom(
// //                               backgroundColor:
// //                                   Colors.blue, // Set the button color to blue
// //                               shape: RoundedRectangleBorder(
// //                                 borderRadius:
// //                                     BorderRadius.circular(4), // Make it square
// //                               ),
// //                               minimumSize:
// //                                   const Size(40, 40), // Set square dimensions
// //                             ),
// //                             child: const Icon(
// //                               Icons
// //                                   .file_upload, // Add an icon to the button (optional)
// //                               color: Colors.white, // Icon color
// //                               size: 20, // Icon size
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                       const Divider(
// //                         color: Colors.grey,
// //                         thickness: 1,
// //                         height: 20,
// //                       ),
// //                       const Row(
// //                         children: [
// //                           Text('Notes:'),
// //                           SizedBox(width: 10),
// //                           Expanded(
// //                             child: TextField(
// //                               decoration: InputDecoration(
// //                                 hintText: 'Enter your note here',
// //                                 border: OutlineInputBorder(),
// //                               ),
// //                               maxLines: 5, // Allow multiple lines for the note
// //                             ),
// //                           ),
// //                         ],
// //                       )
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             //elevated button
// //             Padding(
// //               padding: const EdgeInsets.only(
// //                   top: 13, left: 22, right: 22, bottom: 22),
// //               child: SizedBox(
// //                 width: 500,
// //                 child: ElevatedButton(
// //                   onPressed: () {
// //                     // Add submit action
// //                   },
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor:
// //                         Colors.green, // Set the button color to green
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(8), // Rounded corners
// //                     ),
// //                     padding: const EdgeInsets.symmetric(
// //                         vertical: 15, horizontal: 40),
// //                   ),
// //                   child: const Text(
// //                     "Submit",
// //                     style: TextStyle(
// //                       fontSize: 18,
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.white,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Future<void> _launchUrl(String url) async {
// //     try {
// //       if (!await launchUrl(Uri.parse(url))) {
// //         throw 'Could not launch $url';
// //       }
// //     } catch (e) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('Error: ${e.toString()}')),
// //       );
// //     }
// //   }

// //   Widget _buildTaskFilesDisplay() {
// //     // Get the task files from your data model
// //     final taskFiles = widget.task.subTasks?.firstOrNull?.taskFiles ?? [];

// //     if (taskFiles.isEmpty) {
// //       return const Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Icon(Icons.folder_open, size: 40, color: Colors.grey),
// //             SizedBox(height: 8),
// //             Text(
// //               'No files attached',
// //               style: TextStyle(color: Colors.grey),
// //             ),
// //           ],
// //         ),
// //       );
// //     }

// //     return Align(
// //       alignment: Alignment.topCenter,
// //       child: Padding(
// //         padding: const EdgeInsets.only(top: 11),
// //         child: Container(
// //           width: 300,
// //           height: 200,
// //           decoration: const BoxDecoration(
// //             color: Color.fromARGB(255, 213, 199, 198),
// //             borderRadius: BorderRadius.all(Radius.circular(10)),
// //           ),
// //           child: ClipRRect(
// //             borderRadius: BorderRadius.circular(10),
// //             child: _buildFileContent(taskFiles),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildFileContent(List<TaskFiles> taskFiles) {
// //   // If there's exactly one image file
// //   if (taskFiles.length == 1 &&
// //       taskFiles.first.name?.toLowerCase().endsWith('.jpg') == true) {
// //     return GestureDetector(
// //       onTap: () {
// //         _showZoomableImageDialog(context, taskFiles.first);
// //       },
// //       child: Image.network(
// //         "https://kuche7.devcom.live/public/storage/${taskFiles.first.name}",
// //         fit: BoxFit.cover,
// //         loadingBuilder: (context, child, loadingProgress) {
// //           if (loadingProgress == null) return child;
// //           return Center(
// //             child: CircularProgressIndicator(
// //               value: loadingProgress.expectedTotalBytes != null
// //                   ? loadingProgress.cumulativeBytesLoaded /
// //                       loadingProgress.expectedTotalBytes!
// //                   : null,
// //             ),
// //           );
// //         },
// //         errorBuilder: (context, error, stackTrace) {
// //           return const Center(
// //             child: Column(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 Icon(Icons.broken_image, size: 40),
// //                 SizedBox(height: 8),
// //                 Text('Failed to load image'),
// //               ],
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }

// //   // For multiple files or non-image files
// //   return ListView.builder(
// //     padding: const EdgeInsets.all(8),
// //     itemCount: taskFiles.length,
// //     itemBuilder: (context, index) {
// //       final file = taskFiles[index];
// //       final fileName = file.name?.split('/').last ?? 'file';
// //       final isImage = fileName.toLowerCase().endsWith('.jpg') ||
// //           fileName.toLowerCase().endsWith('.png') ||
// //           fileName.toLowerCase().endsWith('.jpeg');

// //       return Card(
// //         margin: const EdgeInsets.symmetric(vertical: 4),
// //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
// //         child: InkWell(
// //           borderRadius: BorderRadius.circular(8),
// //           onTap: () {
// //             if (isImage) {
// //               _showZoomableImageDialog(context, file);
// //             }
// //           },
// //           child: Padding(
// //             padding: const EdgeInsets.all(12),
// //             child: Row(
// //               children: [
// //                 Icon(
// //                   isImage ? Icons.image : Icons.insert_drive_file,
// //                   color: Colors.blue,
// //                 ),
// //                 const SizedBox(width: 12),
// //                 Expanded(
// //                   child: Text(
// //                     fileName,
// //                     overflow: TextOverflow.ellipsis,
// //                   ),
// //                 ),
// //                 if (isImage) const Icon(Icons.zoom_in, color: Colors.grey),
// //               ],
// //             ),
// //           ),
// //         ),
// //       );
// //     },
// //   );
// // }

// // void _showZoomableImageDialog(BuildContext context, TaskFiles file) {
// //   final fileName = file.name?.split('/').last ?? 'file';

// //   showDialog(
// //     context: context,
// //     builder: (context) {
// //       return Dialog(
// //         insetPadding: const EdgeInsets.all(20),
// //         child: InteractiveViewer(
// //           panEnabled: true,
// //           minScale: 0.5,
// //           maxScale: 4.0,
// //           child: Stack(
// //             children: [
// //               Center(
// //                 child: Image.network(
// //                   "https://kuche7.devcom.live/public/storage/${file.name}",
// //                   fit: BoxFit.contain,
// //                 ),
// //               ),
// //               Positioned(
// //                 top: 10,
// //                 right: 10,
// //                 child: IconButton(
// //                   icon: const Icon(Icons.close, color: Color.fromARGB(255, 0, 0, 0)),
// //                   onPressed: () => Navigator.of(context).pop(),
// //                 ),
// //               ),

// //             ],
// //           ),
// //         ),
// //       );
// //     },
// //   );
// // }
// // }
// //without validation above code

import 'dart:io';

import 'package:flutter_application_1/serviceman/model/filetype.dart'
    as file_ty;

// import 'package:design/test2.dart';
import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/serviceman/api/completephase1.dart';
import 'package:flutter_application_1/serviceman/api/completephase2.dart';
import 'package:flutter_application_1/serviceman/model/activeservicemodel.dart';
import 'package:flutter_application_1/serviceman/provider/filetypeprovider.dart'
    as file_ty;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class WorkDetails extends StatefulWidget {
  final Data task;
  final String pagename;
  const WorkDetails({super.key, required this.task, required this.pagename});

  @override
  State<WorkDetails> createState() => _WorkDetailsState();
}

class _WorkDetailsState extends State<WorkDetails> {
  //Data? _selectedFileType;
  file_ty.Data? _selectedFileType;
  String selectedPhase = "Start";
  final List<String> phases = ["Start", "End"];
  List<File> uploadedFiles = []; // Store uploaded files here
  int? selectedFileId;

  // String selectedFile = "Measurement";
  // final List<String> file = ["Measurement", "Bill"];
  final TextEditingController _notesController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Add async here
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      Provider.of<file_ty.FileTypesProvider>(
        context,
        listen: false,
      ).fetchFileTypes(token!);
    });
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 229, 218),
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.work_outline_outlined),
            SizedBox(width: 18),
            Text("Work Details", style: TextStyle(fontWeight: FontWeight.w300)),
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Customer Details Section
              _buildCustomerDetailsSection(),

              // Kitchen Details Section
              _buildKitchenDetailsSection(),

              // Task Files Section (conditionally shown)
              // if (widget.task.subTasks?.firstOrNull?.taskFiles?.isNotEmpty ??
              //     false)
              _buildTaskFilesSection(),

              // Phase and File Upload Section
              _buildPhaseAndUploadSection(),

              // Submit Button
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomerDetailsSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 33, left: 22, right: 22),
      child: Container(
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
                  const Icon(Icons.person_outline, color: Colors.red, size: 30),
                  const SizedBox(width: 10),
                  Text(
                    widget.task.customer?.name ?? "N/A",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Divider(color: Colors.grey, thickness: 1, height: 20),
              Row(
                children: [
                  const Icon(Icons.phone_outlined, color: Colors.red, size: 30),
                  const SizedBox(width: 10),
                  Text(
                    widget.task.customer?.contactNumber ?? "N/A",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const Divider(color: Colors.grey, thickness: 1, height: 20),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Colors.red,
                    size: 30,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      '${widget.task.customer?.location ?? "N/A"}, ${widget.task.customer?.state ?? ""}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              if (widget.task.taskGoogleLink?.isNotEmpty ?? false) ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    const SizedBox(width: 44),
                    Expanded(
                      child: TextButton(
                        onPressed:
                            () => _launchUrl(widget.task.taskGoogleLink!),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.blue,
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          widget.task.taskGoogleLink!,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildKitchenDetailsSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 13, left: 22, right: 22),
      child: Container(
        height: 150,
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
                  const Text('Kitchen Specific:'),
                  const SizedBox(width: 10),
                  Text(
                    widget.task.taskProduct?.isNotEmpty ?? false
                        ? widget.task.taskProduct!
                        : "Not specified",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const Divider(color: Colors.grey, thickness: 1, height: 20),
              Row(
                children: [
                  const Text('Task Mode:'),
                  const SizedBox(width: 10),
                  Text(
                    widget.task.taskType?.isNotEmpty ?? false
                        ? widget.task.taskType!
                        : "Not specified",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              if (widget.task.stage != null &&
                  widget.task.stage!.trim().isNotEmpty)
                const Divider(color: Colors.grey, thickness: 1, height: 20),
              if (widget.task.stage != null &&
                  widget.task.stage!.trim().isNotEmpty)
                Row(
                  children: [
                    const Text('Task Stage:'),
                    const SizedBox(width: 10),
                    Text(
                      widget.task.taskType?.isNotEmpty ?? false
                          ? widget.task.stage!
                          : "Not specified",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTaskFilesSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 13, left: 22, right: 22),
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(minHeight: 300),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 244, 249, 238),
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTaskFilesDisplay(),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 11, right: 11),
                  child: Text(
                    widget.task.taskName ?? "",
                    // ? widget.task.taskNote??""
                    //? "No task name provided":"",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    top: 4,
                    left: 11,
                    right: 11,
                    bottom: 11,
                  ),
                  child: Text(
                    widget.task.taskNote ?? "",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                    softWrap: true,
                  ),
                ),
                if (widget.task.customerServiceRequest != null &&
                    widget.task.customerServiceRequest!.trim().isNotEmpty)
                  const Divider(
                    color: Color.fromARGB(255, 177, 175, 175),
                    thickness: 1,
                    height: 20,
                  ),
                if (widget.task.customerServiceRequest != null &&
                    widget.task.customerServiceRequest!.trim().isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      left: 11,
                      right: 11,
                      bottom: 11,
                    ),
                    child: Text(
                      widget.task.customerServiceRequest ?? "",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                      softWrap: true,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhaseAndUploadSection() {
    return Padding(
      padding: EdgeInsets.only(top: 13, left: 22, right: 22),
      child: Container(
        // height: 400,
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
              if (widget.task.taskType == "Installation")
                Row(
                  children: [
                    const Text('Phase:'),
                    const SizedBox(width: 10),
                    DropdownButton<String>(
                      value: selectedPhase,
                      items:
                          phases.map((String phase) {
                            return DropdownMenuItem<String>(
                              value: phase,
                              child: Text(phase),
                            );
                          }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedPhase = newValue!;
                        });
                      },
                    ),
                  ],
                ),
              if (widget.task.taskType == "Installation")
                const Divider(color: Colors.grey, thickness: 1, height: 20),
              _buildFileTypeDropdown(),
              const Divider(color: Colors.grey, thickness: 1, height: 20),
              Row(
                children: [
                  const Text('File Upload:'),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _uploadFile,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      minimumSize: const Size(40, 40),
                    ),
                    child: const Icon(
                      Icons.file_upload,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
              const Divider(color: Colors.grey, thickness: 1, height: 20),
              // const Row(
              //   children: [
              //     Text('Notes:'),
              //     SizedBox(width: 10),
              //   ],
              // ),
              // TextFormField(
              //   controller: _notesController,
              //   decoration: const InputDecoration(
              //     hintText: 'Enter your note here',
              //     border: OutlineInputBorder(),
              //   ),
              //   maxLines: 5,
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter notes before submitting';
              //     }
              //     return null;
              //   },
              // ),
              Row(
                children: [
                  Text('Notes:'),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _notesController,
                      decoration: const InputDecoration(
                        hintText: 'Enter your note here',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 5,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter notes before submitting';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildFileTypeDropdown() {
  //   final fileTypesProvider = Provider.of<file_ty.FileTypesProvider>(context);

  //   if (fileTypesProvider.isLoading) {
  //     return const Center(child: CircularProgressIndicator());
  //   }

  //   if (fileTypesProvider.error != null) {
  //     return Text(
  //       'Error: ${fileTypesProvider.error}',
  //       style: const TextStyle(color: Colors.red),
  //     );
  //   }

  //   if (fileTypesProvider.fileTypes.isEmpty) {
  //     return const Text('No file types available');
  //   }
  //   return Row(
  //     children: [
  //       const Text('File Type:'),
  //       const SizedBox(width: 10),
  //       DropdownButton<file_ty.Data>(
  //         hint: Text("Select File Type"),
  //         value: _selectedFileType,
  //         items: fileTypesProvider.fileTypes.map((file_ty.Data fileType) {
  //           return DropdownMenuItem<file_ty.Data>(
  //             value: fileType,
  //             child: Text(fileType.name ?? ''),
  //           );
  //         }).toList(),
  //         onChanged: (file_ty.Data? newValue) {
  //           setState(() {
  //             _selectedFileType = newValue;
  //           });
  //         },
  //       ),
  //     ],
  //   );
  // }

  Widget _buildFileTypeDropdown() {
    final fileTypesProvider = Provider.of<file_ty.FileTypesProvider>(context);

    if (fileTypesProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (fileTypesProvider.error != null) {
      return Text(
        'Error: ${fileTypesProvider.error}',
        style: const TextStyle(color: Colors.red),
      );
    }

    if (fileTypesProvider.fileTypes.isEmpty) {
      return const Text('No file types available');
    }

    return Row(
      children: [
        const Text('File Type:'),
        const SizedBox(width: 10),
        DropdownButton<file_ty.Data>(
          hint: const Text("Select File Type"),
          value: _selectedFileType,
          items:
              fileTypesProvider.fileTypes.map((file_ty.Data fileType) {
                return DropdownMenuItem<file_ty.Data>(
                  value: fileType,
                  child: Text(fileType.name ?? ''),
                );
              }).toList(),
          onChanged: (file_ty.Data? newValue) {
            setState(() {
              _selectedFileType = newValue;
            });

            // Print the selected file type ID (assuming fileType has an 'id' property)
            if (newValue != null) {
              selectedFileId = newValue.id;
              print("Selected File Type ID: ${newValue.id}");
            }
          },
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 13, left: 22, right: 22, bottom: 22),
      child: SizedBox(
        width: 500,
        child: ElevatedButton(
          onPressed: _submitForm,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
          ),
          child: const Text(
            "Submit",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  // void _uploadFile() async {
  //   try {
  //     // 1. Pick file
  //     FilePickerResult? result = await FilePicker.platform.pickFiles(
  //       type: FileType.custom,
  //       allowedExtensions: ['jpg', 'jpeg', 'png'],
  //       allowMultiple: false,
  //     );

  //     if (result != null) {

  //       PlatformFile file = result.files.first;

  //       // 2. Validate file
  //       if (file.size > 5 * 1024 * 1024) {
  //         // 5MB limit
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           const SnackBar(content: Text('File size should be less than 5MB')),
  //         );
  //         return;
  //       }

  //       // 3. Show upload progress
  //       showDialog(
  //         context: context,
  //         barrierDismissible: false,
  //         builder: (context) => AlertDialog(
  //           title: Row(
  //             children: [
  //               Text('Uploading File'),
  //               SizedBox(
  //                 width: 8,
  //               ),
  //               Icon(
  //                 Icons.upload,
  //                 color: Colors.green,
  //               )
  //             ],
  //           ),
  //           content: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               const CircularProgressIndicator(
  //                 color: Colors.green,
  //               ),
  //               const SizedBox(height: 16),
  //               Text('Uploading: ${file.name}'),
  //             ],
  //           ),
  //         ),
  //       );

  //       // 4. Simulate upload (replace with actual API call)
  //       // In a real app, you would use Dio, http, or another package
  //       // to upload to your backend
  //       await Future.delayed(
  //           const Duration(seconds: 2)); // Simulate upload delay

  //       // 5. Close dialog and show success
  //       Navigator.of(context).pop(); // Close progress dialog
  //       setState(() {
  //         _uploadedFilpath = file.path; // Store the filename
  //       });

  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('${file.name} uploaded successfully'),
  //           backgroundColor: Colors.green,
  //         ),
  //       );

  //       // 6. Update UI with the new file (if needed)
  //       setState(() {
  //         // Add your logic to update the UI with the new file
  //       });
  //     }
  //   } catch (e) {
  //     Navigator.of(context).pop(); // Close progress dialog if open
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Error uploading file: ${e.toString()}'),
  //         backgroundColor: Colors.red,
  //       ),
  //     );
  //   }
  // }
  void _uploadFile() async {
    try {
      // 1. Pick file
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png'],
        allowMultiple: false,
      );

      if (result != null) {
        PlatformFile file = result.files.first;

        // 2. Validate file
        if (file.size > 5 * 1024 * 1024) {
          // 5MB limit
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('File size should be less than 5MB')),
          );
          return;
        }

        // 3. Show upload progress
        showDialog(
          context: context,
          barrierDismissible: false,
          builder:
              (context) => AlertDialog(
                title: Row(
                  children: [
                    const Text('Uploading File'),
                    const SizedBox(width: 8),
                    const Icon(Icons.upload, color: Colors.green),
                  ],
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircularProgressIndicator(color: Colors.green),
                    const SizedBox(height: 16),
                    Text('Uploading: ${file.name}'),
                  ],
                ),
              ),
        );

        // 4. Simulate upload (replace with actual API call)
        await Future.delayed(const Duration(seconds: 2));

        // 5. Close dialog and show success
        Navigator.of(context).pop(); // Close progress dialog

        // Store the file in the list
        setState(() {
          uploadedFiles.add(
            File(file.path!),
          ); // Convert to File and add to list
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${file.name} uploaded successfully'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      Navigator.of(context).pop(); // Close progress dialog if open
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error uploading file: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // void _submitForm() {
  //   if ((_formKey.currentState?.validate() ?? false) &&
  //       _selectedFileType != null &&
  //       _notesController.text.isNotEmpty) {
  //     // Form is valid, proceed with submission
  //     completePhase1Task(widget.task.subTasks![0].taskId.toString(),widget.task.subTasks![0].subTaskId.toString(),selectedFileId!,uploadedFiles,_notesController.text,context);
  //     // Add your submission logic here
  //   } else if (_selectedFileType == null) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text(
  //           '*Please File Type',
  //           style: TextStyle(color: Colors.white),
  //         ),
  //         backgroundColor: CupertinoColors.destructiveRed,
  //       ),
  //     );
  //   }

  // }

  //   void _submitForm() async {
  //   // Validate all required fields first
  //   if (!(_formKey.currentState?.validate() ?? false) ||
  //       _selectedFileType == null ||
  //       _notesController.text.isEmpty ||
  //       uploadedFiles.isEmpty) {
  //     // ... (keep existing validation messages)
  //     return;
  //   }

  //   try {
  //     // Get the appropriate task ID based on task type
  //     int taskId;
  //     int? subTaskId;

  //     if (widget.task.taskType == "Installation") {
  //       // For installation tasks, use subtask ID and validate phase
  //       if (selectedPhase != "End") {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           const SnackBar(
  //             content: Text('Task can only be submitted in "End" phase'),
  //             backgroundColor: Colors.red,
  //           ),
  //         );
  //         return;
  //       }
  //       subTaskId = widget.task.subTasks?[0].subTaskId;
  //       taskId = widget.task.subTasks?[0].taskId ?? 0;
  //     } else {
  //       // For service tasks, use main task ID
  //       taskId = widget.task.id ?? 0;
  //     }

  //     if (taskId == 0 || (widget.task.taskType == "Installation" && subTaskId == null)) {
  //       throw Exception('Invalid task ID');
  //     }

  //     // Show loading indicator
  //     showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (context) => const Center(child: CircularProgressIndicator()),
  //     );

  //     // Call the appropriate API
  //     bool success;
  //     if (widget.task.taskType == "Installation") {
  //       success = await completePhase1Task(
  //         taskId,
  //         subTaskId!,
  //         selectedFileId!,
  //         uploadedFiles,
  //         _notesController.text,
  //         context,
  //       );
  //     } else {
  //       success = await completePhase2Task(
  //         widget.task.id??0,
  //         selectedFileId!,
  //         uploadedFiles,
  //         _notesController.text,
  //         context,
  //       );
  //     }

  //     // Remove loading indicator
  //     if (mounted) Navigator.of(context).pop();

  //     // Handle success
  //     if (success && mounted) {
  //       Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(
  //           builder: (context) => widget.pagename == "Active"
  //               ? ActiveService()
  //               : Todayslists(),
  //         ),
  //       );
  //       //Navigator.pop(context); // when it pop refresh that page

  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           content: Text('Task completed successfully!'),
  //           backgroundColor: Colors.green,
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     if (mounted) {
  //       Navigator.of(context).pop();
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('Error: ${e.toString()}'),
  //           backgroundColor: Colors.red,
  //         ),
  //       );
  //     }
  //   }
  // }
  // void _submitForm() async {
  //   print("fgdgdgdgdgdggdd");
  //   // Validate all required fields first
  //   if (!(_formKey.currentState?.validate() ?? false) ||
  //       _selectedFileType == null ||
  //       _notesController.text.isEmpty ||
  //       uploadedFiles.isEmpty) {
  //     // ... (keep existing validation messages)
  //     return;
  //   }

  //   try {
  //     // Get the appropriate task ID based on task type
  //     int taskId;
  //     int? subTaskId;

  //     if (widget.task.taskType == "Installation") {
  //       // For installation tasks, use subtask ID and validate phase
  //       // if (selectedPhase != "End") {
  //       //   ScaffoldMessenger.of(context).showSnackBar(
  //       //     const SnackBar(
  //       //       content: Text('Task can only be submitted in "End" phase'),
  //       //       backgroundColor: Colors.red,
  //       //     ),
  //       //   );
  //       //   return;
  //       // }
  //       subTaskId = widget.task.subTasks?[0].subTaskId;
  //       taskId = widget.task.subTasks?[0].taskId ?? 0;
  //     } else {
  //       // For service tasks, use main task ID
  //       subTaskId = null;
  //       taskId = widget.task.id ?? 0;
  //     }

  //     if (taskId == 0 ||
  //         (widget.task.taskType == "Installation" && subTaskId == null)) {
  //       throw Exception('Invalid task ID');
  //     }

  //     // Show loading indicator
  //     showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (context) => const Center(child: CircularProgressIndicator()),
  //     );

  //     // Call the appropriate API
  //     bool success;
  //     // if (widget.task.taskType == "Installation") {
  //     //   success = await completePhase1Task(
  //     //     taskId,
  //     //     subTaskId!,
  //     //     selectedFileId!,
  //     //     uploadedFiles,
  //     //     _notesController.text,
  //     //     context,
  //     //   );
  //     // } else {
  //     //   success = await completePhase2Task(
  //     //     widget.task.id ?? 0,
  //     //     selectedFileId!,
  //     //     uploadedFiles,
  //     //     _notesController.text,
  //     //     context,
  //     //   );
  //     // }
  //     success = await completePhase1Task(
  //       taskId,
  //       subTaskId!,
  //       selectedFileId!,
  //       uploadedFiles,
  //       _notesController.text,
  //       context,
  //     );

  //     // Remove loading indicator
  //     if (mounted) Navigator.of(context).pop();

  //     // Handle success
  //     if (success && mounted) {
  //       Navigator.of(context).pop(true); // Pass true to indicate refresh needed
  //     }
  //   } catch (e) {
  //     if (mounted) {
  //       print(e);
  //       Navigator.of(context).pop();
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('Errorssssssssssssss: ${e.toString()}'),
  //           backgroundColor: Colors.red,
  //         ),
  //       );
  //     }
  //   }
  // }
  void _submitForm() async {
    if (!(_formKey.currentState?.validate() ?? false) ||
        _selectedFileType == null ||
        _notesController.text.isEmpty ||
        uploadedFiles.isEmpty ||
        selectedFileId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill all required fields."),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      int taskId;
      int? subTaskId;

      if (widget.task.taskType == "Installation") {
        // Ensure subTasks is not null or empty
        if (widget.task.subTasks == null || widget.task.subTasks!.isEmpty) {
          throw Exception("No subtask found for Installation task");
        }

        subTaskId = widget.task.subTasks![0].subTaskId;
        taskId = widget.task.subTasks![0].taskId ?? 0;
      } else {
        subTaskId = null;
        taskId = widget.task.id ?? 0;
      }

      if (taskId == 0 ||
          (widget.task.taskType == "Installation" && subTaskId == null)) {
        throw Exception('Invalid task or subtask ID');
      }

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );

      bool success = await completePhase1Task(
        taskId,
        subTaskId ?? 0, // safe fallback instead of `!`
        selectedFileId!, // safe now, already validated above
        uploadedFiles,
        _notesController.text,
        context,
      );

      if (mounted) Navigator.of(context).pop();

      if (success && mounted) {
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _launchUrl(String url) async {
    try {
      if (!await launchUrl(Uri.parse(url))) {
        throw 'Could not launch $url';
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
    }
  }

  Widget _buildTaskFilesDisplay() {
    // final taskFiles =
    //     widget.task.subTasks?.firstOrNull?.taskFiles ?? widget.task.taskFiles;
    final taskFiles =
        widget.task.subTasks?.firstOrNull?.taskFiles ??
        widget.task.taskFiles ??
        [];

    if (taskFiles!.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.folder_open, size: 40, color: Colors.grey),
            SizedBox(height: 8),
            Text('No files attached', style: TextStyle(color: Colors.grey)),
          ],
        ),
      );
    }

    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 11),
        child: Container(
          width: 300,
          height: 200,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 213, 199, 198),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: _buildFileContent(taskFiles),
          ),
        ),
      ),
    );
  }

  // Widget _buildFileContent(List<TaskFiles> taskFiles) {
  //   if (taskFiles.length == 1 &&
  //       taskFiles.first.name?.toLowerCase().endsWith('.jpg') == true) {
  //     return GestureDetector(
  //       onTap: () => _showZoomableImageDialog(context, taskFiles.first),
  //       child: Image.network(
  //         "${taskFiles.first.name}",
  //         fit: BoxFit.cover,
  //         loadingBuilder: (context, child, loadingProgress) {
  //           if (loadingProgress == null) return child;
  //           return Center(
  //             child: CircularProgressIndicator(
  //               value:
  //                   loadingProgress.expectedTotalBytes != null
  //                       ? loadingProgress.cumulativeBytesLoaded /
  //                           loadingProgress.expectedTotalBytes!
  //                       : null,
  //             ),
  //           );
  //         },
  //         errorBuilder: (context, error, stackTrace) {
  //           return const Center(
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Icon(Icons.broken_image, size: 40),
  //                 SizedBox(height: 8),
  //                 Text('Failed to load image'),
  //               ],
  //             ),
  //           );
  //         },
  //       ),
  //     );
  //   }

  //   final imageFiles =
  //       taskFiles.where((file) {
  //         final fileName = file.name?.toLowerCase() ?? '';
  //         return fileName.endsWith('.jpg') ||
  //             fileName.endsWith('.jpeg') ||
  //             fileName.endsWith('.png');
  //       }).toList();

  //   if (imageFiles.isEmpty) {
  //     return const SizedBox.shrink(); // don’t show anything if no images
  //   }

  //   return ListView.builder(
  //     //padding: const EdgeInsets.all(8),
  //     //itemCount: imageFiles.length,
  //     itemBuilder: (context, index) {
  //       final file = imageFiles[index];
  //       final fileName = file.name?.split('/').last ?? 'file';

  //       return InkWell(
  //         borderRadius: BorderRadius.circular(8),
  //         onTap: () => _showZoomableImageDialog(context, file),
  //         child: Image.network(
  //           file.name ?? '',
  //           // height: 100,
  //           fit: BoxFit.cover,
  //           loadingBuilder: (context, child, loadingProgress) {
  //             if (loadingProgress == null) return child;
  //             return Center(
  //               child: CircularProgressIndicator(
  //                 value:
  //                     loadingProgress.expectedTotalBytes != null
  //                         ? loadingProgress.cumulativeBytesLoaded /
  //                             loadingProgress.expectedTotalBytes!
  //                         : null,
  //               ),
  //             );
  //           },
  //           errorBuilder: (context, error, stackTrace) {
  //             return const Center(
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Icon(Icons.broken_image, size: 40),
  //                   SizedBox(height: 8),
  //                   Text('Failed to load image'),
  //                 ],
  //               ),
  //             );
  //           },
  //         ),
  //       );
  //     },
  //   );
  // }
  Widget _buildFileContent(List<TaskFiles> taskFiles) {
    // filter only images
    final imageFiles =
        taskFiles.where((file) {
          final fileName = file.name?.toLowerCase() ?? '';
          return fileName.endsWith('.jpg') ||
              fileName.endsWith('.jpeg') ||
              fileName.endsWith('.png');
        }).toList();

    if (imageFiles.isEmpty) {
      return const SizedBox.shrink(); // no images → show nothing
    }

    // case 1: only one image
    if (imageFiles.length == 1) {
      final file = imageFiles.first;
      return GestureDetector(
        onTap: () => _showZoomableImageDialog(context, file),
        child: Image.network(
          file.name ?? '',
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value:
                    loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.broken_image, size: 40),
                  SizedBox(height: 8),
                  Text('Failed to load image'),
                ],
              ),
            );
          },
        ),
      );
    }

    // case 2: multiple images → show grid
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 images per row
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: imageFiles.length,
      itemBuilder: (context, index) {
        final file = imageFiles[index];
        return GestureDetector(
          onTap: () => _showZoomableImageDialog(context, file),
          child: Image.network(
            file.name ?? '',
            fit: BoxFit.cover,
            errorBuilder:
                (context, error, stackTrace) =>
                    const Icon(Icons.broken_image, size: 40),
          ),
        );
      },
    );
  }

  void _showZoomableImageDialog(BuildContext context, TaskFiles file) {
    final fileName = file.name?.split('/').last ?? 'file';
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(20),
          child: InteractiveViewer(
            panEnabled: true,
            minScale: 0.5,
            maxScale: 4.0,
            child: Stack(
              children: [
                Center(
                  child: Image.network("${file.name}", fit: BoxFit.contain),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.black),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


// import 'package:design/model/activeservicemodel.dart';
// import 'package:design/model/filetype.dart';
// import 'package:design/provider/fileuploadprovider.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher.dart';

// class WorkDetails extends StatefulWidget {
//   final Data task;
//   const WorkDetails({super.key, required this.task});

//   @override
//   State<WorkDetails> createState() => _WorkDetailsState();
// }

// class _WorkDetailsState extends State<WorkDetails> {
//   String selectedPhase = "Start";
//   final List<String> phases = ["Start", "End"];
//   String? selectedFile;
//   final TextEditingController _notesController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       final provider = Provider.of<FileTypesProvider>(context, listen: false);
//       if (provider.fileTypes.isNotEmpty) {
//         setState(() => selectedFile = provider.fileTypes.first.name);
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _notesController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 246, 229, 218),
//       appBar: AppBar(
//         title: const Row(
//           children: [
//             Icon(Icons.work_outline_outlined),
//             SizedBox(width: 18),
//             Text("Work Details", style: TextStyle(fontWeight: FontWeight.w300)),
//           ],
//         ),
//       ),
//       body: Form(
//         key: _formKey,
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               _buildCustomerDetailsSection(),
//               _buildKitchenDetailsSection(),
//               if (widget.task.subTasks?.isNotEmpty == true &&
//                   widget.task.subTasks?.first.taskFiles?.isNotEmpty == true)
//                 _buildTaskFilesSection(),
//               _buildPhaseAndUploadSection(),
//               _buildSubmitButton(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCustomerDetailsSection() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 33, left: 22, right: 22),
//       child: Container(
//         width: double.infinity,
//         decoration: const BoxDecoration(
//           color: Color.fromARGB(255, 244, 249, 238),
//           borderRadius: BorderRadius.all(Radius.circular(6)),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   const Icon(Icons.person_outline, color: Colors.red, size: 30),
//                   const SizedBox(width: 10),
//                   Text(
//                     widget.task.customer?.name ?? "N/A",
//                     style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               const Divider(color: Colors.grey, thickness: 1, height: 20),
//               Row(
//                 children: [
//                   const Icon(Icons.phone_outlined, color: Colors.red, size: 30),
//                   const SizedBox(width: 10),
//                   Text(
//                     widget.task.customer?.contactNumber ?? "N/A",
//                     style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
//                   ),
//                 ],
//               ),
//               const Divider(color: Colors.grey, thickness: 1, height: 20),
//               Row(
//                 children: [
//                   const Icon(Icons.location_on_outlined, color: Colors.red, size: 30),
//                   const SizedBox(width: 10),
//                   Expanded(
//                     child: Text(
//                       '${widget.task.customer?.location ?? "N/A"}, ${widget.task.customer?.state ?? ""}',
//                       style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
//                     ),
//                   ),
//                 ],
//               ),
//               if (widget.task.taskGoogleLink?.isNotEmpty == true) ...[
//                 const SizedBox(height: 8),
//                 Row(
//                   children: [
//                     const SizedBox(width: 44),
//                     Expanded(
//                       child: TextButton(
//                         onPressed: () => _launchUrl(widget.task.taskGoogleLink!),
//                         style: TextButton.styleFrom(
//                           foregroundColor: Colors.blue,
//                           padding: EdgeInsets.zero,
//                           minimumSize: Size.zero,
//                           tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                         ),
//                         child: Text(
//                           widget.task.taskGoogleLink!,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildKitchenDetailsSection() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 13, left: 22, right: 22),
//       child: Container(
//         height: 150,
//         width: double.infinity,
//         decoration: const BoxDecoration(
//           color: Color.fromARGB(255, 244, 249, 238),
//           borderRadius: BorderRadius.all(Radius.circular(6)),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   const Text('Kitchen Specific:'),
//                   const SizedBox(width: 10),
//                   Text(
//                     widget.task.taskProduct ?? "Not specified",
//                     style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//                   ),
//                 ],
//               ),
//               const Divider(color: Colors.grey, thickness: 1, height: 20),
//               Row(
//                 children: [
//                   const Text('Task Mode:'),
//                   const SizedBox(width: 10),
//                   Text(
//                     widget.task.taskType ?? "Not specified",
//                     style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTaskFilesSection() {
//     final taskFiles = widget.task.subTasks?.first.taskFiles ?? [];
//     return Padding(
//       padding: const EdgeInsets.only(top: 13, left: 22, right: 22),
//       child: Column(
//         children: [
//           Container(
//             constraints: const BoxConstraints(minHeight: 300),
//             decoration: const BoxDecoration(
//               color: Color.fromARGB(255, 244, 249, 238),
//               borderRadius: BorderRadius.all(Radius.circular(6)),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 _buildTaskFilesDisplay(taskFiles),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 8, left: 11, right: 11),
//                   child: Text(
//                     widget.task.subTasks!.first.taskName ?? "No task name provided",
//                     style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 8, left: 11, right: 11, bottom: 11),
//                   child: Text(
//                     widget.task.subTasks!.first.taskNote ?? "No task notes provided",
//                     style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPhaseAndUploadSection() {
//     final fileTypesProvider = Provider.of<FileTypesProvider>(context);
    
//     return Padding(
//       padding: const EdgeInsets.only(top: 13, left: 22, right: 22),
//       child: Container(
//         width: double.infinity,
//         decoration: const BoxDecoration(
//           color: Color.fromARGB(255, 244, 249, 238),
//           borderRadius: BorderRadius.all(Radius.circular(6)),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               if (widget.task.taskType == "Installation") ...[
//                 Row(
//                   children: [
//                     const Text('Phase:'),
//                     const SizedBox(width: 10),
//                     DropdownButton<String>(
//                       value: selectedPhase,
//                       items: phases.map((String phase) {
//                         return DropdownMenuItem<String>(
//                           value: phase,
//                           child: Text(phase),
//                         );
//                       }).toList(),
//                       onChanged: (String? newValue) {
//                         setState(() => selectedPhase = newValue!);
//                       },
//                     ),
//                   ],
//                 ),
//                 const Divider(color: Colors.grey, thickness: 1, height: 20),
//               ],
//               Row(
//                 children: [
//                   const Text('File Type:'),
//                   const SizedBox(width: 10),
//                   if (fileTypesProvider.isLoading)
//                     const CircularProgressIndicator()
//                   else if (fileTypesProvider.fileTypes.isEmpty)
//                     const Text('No file types available')
//                   else
//                     DropdownButton<String>(
//                       value: selectedFile,
//                       items: fileTypesProvider.fileTypes.map((Data type) {
//                         return DropdownMenuItem<String>(
//                           value: type.name,
//                           child: Text(type.name ?? ''),
//                         );
//                       } as Function(Data e)).toList(),
//                       onChanged: (String? newValue) {
//                         setState(() => selectedFile = newValue);
//                       },
//                     ),
//                 ],
//               ),
//               const Divider(color: Colors.grey, thickness: 1, height: 20),
//               Row(
//                 children: [
//                   const Text('File Upload:'),
//                   const SizedBox(width: 10),
//                   ElevatedButton(
//                     onPressed: _uploadFile,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(4)),
//                       minimumSize: const Size(40, 40),
//                     ),
//                     child: const Icon(Icons.file_upload, color: Colors.white, size: 20),
//                   ),
//                 ],
//               ),
//               const Divider(color: Colors.grey, thickness: 1, height: 20),
//               Row(
//                 children: [
//                   const Text('Notes:'),
//                   const SizedBox(width: 10),
//                   Expanded(
//                     child: TextFormField(
//                       controller: _notesController,
//                       decoration: const InputDecoration(
//                         hintText: 'Enter your note here',
//                         border: OutlineInputBorder(),
//                       ),
//                       maxLines: 5,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter notes before submitting';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSubmitButton() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 13, left: 22, right: 22, bottom: 22),
//       child: SizedBox(
//         width: 500,
//         child: ElevatedButton(
//           onPressed: _submitForm,
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.green,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8)),
//             padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
//           ),
//           child: const Text(
//             "Submit",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
//           ),
//         ),
//       ),
//     );
//   }

//   void _uploadFile() async {
//     if (selectedFile == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please select a file type first')));
//       return;
//     }

//     try {
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//         type: FileType.custom,
//         allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf', 'doc', 'docx'],
//         allowMultiple: false,
//       );

//       if (result != null) {
//         PlatformFile file = result.files.first;
        
//         if (file.size > 5 * 1024 * 1024) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('File size should be less than 5MB')));
//           return;
//         }

//         showDialog(
//           context: context,
//           barrierDismissible: false,
//           builder: (context) => AlertDialog(
//             title: const Text('Uploading File'),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const CircularProgressIndicator(),
//                 const SizedBox(height: 16),
//                 Text('Uploading ${file.name} as $selectedFile'),
//               ],
//             ),
//           ),
//         );

//         await Future.delayed(const Duration(seconds: 2));

//         if (mounted) {
//           Navigator.of(context).pop();
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text('$selectedFile: ${file.name} uploaded successfully'),
//               backgroundColor: Colors.green,
//             ),
//           );
//         }
//       }
//     } catch (e) {
//       if (mounted) {
//         Navigator.of(context).maybePop();
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Error uploading file: ${e.toString()}'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     }
//   }

//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       final provider = Provider.of<FileTypesProvider>(context, listen: false);
//       final selectedType = provider.fileTypes.firstWhere(
//         (type) => type.name == selectedFile,
//         orElse: () => Data(),
//       );

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Form submitted successfully')),
//       );
//     }
//   }

//   Future<void> _launchUrl(String url) async {
//     try {
//       if (!await launchUrl(Uri.parse(url))) {
//         throw 'Could not launch $url';
//       }
//     } catch (e) {
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Error: ${e.toString()}')),
//         );
//       }
//     }
//   }

//   Widget _buildTaskFilesDisplay(List<TaskFiles> taskFiles) {
//     if (taskFiles.isEmpty) {
//       return const Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.folder_open, size: 40, color: Colors.grey),
//             SizedBox(height: 8),
//             Text('No files attached', style: TextStyle(color: Colors.grey)),
//           ],
//         ),
//       );
//     }

//     if (taskFiles.length == 1 && taskFiles.first.name?.toLowerCase().endsWith('.jpg') == true) {
//       return GestureDetector(
//         onTap: () => _showZoomableImageDialog(context, taskFiles.first),
//         child: Image.network(
//           "https://kuche7.devcom.live/public/storage/${taskFiles.first.name}",
//           fit: BoxFit.cover,
//           loadingBuilder: (context, child, loadingProgress) {
//             if (loadingProgress == null) return child;
//             return Center(
//               child: CircularProgressIndicator(
//                 value: loadingProgress.expectedTotalBytes != null
//                     ? loadingProgress.cumulativeBytesLoaded /
//                         loadingProgress.expectedTotalBytes!
//                     : null,
//               ),
//             );
//           },
//           errorBuilder: (context, error, stackTrace) {
//             return const Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.broken_image, size: 40),
//                   SizedBox(height: 8),
//                   Text('Failed to load image'),
//                 ],
//               ),
//             );
//           },
//         ),
//       );
//     }

//     return ListView.builder(
//       padding: const EdgeInsets.all(8),
//       itemCount: taskFiles.length,
//       itemBuilder: (context, index) {
//         final file = taskFiles[index];
//         final fileName = file.name?.split('/').last ?? 'file';
//         final isImage = fileName.toLowerCase().endsWith('.jpg') ||
//             fileName.toLowerCase().endsWith('.png') ||
//             fileName.toLowerCase().endsWith('.jpeg');

//         return Card(
//           margin: const EdgeInsets.symmetric(vertical: 4),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//           child: InkWell(
//             borderRadius: BorderRadius.circular(8),
//             onTap: () => isImage ? _showZoomableImageDialog(context, file) : null,
//             child: Padding(
//               padding: const EdgeInsets.all(12),
//               child: Row(
//                 children: [
//                   Icon(isImage ? Icons.image : Icons.insert_drive_file, color: Colors.blue),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: Text(fileName, overflow: TextOverflow.ellipsis),
//                   ),
//                   if (isImage) const Icon(Icons.zoom_in, color: Colors.grey),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void _showZoomableImageDialog(BuildContext context, TaskFiles file) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return Dialog(
//           insetPadding: const EdgeInsets.all(20),
//           child: InteractiveViewer(
//             panEnabled: true,
//             minScale: 0.5,
//             maxScale: 4.0,
//             child: Stack(
//               children: [
//                 Center(
//                   child: Image.network(
//                     "https://kuche7.devcom.live/public/storage/${file.name}",
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//                 Positioned(
//                   top: 10,
//                   right: 10,
//                   child: IconButton(
//                     icon: const Icon(Icons.close, color: Colors.black),
//                     onPressed: () => Navigator.of(context).pop(),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }