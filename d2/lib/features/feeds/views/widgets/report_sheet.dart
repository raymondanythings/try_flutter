import 'package:d2/constants/gaps.dart';
import 'package:d2/constants/sizes.dart';
import 'package:d2/features/feeds/views/widgets/report_reason_item.dart';
import 'package:flutter/material.dart';

class ReportSheet extends StatelessWidget {
  const ReportSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Sizes.size20,
        ),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.size20,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(
            bottom: Sizes.size24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Colors.grey.shade200,
                    ),
                  ),
                ),
                padding: const EdgeInsets.only(
                  bottom: Sizes.size10,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Report",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Sizes.size20,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(
                  Sizes.size16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Why are you reporting this thread?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Sizes.size20,
                      ),
                    ),
                    Gaps.v10,
                    Text(
                      "Your report is anonymous, except if you're reporting an intellectual property infringement. If someone is in immediate danger, call the local emergency\nservices - don't wait.",
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: Sizes.size14,
                      ),
                    ),
                  ],
                ),
              ),
              const ReportReasonItem(
                text: "I just don't like it",
              ),
              const ReportReasonItem(
                text: "It's unlawful content under NetzDG",
              ),
              const ReportReasonItem(
                text: "It's spam",
              ),
              const ReportReasonItem(
                text: "Hate speech or symbols",
              ),
              const ReportReasonItem(
                text: "Nudity or sexual activity",
              ),
              const ReportReasonItem(
                text: "I just don't like it",
              ),
              const ReportReasonItem(
                text: "Just because it's 2 a.m. right now.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
