import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SnackBarServices {
  static void showSuccess(String message) {
    BotToast.showCustomNotification(
      toastBuilder: (void Function() cancelFunc) {
        return Material(
          color: Colors.transparent,
          child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 14.0,
            ),
            margin: const EdgeInsets.only(left: 16.0, right: 16.0),
            decoration: BoxDecoration(
              color: const Color(0xFFE6FFF4),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SvgPicture.asset(
                    "assets/icons/success-svgrepo-com.svg",
                    height: 20,
                    width: 20,
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  flex: 8,
                  child: Text(
                    message,
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: IconButton(
                    onPressed: cancelFunc,
                    icon: const Icon(
                      Icons.close_rounded,
                      color: Color(0xFF555555),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      duration: const Duration(seconds: 5),
      dismissDirections: [DismissDirection.endToStart],
    );
  }

  static void showWarning(String message) {
    BotToast.showCustomNotification(
      toastBuilder: (void Function() cancelFunc) {
        return Material(
          color: Colors.transparent,
          child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 14.0,
            ),
            margin: const EdgeInsets.only(left: 16.0, right: 16.0),
            decoration: BoxDecoration(
              color: const Color(0xFFE6FFF4),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SvgPicture.asset(
                    "assets/icons/warning-svgrepo-com.svg",
                    height: 20,
                    width: 20,
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  flex: 8,
                  child: Text(
                    message,
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: IconButton(
                    onPressed: cancelFunc,
                    icon: const Icon(
                      Icons.close_rounded,
                      color: Color(0xFF555555),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      duration: const Duration(seconds: 5),
      dismissDirections: [DismissDirection.endToStart],
    );
  }

  static void showError(String message) {
    BotToast.showCustomNotification(
      toastBuilder: (void Function() cancelFunc) {
        return Material(
          color: Colors.transparent,
          child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 14.0,
            ),
            margin: const EdgeInsets.only(left: 16.0, right: 16.0),
            decoration: BoxDecoration(
              color: const Color(0xFFE6FFF4),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SvgPicture.asset(
                    "assets/icons/error-svgrepo-com.svg",
                    height: 20,
                    width: 20,
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  flex: 8,
                  child: Text(
                    message,
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: IconButton(
                    onPressed: cancelFunc,
                    icon: const Icon(
                      Icons.close_rounded,
                      color: Color(0xFF555555),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      duration: const Duration(seconds: 5),
      dismissDirections: [DismissDirection.endToStart],
    );
  }
}
