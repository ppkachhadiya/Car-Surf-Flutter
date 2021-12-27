import 'dart:math';

import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:cleaner/constants/colors_constants.dart';
import 'package:cleaner/constants/size_constants.dart';
import 'package:cleaner/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

String getPageKey() {
  const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  return String.fromCharCodes(Iterable.generate(
      5, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}

String printDuration(Duration duration) {
  String twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "${(duration.inHours > 0) ? twoDigits(duration.inHours) + ":" : ""}$twoDigitMinutes:$twoDigitSeconds";
}

showCustomBottomSheet(
    {required context,
    minHeight = 0.5,
    initHeight = 0.5,
    maxHeight = 0.5,
    required Function child}) {
  showFlexibleBottomSheet(
    minHeight: minHeight,
    initHeight: initHeight,
    maxHeight: maxHeight,
    context: context,
    builder: (
      BuildContext context,
      ScrollController scrollController,
      double bottomSheetOffset,
    ) {
      return SafeArea(
        child: Material(
            color: Colors.transparent,
            child: Stack(
              children: [
                Container(
                  margin: (minHeight != maxHeight)
                      ? EdgeInsets.only(top: 25.sp)
                      : null,
                  decoration: BoxDecoration(
                    color: ColorsConstants.WHITE_COLOR,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.sp),
                      topRight: Radius.circular(20.sp),
                    ),
                  ),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    controller: scrollController,
                    children: [
                      Container(
                        height: 50.h,
                        alignment: Alignment.center,
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: ColorsConstants.DARK_TEXT_COLOR,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.sp)),
                              ),
                              width: 80.w,
                              height: 5.h,
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                constraints: null,
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        // color: Colors.greenAccent,
                        height: (minHeight != maxHeight)
                            ? max(
                                ((MediaQuery.of(context).size.height) *
                                        bottomSheetOffset -
                                    75.h),
                                0)
                            : max(
                                ((MediaQuery.of(context).size.height) *
                                        bottomSheetOffset -
                                    50.h),
                                0),
                        child: child(!(bottomSheetOffset == minHeight &&
                            minHeight < maxHeight)),
                      )
                    ],
                  ),
                ),
                (minHeight != maxHeight)
                    ? Positioned.fill(
                        child: Align(
                            alignment: Alignment.topCenter,
                            child: FloatingActionButton(
                              elevation: 0,
                              mini: true,
                              backgroundColor: ColorsConstants.WHITE_COLOR,
                              child: Icon(
                                Icons.keyboard_arrow_up,
                                color: ColorsConstants.PRIMARY_COLOR,
                              ),
                              onPressed: null,
                            )))
                    : Container()
              ],
            )),
      );
    },
    anchors: [minHeight, maxHeight],
  );
}

showSnackBar({required String title, required String message}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: (title == StringConstants.SUCCESS)
        ? Colors.green
        : (title == StringConstants.ERROR)
            ? Colors.red
            : Colors.orangeAccent,
    textColor: Colors.white,
  );
}

bool _isProgress = false;
SimpleFontelicoProgressDialog _dialog =
    SimpleFontelicoProgressDialog(barrierDimisable: false);
// ArsProgressDialog pr;
void showProgressDialog({String title = ""}) {
  if (!_isProgress) {
    _isProgress = true;
    _dialog.context = Get.context;
    _dialog.show(
      message: title,
      hideText: (title == ""),
      type: SimpleFontelicoProgressDialogType.normal,
      backgroundColor: ColorsConstants.WHITE_COLOR.withOpacity(0.7),
      indicatorColor: ColorsConstants.PRIMARY_COLOR,
      textStyle: TextStyle(
          color: ColorsConstants.DARK_TEXT_COLOR,
          fontSize: SizeConstants.H15,
          fontWeight: FontWeight.w400),
    );
  }
}

void hideProgressDialog() {
  _dialog.hide();
  _isProgress = false;
}
