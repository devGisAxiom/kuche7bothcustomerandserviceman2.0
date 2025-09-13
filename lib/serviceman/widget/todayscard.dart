// import 'package:design/clientdetailpage.dart';
// import 'package:flutter/material.dart';

// class Todaystaskcard extends StatefulWidget {
//   final int id;
//   final String taskType;
//   final String taskstatus;
//   final int taskphase;
//   final String taskdate;
//   final List<String> materials;
//   const Todaystaskcard(
//       {super.key,
//       required this.id,
//       required this.taskType,
//       required this.taskphase,
//       required this.taskdate,
//       required this.materials,
//       required this.taskstatus});

//   @override
//   State<Todaystaskcard> createState() => _TodaystaskcardState();
// }

// class _TodaystaskcardState extends State<Todaystaskcard> {
//   bool isExpanded = false;

//   // Example list of materials
//   // final List<String> materials = ["Odo meter", "Battery", "Cable", "Sensor"];

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(11.0),
//           child: AnimatedContainer(
//             duration: const Duration(milliseconds: 300),
//             constraints: const BoxConstraints(minHeight: 300),
//             width: 600,
//             decoration: BoxDecoration(
//               color: const Color.fromARGB(255, 246, 229, 218),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 20, top: 20),
//                   child: Row(
//                     children: [
//                       Container(
//                         height: 55,
//                         width: 55,
//                         decoration: const BoxDecoration(
//                           color: Color.fromARGB(138, 227, 163, 121),
//                           shape: BoxShape.circle,
//                         ),
//                         child: const Center(
//                           child: Icon(
//                             Icons.today_outlined,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 10),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           if (widget.taskType == "Installation")
//                             Text(
//                               '${widget.taskType} Phase ${widget.taskphase}',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.brown,
//                               ),
//                             )
//                           else
//                             Text(
//                               '${widget.taskType}',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.brown,
//                               ),
//                             ),
//                           const SizedBox(height: 2),
//                           Text(
//                             'Id : #${widget.id}',
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.black54,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 12),

//                 // Divider
//                 Container(
//                   height: 1,
//                   width: 335,
//                   color: const Color.fromARGB(255, 219, 217, 217),
//                 ),

//                 // Date section
//                 Padding(
//                   padding: EdgeInsets.only(top: 14.0, left: 29),
//                   child: Row(
//                     children: [
//                       Icon(Icons.date_range_outlined),
//                       SizedBox(width: 5),
//                       Text(widget.taskdate),
//                     ],
//                   ),
//                 ),

//                 // Materials section
//                 const Padding(
//                   padding: EdgeInsets.only(top: 14.0, left: 29),
//                   child: Row(
//                     children: [
//                       Icon(Icons.build_outlined),
//                       SizedBox(width: 5),
//                       Text(
//                         "Material's",
//                         style: TextStyle(
//                           decoration: TextDecoration.underline,
//                           fontStyle: FontStyle.italic,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 8),

//                 // Materials List
//                 Column(
//                   children: List.generate(
//                     isExpanded ? widget.materials.length : 2,
//                     (index) => Padding(
//                       padding: const EdgeInsets.only(top: 2.0, left: 38),
//                       child: Row(
//                         children: [
//                           Text("${index + 1}."),
//                           const SizedBox(width: 5),
//                           Text(widget.materials[index]),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),

//                 // View More / Show Less Button
//                 if (widget.materials.length > 2)
//                   Padding(
//                     padding: const EdgeInsets.only(left: 38, top: 5),
//                     child: GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           isExpanded = !isExpanded;
//                         });
//                       },
//                       child: Text(
//                         isExpanded ? "Show Less" : "View More",
//                         style: const TextStyle(
//                           color: Colors.blue,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),

//                 const SizedBox(height: 6),

//                 // Buttons
//                 if (widget.taskstatus == "Pending")
//                   Padding(
//                     padding:
//                         const EdgeInsets.only(top: 8, left: 33, bottom: 30),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         // Accept Button
//                         OutlinedButton(
//                           onPressed: () {
//                             Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => WorkDetails(),
//                             ));
//                           },
//                           style: OutlinedButton.styleFrom(
//                             side:
//                                 const BorderSide(color: Colors.green, width: 2),
//                           ),
//                           child: const Text(
//                             'Accept',
//                             style: TextStyle(color: Colors.green),
//                           ),
//                         ),
//                         const SizedBox(width: 16),

//                         // Reject Button
//                         TextButton(
//                           onPressed: () {},
//                           child: const Text(
//                             'Reject',
//                             style: TextStyle(color: Colors.red),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// import 'package:design/serviceman/view/clientdetailpage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';

class Todaystaskcard extends StatefulWidget {
  final int id;
  final String taskType;
  final String taskstatus;
  final int taskphase;
  final String taskdate;
  final List<String> materials;
  final VoidCallback onAccept; // Add onAccept callback
  final VoidCallback onReject; // Add onReject callback
  final String customername;
  final String customeremail;
  final String customerPhone;
  final String location;
  final String locationlink;
  final VoidCallback onTapWhenAccepted;

  const Todaystaskcard({
    super.key,
    required this.id,
    required this.taskType,
    required this.taskphase,
    required this.taskdate,
    required this.materials,
    required this.taskstatus,
    required this.onAccept,
    required this.onReject,
    required this.customername,
    required this.customeremail,
    required this.customerPhone,
    required this.location,
    required this.locationlink,
    required this.onTapWhenAccepted,
  });

  @override
  State<Todaystaskcard> createState() => _TodaystaskcardState();
}

class _TodaystaskcardState extends State<Todaystaskcard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: GestureDetector(
            onTap: () {
              if (widget.taskstatus == "Accept") {
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => WorkDetails(),
                // ));
                widget.onTapWhenAccepted();
              }
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              constraints: const BoxConstraints(minHeight: 300),
              width: 600,
              decoration: BoxDecoration(
                color:
                    widget.taskstatus == "Reject"
                        ? const Color.fromARGB(
                          255,
                          161,
                          144,
                          144,
                        ) // Change color to gray if status is "Reject"
                        : const Color.fromARGB(
                          255,
                          246,
                          229,
                          218,
                        ), // Default color
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    child: Row(
                      children: [
                        Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            color:
                                widget.taskstatus == "Reject"
                                    ? const Color.fromARGB(255, 255, 255, 255)
                                    : Color.fromARGB(138, 227, 163, 121),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.today_outlined,
                              color:
                                  widget.taskstatus == "Reject"
                                      ? const Color.fromARGB(255, 161, 144, 144)
                                      : Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (widget.taskType == "Installation")
                              Text(
                                '${widget.taskType} Phase ${widget.taskphase}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown,
                                ),
                              )
                            else
                              Text(
                                '${widget.taskType}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown,
                                ),
                              ),
                            const SizedBox(height: 2),
                            Text(
                              'Id : #${widget.id}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Divider
                  Container(
                    height: 1,
                    width: 335,
                    color: const Color.fromARGB(255, 219, 217, 217),
                  ),

                  // Date section
                  Padding(
                    padding: EdgeInsets.only(top: 14.0, left: 29),
                    child: Row(
                      children: [
                        Icon(Icons.date_range_outlined),
                        SizedBox(width: 5),
                        Text(widget.taskdate),
                      ],
                    ),
                  ),

                  // Materials section
                  const Padding(
                    padding: EdgeInsets.only(top: 14.0, left: 29),
                    child: Row(
                      children: [
                        Icon(Icons.build_outlined),
                        SizedBox(width: 5),
                        Text(
                          "Material's",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Materials List
                  // Materials List
                  if (widget.materials.isNotEmpty)
                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Align items to the start
                      children: [
                        // Materials list items
                        ...List.generate(
                          widget.materials.length < 2
                              ? widget.materials.length
                              : (isExpanded ? widget.materials.length : 2),
                          (index) => Padding(
                            padding: const EdgeInsets.only(top: 2.0, left: 38),
                            child: Row(
                              children: [
                                Text("${index + 1}."),
                                const SizedBox(width: 5),
                                Text(widget.materials[index]),
                              ],
                            ),
                          ),
                        ),

                        // Customer Details (shown when expanded)
                        if (isExpanded)
                          Padding(
                            padding: EdgeInsets.only(
                              left: 29,
                              top: 14,
                            ), // Adjusted padding
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  children: [
                                    Icon(Icons.person_2_outlined),
                                    SizedBox(width: 5),
                                    Text(
                                      "Customer Details",
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ), // Space between title and details
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                  ), // Indent details
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Name: ${widget.customername}",
                                      ), // Replace with dynamic data
                                      Text(
                                        "Email: ${widget.customeremail}",
                                      ), // Replace with dynamic data
                                      Text(
                                        "Phone: ${widget.customerPhone}",
                                      ), // Replace with dynamic data
                                      Text("Location: ${widget.location}"),
                                      Row(
                                        children: [
                                          const Text(
                                            "Location Link: ",
                                          ), // Static prefix
                                          Expanded(
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: TextButton(
                                                onPressed:
                                                    () => _launchUrl(
                                                      widget.locationlink,
                                                    ),
                                                style: TextButton.styleFrom(
                                                  foregroundColor: Colors.blue,
                                                  padding: EdgeInsets.zero,
                                                  minimumSize: Size.zero,
                                                  tapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                ),
                                                child: Text(
                                                  widget.locationlink,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        const SizedBox(height: 5),
                      ],
                    )
                  else
                    const Padding(
                      padding: EdgeInsets.only(top: 2.0, left: 38),
                      child: Text("No materials available"),
                    ),

                  // View More/Show Less Button
                  if (widget.materials.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(left: 38, top: 5),
                      child: GestureDetector(
                        onTap: () => setState(() => isExpanded = !isExpanded),
                        child: Text(
                          isExpanded ? "Show Less" : "View More",
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                  const SizedBox(height: 6),

                  // Buttons
                  if (widget.taskstatus == "Pending")
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                        left: 33,
                        bottom: 30,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Accept Button
                          OutlinedButton(
                            onPressed: widget.onAccept,

                            // Navigator.of(context).push(MaterialPageRoute(
                            //   builder: (context) => WorkDetails(),
                            // ));
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: Colors.green,
                                width: 2,
                              ),
                            ),
                            child: const Text(
                              'Accept',
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                          const SizedBox(width: 16),

                          // Reject Button
                          TextButton(
                            onPressed: widget.onReject,
                            child: const Text(
                              'Reject',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
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
}
