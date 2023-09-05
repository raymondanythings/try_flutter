import 'package:d2/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool _notifications = false;

  void _onNotificationsChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notifications = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(
          50,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size20,
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: Colors.grey.shade200,
              ),
            ),
          ),
          child: AppBar(
            centerTitle: true,
            title: const Text(
              'Privacy',
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w600,
              ),
            ),
            leading: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Center(
                child: Wrap(
                  spacing: Sizes.size4,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.chevronLeft,
                      size: Sizes.size20,
                    ),
                    Text(
                      "Back",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.lock,
            ),
            title: const Text(
              "Private profile",
            ),
            trailing: Switch.adaptive(
              activeColor: Colors.black,
              value: _notifications,
              onChanged: _onNotificationsChanged,
            ),
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.at,
            ),
            title: const Text(
              "Mentions",
            ),
            trailing: Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 10,
              children: [
                Text(
                  "Everyone",
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: Sizes.size14,
                  ),
                ),
                FaIcon(
                  FontAwesomeIcons.chevronRight,
                  size: Sizes.size20,
                  color: Colors.grey.shade400,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.bellSlash,
            ),
            title: const Text(
              "Muted",
            ),
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
              size: Sizes.size20,
              color: Colors.grey.shade400,
            ),
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.eyeSlash,
            ),
            title: const Text(
              "Hidden Words",
            ),
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
              size: Sizes.size20,
              color: Colors.grey.shade400,
            ),
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.peopleGroup,
            ),
            title: const Text(
              "Profiles you follow",
            ),
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
              size: Sizes.size20,
              color: Colors.grey.shade400,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size7,
            ),
            child: Divider(
              height: 1,
              color: Colors.grey.shade200,
            ),
          ),
          ListTile(
            isThreeLine: true,
            title: const Padding(
              padding: EdgeInsets.only(
                bottom: Sizes.size6,
              ),
              child: Text(
                "Other privacy settings",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            subtitle: Text(
              "Some settings, like restrict, apply to both Threads and Instagram and can be managed on Instagram.",
              style: TextStyle(
                fontSize: Sizes.size16,
                color: Colors.grey.shade400,
              ),
            ),
            trailing: FaIcon(
              FontAwesomeIcons.arrowUpRightFromSquare,
              color: Colors.grey.shade400,
              size: Sizes.size20,
            ),
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.circleXmark,
            ),
            title: const Text(
              "Blocked profiles",
            ),
            trailing: FaIcon(
              FontAwesomeIcons.arrowUpRightFromSquare,
              color: Colors.grey.shade400,
              size: Sizes.size20,
            ),
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.heart,
            ),
            title: const Text(
              "Hide likes",
            ),
            trailing: FaIcon(
              FontAwesomeIcons.arrowUpRightFromSquare,
              color: Colors.grey.shade400,
              size: Sizes.size20,
            ),
          ),
        ],
      ),
    );
  }
}
