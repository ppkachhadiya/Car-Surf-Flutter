import 'dart:io';

import 'package:cleaner/constants/api_constants.dart';
import 'package:cleaner/constants/string_constants.dart';
import 'package:cleaner/utilities/method_utility.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getX;
import 'package:get/get.dart';

class AppConfig {
  static BaseOptions options = BaseOptions(
      baseUrl: ApiConstants.BASE_URL,
      responseType: ResponseType.plain,
      connectTimeout: 30000,
      receiveTimeout: 30000,
      // ignore: missing_return
      validateStatus: (code) {
        if (code! >= 200) {
          return true;
        } else {
          return false;
        }
      });
  static Dio dio = Dio(options);

  static Options authorization = Options();

  /// It will handle get api
  static get(
      {required path, required params, onSuccess, isLoading = false}) async {
    if (isLoading) {
      showProgressDialog(title: StringConstants.LABEL_LOADING);
    }

    try {
      var response = await AppConfig.dio.post(path, data: params);

      if (onSuccess != null) {
        if (isLoading) {
          hideProgressDialog();
        }

        await onSuccess(response);
      }
    } on DioError catch (e) {
      if (isLoading) {
        hideProgressDialog();
      }

      AppConfig.handleDioError(
          dioError: e,
          callBack: () {
            get(
                path: path,
                params: params,
                onSuccess: onSuccess,
                isLoading: isLoading);
          },
          isLoading: false);
    }
    if (isLoading) {
      hideProgressDialog();
    }
  }

  /// It will handle post api
  static post() {}

  ///Handle isDialogOpen is pending
  static handleDioError(
      {required DioError dioError,
      required bool? isLoading,
      required VoidCallback? callBack}) async {
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.other:
        if (isLoading != null) {
          isLoading = false;
        }
        if (!getX.Get.isDialogOpen!)
          Get.defaultDialog(
              title: "No internet",
              content: Container(
                  margin: EdgeInsets.only(left: 20),
                  width: getX.Get.width * 0.8,
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                          child: Text(
                              "Please check your internet connection and try again.")),
                    ],
                  )),
              actions: [
                Platform.isIOS
                    ? CupertinoDialogAction(
                        isDefaultAction: true,
                        child: new Text("Try Again"),
                        onPressed: () {
                          if (callBack != null) {
                            callBack();
                          }
                          Get.back();
                        },
                      )
                    : MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.black)),
                        child: Text("Try Again"),
                        onPressed: () {
                          if (callBack != null) {
                            callBack();
                          }
                          Get.back();
                        },
                      )
              ]);
        break;
      case DioErrorType.response:
      case DioErrorType.cancel:
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
      default:
        if (isLoading != null) {
          isLoading = false;
        }
        return Get.defaultDialog();
    }
  }
}
