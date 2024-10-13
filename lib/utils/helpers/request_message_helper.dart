import 'package:flutter/material.dart';
import 'package:ticket_booking_app/utils/hero_static/request_status.dart';

class RequestMessageHelper{

  IconData getToastIcon(RequestStatus status) {
    switch (status) {
      case RequestStatus.LOADING:
        return Icons.hourglass_empty;
      case RequestStatus.SUCCESS:
        return Icons.check_circle;
      case RequestStatus.FAILURE:
        return Icons.error;
      case RequestStatus.OFFLINE:
        return Icons.signal_wifi_off;
      case RequestStatus.PENDING:
        return Icons.access_time;
      case RequestStatus.CANCELLED:
        return Icons.cancel;
      case RequestStatus.TIMEOUT:
        return Icons.timer_off;
      case RequestStatus.INVALID_RESPONSE:
        return Icons.warning;
      case RequestStatus.AUTHENTICATION_REQUIRED:
        return Icons.lock;
      default:
        return Icons.info;
    }
  }


  Color getToastIconColor(RequestStatus status) {
    switch (status) {
      case RequestStatus.SUCCESS:
        return Colors.green;
      case RequestStatus.FAILURE:
        return Colors.red;
      case RequestStatus.OFFLINE:
        return Colors.orange;
      case RequestStatus.LOADING:
      case RequestStatus.PENDING:
        return Colors.blue;
      case RequestStatus.CANCELLED:
        return Colors.grey;
      case RequestStatus.TIMEOUT:
        return Colors.yellow;
      case RequestStatus.INVALID_RESPONSE:
        return Colors.purple;
      case RequestStatus.AUTHENTICATION_REQUIRED:
        return Colors.redAccent;
      default:
        return Colors.black;
    }
  }

  String getLoginMessage(RequestStatus status) {
    switch (status) {
      case RequestStatus.SUCCESS:
        return "login_success";
      case RequestStatus.FAILURE:
        return "login_failure";
      case RequestStatus.OFFLINE:
        return "login_offline";
      case RequestStatus.LOADING:
        return "login_loading";
      case RequestStatus.PENDING:
        return "login_pending";
      case RequestStatus.CANCELLED:
        return "login_cancelled";
      case RequestStatus.TIMEOUT:
        return "login_timeout";
      case RequestStatus.INVALID_RESPONSE:
        return "login_invalid_response";
      case RequestStatus.AUTHENTICATION_REQUIRED:
        return "login_authentication_required";
      default:
        return "login_unexpected_error";
    }
  }

  String getRegisterMessage(RequestStatus status) {
    switch (status) {
      case RequestStatus.SUCCESS:
        return "register_success";
      case RequestStatus.FAILURE:
        return "register_failure";
      case RequestStatus.OFFLINE:
        return "register_email_exists";
      case RequestStatus.LOADING:
        return "register_loading";
      case RequestStatus.PENDING:
        return "register_pending";
      case RequestStatus.CANCELLED:
        return "register_cancelled";
      case RequestStatus.TIMEOUT:
        return "register_timeout";
      case RequestStatus.EMAIL_EXISTS:
        return "register_email_exists";
      case RequestStatus.INVALID_RESPONSE:
        return "register_invalid_response";
      case RequestStatus.PASSWORD_MISMATCH:
        return "register_password_mismatch";
      default:
        return "register_unexpected_error";
    }
  }


}