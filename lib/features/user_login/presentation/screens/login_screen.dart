import 'package:ecommerce/features/utils/Text_Field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../../home/presentation/screens/home_screen.dart';
import '../../../utils/my_colors.dart';
import '../cubit/user_cubit.dart';
import '../cubit/user_states.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "login";
  var formKey = GlobalKey<FormState>();
  bool visibility = false;


  @override
  State<LoginScreen> createState() => _LoginScreenState();

}
class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {

    TextEditingController usernameController=TextEditingController();
    TextEditingController passwordController=TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: BlocConsumer<UserCubit, UserStates>(
    listener: (context, state) {
      if (state is UserSuccessState) {
        // QuickAlert.show(
        //   context: context,
        //   type: QuickAlertType.success,
        //   text:"Welcome, ${state.user.username}!",
        //   showCancelBtn: false,
        //   showConfirmBtn: false,
        //   autoCloseDuration: Duration(seconds: 5),
        // );
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        // Navigate to next screen if needed
      } else if (state is UserFailureState) {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: 'Oops...',
          text:state.failureMessage,
          showCancelBtn: false,
          showConfirmBtn: false,
          autoCloseDuration: Duration(seconds: 4),
        );
      }else if(state is UserLoadingState){
        QuickAlert.show(
          context: context,
          type: QuickAlertType.loading,
          title: 'Loading',
          text: 'Fetching your data',
          barrierDismissible: true,
          showCancelBtn: false,
          showConfirmBtn: false,
          autoCloseDuration: Duration(seconds: 1),
        );
      }
    },
    builder: (context, state) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 63.h, right: 26.w, left: 32.w),
          child: Form(
            key: widget.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '''Welcome
Back!''',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                ),
                SizedBox(height: 36.h),
                CustomTextField(
                  validator: (text) => text!.isEmpty ? "Please enter username" : null,
                  textController: usernameController,
                  typeKeyboard: TextInputType.name,
                  title: "Username",
                  hintTitle: "Username",
                  icon: Icon(Icons.person, color: AppColors.primaryColor),
                ),
                SizedBox(height: 31.h),
                CustomTextField(
                  validator: (text) => text!.isEmpty ? "Please enter password" : null,
                  textController: passwordController,
                  typeKeyboard: TextInputType.text,
                  title: "Password",
                  hintTitle: "Password",
                  icon: Icon(Icons.lock, color: AppColors.primaryColor),
                  hiddenIcon: IconButton(
                    icon: Icon(
                      widget.visibility ? Icons.visibility : Icons.visibility_off,
                      color: AppColors.primaryColor,
                    ),
                    onPressed: () {
                      setState(() {
                        widget.visibility = !widget.visibility;
                      });
                    },
                  ),
                  visiblePass: !widget.visibility,
                ),
                SizedBox(height: 76.h),
                 ElevatedButton(
                  onPressed: () {
                    if (widget.formKey.currentState!.validate()) {
                      context.read<UserCubit>().eitherFailureOrUser(
                        username: usernameController.text,
                        password: passwordController.text,
                      );

                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(AppColors.primaryColor),
                    shape: WidgetStatePropertyAll(
                      ContinuousRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                    ),
                    padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 10.h)),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteColor,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
    ),

    );
  }

}
