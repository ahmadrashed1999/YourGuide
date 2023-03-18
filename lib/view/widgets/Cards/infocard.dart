import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard(
      {Key? key,
      required this.color,
      required this.title,
      required this.startTime,
      required this.endTime,
      this.note,
      required this.isCompleted})
      : super(key: key);
  final Color color;
  final String title;
  final String startTime;
  final String endTime;
  final String? note;
  final bool isCompleted;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color,
      ),
      child: Row(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  // style: GoogleFonts.lato(
                  //   textStyle: const TextStyle(
                  //       color: Colors.white,
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.bold),
                  // ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.access_time_rounded,
                      color: Colors.grey,
                      size: 18,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      '$startTime-$endTime',
                      // style: GoogleFonts.lato(
                      //   textStyle: TextStyle(
                      //     color: Colors.grey[100],
                      //     fontSize: 13,
                      //   ),
                      //
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  note!,
                  // style: GoogleFonts.lato(
                  //   textStyle: TextStyle(
                  //     color: Colors.grey[100],
                  //     fontSize: 13,
                  //   ),
                  // ),
                ),
              ],
            ),
          )),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 60,
            width: 0.5,
            color: Colors.grey[200]!.withOpacity(0.7),
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              isCompleted ? 'TODO' : 'Completed',
              // style: GoogleFonts.lato(
              //     textStyle: TextStyle(
              //         color: Colors.white,
              //         fontSize: 10,
              //         fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }
}
