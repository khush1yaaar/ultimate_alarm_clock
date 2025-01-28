import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_alarm_clock/app/modules/home/controllers/home_controller.dart';
import 'package:ultimate_alarm_clock/app/modules/settings/controllers/theme_controller.dart';


class PhysicalButtons extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();
  PhysicalButtons({
    super.key,
    required this.themeController,
    required this.height,
    required this.width,
  });

  final ThemeController
      themeController; // Controller to manage theme-related properties
  final double width; // Width of the parent container
  final double height; // Height of the parent container

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // Gesture detector for tapping functionality
      onTap: () {
        Get.defaultDialog(
          title: 'Physical Button', // Dialog title
          titleStyle: Theme.of(context).textTheme.displaySmall,
          backgroundColor: themeController.secondaryBackgroundColor.value,
          content: Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min, // Minimize size of the dialog
              children: [
                ListTile(
                  title: Text(
                    'Not do anything',
                    style: TextStyle(
                      color: themeController.primaryTextColor.value,
                    ),
                  ),
                  onTap: () {
                    // Handle "Not do anything" option
                    homeController.selectedPhysicalButtonAction.value =
                        'Not do anything';
                    Get.back(); // Close the dialog
                  },
                ),
                Divider(color: themeController.primaryDisabledTextColor.value),
                ListTile(
                  title: Text(
                    'Snooze',
                    style: TextStyle(
                      color: themeController.primaryTextColor.value,
                    ),
                  ),
                  onTap: () {
                    // Handle "Snooze" option
                    homeController.selectedPhysicalButtonAction.value =
                        'Snooze';
                    Get.back(); // Close the dialog
                  },
                ),
                Divider(color: themeController.primaryDisabledTextColor.value),
                ListTile(
                  title: Text(
                    'Dismiss',
                    style: TextStyle(
                      color: themeController.primaryTextColor.value,
                    ),
                  ),
                  onTap: () {
                    // Handle "Dismiss" option
                    homeController.selectedPhysicalButtonAction.value =
                        'Dismiss';
                    Get.back(); // Close the dialog
                  },
                ),
              ],
            ),
          ),
        );
      },
      child: Container(
        // Container to define the visual appearance
        width: width * 0.91, // Set container width relative to the parent width
        height:
            height * 0.09, // Set container height relative to the parent height
        decoration: BoxDecoration(
          // Add custom decoration for the container
          borderRadius: BorderRadius.circular(10),
          color: themeController
              .secondaryBackgroundColor.value, // Background color
        ),
        child: Center(
          // Center the content inside the container
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 10), // Add horizontal padding
            child: Obx(
              () => ListTile(
                title: Text(
                  'Physical buttons', // Localized text for the title
                  style: Theme.of(context).textTheme.bodyLarge
                ),
                trailing: Wrap(
                  // Trailing section with text and an icon
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      homeController
                          .selectedPhysicalButtonAction.value, // Reactive display
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: themeController.primaryTextColor.value,
                            fontSize: 13, // Set font size for the trailing text
                          ),
                    ),
                    Icon(
                      Icons.chevron_right, // Icon indicating more options
                      color: themeController.primaryDisabledTextColor.value,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
