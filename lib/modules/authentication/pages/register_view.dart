import 'package:evently/core/config/routes/app_routes_name.dart';
import 'package:evently/core/config/theme/app_assets.dart';
import 'package:evently/core/config/theme/app_colors.dart';
import 'package:evently/core/providerrr/settings.dart';
import 'package:evently/core/utils/firebase_auth_services.dart';
import 'package:evently/services/snack_bar_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatefulWidget {
  final bool isPassword;
  final Widget? suffixIcon;
  const RegisterView({super.key, this.isPassword = true, this.suffixIcon});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  // منقولين هنا برة build() عشان ميتعملوش من جديد كل setState
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // متغيرين منفصلين، واحد لكل حقل باسورد
  bool isPasswordObscure = true;
  bool isConfirmPasswordObscure = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Settings>(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,

        title: Center(
          child: Image.asset(AppAssets.eventlyLogo, width: 145, height: 70),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 24),
                Text(
                  "Create your account",
                  style: TextStyle(
                    color: AppColors.mainColorLight,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 24),

                TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: theme.primaryColor,

                  style: TextStyle(
                    color: provider.currentThemeMode == ThemeMode.light
                        ? Colors.black
                        : Colors.white,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  ),
                  decoration: InputDecoration(
                    hintText: "Enter your name",
                    hintStyle: TextStyle(
                      color: provider.currentThemeMode == ThemeMode.light
                          ? AppColors.secTextLight
                          : AppColors.secTextDark,
                    ),
                    filled: true,
                    prefixIconConstraints: BoxConstraints(
                      minWidth: 24,
                      maxHeight: 24,
                    ),

                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 8),
                      child: SvgPicture.asset(AppAssets.userIcon),
                    ),
                    fillColor: provider.currentThemeMode == ThemeMode.light
                        ? AppColors.inputsLight
                        : AppColors.inputsDark,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),

                      borderSide: BorderSide(
                        color: provider.currentThemeMode == ThemeMode.light
                            ? AppColors.strokeLight
                            : AppColors.strokeDark,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: provider.currentThemeMode == ThemeMode.light
                            ? AppColors.strokeLight
                            : AppColors.strokeDark,
                      ),
                    ),
                  ),

                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: theme.primaryColor,
                  style: TextStyle(
                    color: provider.currentThemeMode == ThemeMode.light
                        ? Colors.black
                        : Colors.white,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  ),
                  decoration: InputDecoration(
                    hintText: "Enter your email",
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    hintStyle: TextStyle(
                      color: provider.currentThemeMode == ThemeMode.light
                          ? AppColors.secTextLight
                          : AppColors.secTextDark,
                    ),
                    filled: true,
                    prefixIconConstraints: BoxConstraints(
                      minWidth: 24,
                      maxHeight: 24,
                    ),

                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 8),
                      child: SvgPicture.asset(AppAssets.smsIcon),
                    ),
                    fillColor: provider.currentThemeMode == ThemeMode.light
                        ? AppColors.inputsLight
                        : AppColors.inputsDark,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: provider.currentThemeMode == ThemeMode.light
                            ? AppColors.strokeLight
                            : AppColors.strokeDark,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: provider.currentThemeMode == ThemeMode.light
                            ? AppColors.strokeLight
                            : AppColors.strokeDark,
                      ),
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your email';
                    }

                    final emailRegex = RegExp(
                      r'^[a-zA-Z0-9.a-zA-Z0-9!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9]([a-zA-Z0-9-]*[a-zA-Z0-9])?(\.[a-zA-Z0-9]([a-zA-Z0-9-]*[a-zA-Z0-9])?)+$',
                    );

                    if (!emailRegex.hasMatch(value.trim())) {
                      return 'Please enter a valid email address';
                    }

                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: theme.primaryColor,
                  obscureText: isPasswordObscure,
                  style: TextStyle(
                    color: provider.currentThemeMode == ThemeMode.light
                        ? Colors.black
                        : Colors.white,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  ),
                  decoration: InputDecoration(
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    hintText: "Enter your password",
                    hintStyle: TextStyle(
                      color: provider.currentThemeMode == ThemeMode.light
                          ? AppColors.secTextLight
                          : AppColors.secTextDark,
                    ),
                    filled: true,
                    prefixIconConstraints: BoxConstraints(
                      minWidth: 24,
                      maxHeight: 24,
                    ),

                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 8),
                      child: SvgPicture.asset(AppAssets.lockIcon),
                    ),
                    suffixIcon: widget.isPassword
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                isPasswordObscure = !isPasswordObscure;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Icon(
                                isPasswordObscure
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: AppColors.scaffoldLight,
                              ),
                            ),
                          )
                        : widget.suffixIcon,
                    suffixIconConstraints: BoxConstraints(
                      minWidth: 24,
                      maxHeight: 24,
                    ),
                    fillColor: provider.currentThemeMode == ThemeMode.light
                        ? AppColors.inputsLight
                        : AppColors.inputsDark,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: provider.currentThemeMode == ThemeMode.light
                            ? AppColors.strokeLight
                            : AppColors.strokeDark,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: provider.currentThemeMode == ThemeMode.light
                            ? AppColors.strokeLight
                            : AppColors.strokeDark,
                      ),
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }

                    if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }

                    if (!RegExp(r'[A-Z]').hasMatch(value)) {
                      return 'Password must contain at least one uppercase letter';
                    }

                    if (!RegExp(r'[a-z]').hasMatch(value)) {
                      return 'Password must contain at least one lowercase letter';
                    }

                    if (!RegExp(r'[0-9]').hasMatch(value)) {
                      return 'Password must contain at least one number';
                    }

                    if (!RegExp(
                      r'[!@#$%^&*(),.?":{}|<>_\-+=]',
                    ).hasMatch(value)) {
                      return 'Password must contain at least one special character';
                    }

                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _confirmPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: theme.primaryColor,
                  obscureText: isConfirmPasswordObscure,
                  style: TextStyle(
                    color: provider.currentThemeMode == ThemeMode.light
                        ? Colors.black
                        : Colors.white,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  ),

                  decoration: InputDecoration(
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    hintText: "Confirm your password",
                    hintStyle: TextStyle(
                      color: provider.currentThemeMode == ThemeMode.light
                          ? AppColors.secTextLight
                          : AppColors.secTextDark,
                    ),
                    filled: true,
                    prefixIconConstraints: BoxConstraints(
                      minWidth: 24,
                      maxHeight: 24,
                    ),

                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 8),
                      child: SvgPicture.asset(AppAssets.lockIcon),
                    ),
                    suffixIcon: widget.isPassword
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                isConfirmPasswordObscure =
                                    !isConfirmPasswordObscure;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Icon(
                                isConfirmPasswordObscure
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: AppColors.scaffoldLight,
                              ),
                            ),
                          )
                        : widget.suffixIcon,
                    suffixIconConstraints: BoxConstraints(
                      minWidth: 24,
                      maxHeight: 24,
                    ),
                    fillColor: provider.currentThemeMode == ThemeMode.light
                        ? AppColors.inputsLight
                        : AppColors.inputsDark,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: provider.currentThemeMode == ThemeMode.light
                            ? AppColors.strokeLight
                            : AppColors.strokeDark,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: provider.currentThemeMode == ThemeMode.light
                            ? AppColors.strokeLight
                            : AppColors.strokeDark,
                      ),
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 50),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: GestureDetector(
                    onTap: () {

                      if (_formKey.currentState!.validate()) {
                     EasyLoading.show();
                     FirebaseAuthServices.createAccount(
                        _emailController.text,
                        _passwordController.text,

                     ).then((value) {
                       EasyLoading.dismiss();
                       if (value) {
                         SnackBarServices.showSuccess("Account created successfully");
                         Navigator.pop(context);
                       }

                     });

                      }

                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: theme.primaryColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: theme.textTheme.bodyMedium,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutesName.registerRoute,
                        );
                      },
                      child: Text(
                        "Login",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.primaryColor,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationColor: theme.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 32),

                Row(
                  children: [
                    Expanded(child: Divider(indent: 40, endIndent: 12)),
                    Text(
                      "Or",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(child: Divider(indent: 12, endIndent: 40)),
                  ],
                ),
                SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: BoxBorder.all(
                          color: provider.currentThemeMode == ThemeMode.light
                              ? AppColors.strokeLight
                              : AppColors.strokeDark,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppAssets.googleImage,
                              width: 24,
                              height: 24,
                            ),
                            SizedBox(width: 10),

                            Text(
                              "Sign up with Google",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: AppColors.mainColorLight,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
