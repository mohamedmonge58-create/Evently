import 'package:evently/core/config/routes/app_routes_name.dart';
import 'package:evently/core/config/theme/app_assets.dart';
import 'package:evently/core/config/theme/app_colors.dart';
import 'package:evently/core/providerrr/settings.dart';
import 'package:evently/core/utils/firebase_auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  final bool isPassword;
  final Widget? suffixIcon;

  const LoginView({super.key, this.isPassword = true, this.suffixIcon});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isObscure = true;

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
                  "Login to your account",
                  style: TextStyle(
                    color: AppColors.mainColorLight,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 24),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: theme.primaryColor,
                  style:  TextStyle(
                    color: provider.currentThemeMode ==
                        ThemeMode.light
                        ? Colors.black
                        : Colors.white,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  ),
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: "Enter your email",
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

                  validator: (value){
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your email';
                    }


                    return null;


                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: theme.primaryColor,
                  obscureText: isObscure,
                  style:  TextStyle(
                    color: provider.currentThemeMode ==
                        ThemeMode.light
                        ? Colors.black
                        : Colors.white,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  ),
                  controller: _passwordController,
                  decoration: InputDecoration(
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
                                isObscure = !isObscure;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Icon(
                                isObscure
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
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

                  validator: (value){
          if (value == null || value.trim().isEmpty) {
          return 'Please enter your email';
          }


          return null;


          },

                ),
                SizedBox(height: 8),
            
                GestureDetector(
                  child: Text(
                    "Forget Password? ",
                    textAlign: TextAlign.end,
                              
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor: theme.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        EasyLoading.show();

                        FirebaseAuthServices.signInWithAccount(
                          _emailController.text,
                          _passwordController.text,
                        ).then((success) {
                          EasyLoading.dismiss();


                            Navigator.pushNamed(context, AppRoutesName.layoutView);

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
                          "Login",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: AppColors.inputsLight,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                  ),

                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: theme.textTheme.bodyMedium,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutesName.registerRoute);
                      },
                      child: Text(
                        "Sign up",
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
            
                SizedBox(height: 25),
            
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
                        color: provider.currentThemeMode == ThemeMode.light
                            ? AppColors.inputsLight
                            : AppColors.inputsDark,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
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
                              "Login with Google",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color:
                                    provider.currentThemeMode == ThemeMode.light
                                    ? AppColors.mainColorLight
                                    : AppColors.mainColorDark,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 200),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
