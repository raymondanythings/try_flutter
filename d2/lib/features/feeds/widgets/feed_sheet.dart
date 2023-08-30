import 'package:d2/constants/gaps.dart';
import 'package:d2/constants/sizes.dart';
import 'package:d2/features/feeds/widgets/report_sheet.dart';
import 'package:d2/features/feeds/widgets/sheet_button.dart';
import 'package:flutter/material.dart';

class FeedSheet extends StatelessWidget {
  const FeedSheet({super.key});

  void _onReportTap(BuildContext context) {
    // ModalBottomSheetRoute(
    //   builder: (context) => const ReportSheet(),
    //   isScrollControlled: false,
    // );
    Navigator.push(
      context,
      ModalBottomSheetRoute(
        builder: (context) => const ReportSheet(),
        isScrollControlled: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Sizes.size20,
        ),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(
        Sizes.size24,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SheetButton(
              text: "Unfollow",
              direction: Direction.top,
            ),
            const Divider(
              thickness: 0,
              height: 0,
            ),
            const SheetButton(
              text: "Mute",
              direction: Direction.bottom,
            ),
            Gaps.v20,
            const SheetButton(
              text: "Hide",
              direction: Direction.top,
            ),
            const Divider(
              thickness: 0,
              height: 0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(
                    Sizes.size10,
                  ),
                  bottomRight: Radius.circular(
                    Sizes.size10,
                  ),
                ),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    ModalBottomSheetRoute(
                      builder: (context) => const ReportSheet(),
                      isScrollControlled: false,
                    ),
                  );
                },
                title: const Text(
                  "Report",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: Sizes.size14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
