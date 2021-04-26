import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../size_config/size_config.dart';

DateFormat dateFormat = DateFormat("dd-MM-yy");

//WebView User Agent
const String webViewUserAgent =
    'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.192 Safari/537.36';

//SignUp Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final RegExp emailPhoneValidatorRegExp =
    RegExp(r"^([0-9]{9})|([A-Za-z0-9._%\+\-]+@[a-z0-9.\-]+\.[a-z]{2,3})$");

const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kInvaliedInfoError = 'Email or Password Invalied';
const String kFirstNameNullError = "Please Enter your first name";
const String kLastNameNullError = "Please Enter your last name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kInvaliedPhoneNumberError = "Please Enter valid phone number";
const String kAddressNullError = "Please Enter your address";
const String kCountryNullError = "Please Select your Country";
const String kStateNullError = "Please Select your State";

OutlineInputBorder outlineInputBorder() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    );

const String baseLink = '';

const String playStoreUrl = 'https://play.google.com/store/apps/details?id= ';
