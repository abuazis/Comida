part of 'package:comida/ui/screens/screens.dart';

class SignUpScreen extends StatefulWidget {
  final Auth auth;

  SignUpScreen(this.auth);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmationController = TextEditingController();

  bool isHidePassword = false;
  bool isHidePasswordConfirmation = false;

  @override
  void initState() {
    super.initState();

    nameController.text = widget.auth.name;
    emailController.text = widget.auth.email;
    passwordController.text = widget.auth.password;
    confirmationController.text = widget.auth.confirmPassword;
  }
  
  @override
  Widget build(BuildContext context) {
    return Consumer<ValidationProvider>(
      builder: (context, validation, _) => WillPopScope(
        onWillPop: () async {
          context.bloc<PageBloc>().add(GoToSignInScreen());
          validation.resetChange(); 
          validation.resetChangeNumberAddress();
          return;
        },
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                color: blackColor,
              ),
              SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    width: deviceWidth(context),
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/image/bg_splash.png"),
                      ),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 32,
                          ),
                          Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: GestureDetector(
                                  onTap: () {
                                    context.bloc<PageBloc>().add(GoToSignInScreen());
                                    validation.resetChange(); 
                                    validation.resetChangeNumberAddress();
                                  },
                                  child: Icon(
                                    LineAwesomeIcons.angle_left,
                                    color: whiteColor,
                                    size: 24,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Sign Up",
                                  style: semiBoldBaseFont.copyWith(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 36,
                          ),
                          Image.asset(
                            "assets/image/splash_logo.png",
                            width: 152,
                            height: 52,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "Fast Food Market",
                            style: semiBoldBaseFont.copyWith(
                              fontSize: 13,
                              letterSpacing: -0.33,
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          DarkTextField(
                            labelText: "Full Name",
                            hintText: "Enter Your Name",
                            controller: nameController,
                            errorValidation: validation.errorName,
                            onChanged: (text) {
                              validation.changeName(text);
                            },
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          DarkTextField(
                            labelText: "Email Address",
                            hintText: "Enter Your Email",
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            errorValidation: validation.errorEmail,
                            onChanged: (text) {
                              validation.changeEmail(text);
                            },
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          DarkTextField(
                            labelText: "Password",
                            hintText: "Enter Your Password",
                            obscureText: !isHidePassword,
                            controller: passwordController,
                            errorValidation: validation.errorPassword,
                            onChanged: (value) {
                              validation.changePassword(value);
                            },
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isHidePassword = !isHidePassword;
                                });
                              },
                              child: Theme(
                                data: Theme.of(context).copyWith(primaryColor: null),
                                child: (!isHidePassword) ? Icon(
                                  LineAwesomeIcons.eye_slash,
                                  size: 24,
                                  color: greyColor,
                                ) : Icon(
                                  LineAwesomeIcons.eye,
                                  size: 24,
                                  color: greyColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          DarkTextField(
                            labelText: "Confirm Password",
                            hintText: "Enter Confirm Password",
                            obscureText: !isHidePasswordConfirmation,
                            controller: confirmationController,
                            errorValidation: validation.errorPasswordConfirmation,
                            onChanged: (value) {
                              validation.changePasswordConfirmation(value, passwordController.text);
                            },
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isHidePasswordConfirmation = !isHidePasswordConfirmation;
                                });
                              },
                              child: Theme(
                                data: Theme.of(context).copyWith(primaryColor: null),
                                child: (!isHidePasswordConfirmation) ? Icon(
                                  LineAwesomeIcons.eye_slash,
                                  size: 24,
                                  color: greyColor,
                                ) : Icon(
                                  LineAwesomeIcons.eye,
                                  size: 24,
                                  color: greyColor,
                                ),
                              ),
                            ),
                          ),
                          BaseButton(
                            width: 150,
                            height: 45,
                            color: (validation.isAllValidate()) ? accentColor : greyColor,
                            margin: EdgeInsets.only(
                              top: 32,
                              bottom: 16,
                            ),
                            child: Icon(
                              LineAwesomeIcons.long_arrow_right,
                              size: 24,
                              color: whiteColor,
                            ),
                            onPressed: (validation.isAllValidate()) ? () {
                              onSignUpPressed(context);
                            } : null,
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already a member, ",
                                style: mediumBaseFont.copyWith(fontSize: 13),
                              ),
                              GestureDetector(
                                onTap: () {
                                  context.bloc<PageBloc>().add(GoToSignInScreen());
                                  validation.resetChange(); 
                                },
                                child: Text(
                                  "Sign In",
                                  style: mediumBaseFont.copyWith(
                                    fontSize: 13,
                                    color: accentColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 32,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSignUpPressed(BuildContext context) {
    widget.auth.name = nameController.text;
    widget.auth.email = emailController.text;
    widget.auth.password = passwordController.text;
    widget.auth.confirmPassword = confirmationController.text;

    context.bloc<PageBloc>().add(GoToNumberAddressScreen(widget.auth));
  }
}