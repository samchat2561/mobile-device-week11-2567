import 'package:flutter/material.dart';
import 'package:week6/view/auth/login.dart';

class SignupScreens extends StatefulWidget {
  const SignupScreens({super.key});

  @override
  State<SignupScreens> createState() => _SignupScreensState();
}

class _SignupScreensState extends State<SignupScreens> {
  bool showPass = false;
  bool showPass2 = false;

  final fromState = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //===== Validate Email =====
  bool isEmailValid(String email) {
    RegExp regex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    return regex.hasMatch(email);
  }

  //===== Validate Sign Up =====
  void signUp(){
    if(fromState.currentState!.validate()){
      debugPrint(nameController.text);
      debugPrint(emailController.text);
      debugPrint(passwordController.text);
      debugPrint(confirmPasswordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(5.0),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //===== Image Register =====
                Image.asset(
                  'assets/images/register.png',
                  width: size.width - 100,
                ),
                const SizedBox(height: 10.0),
                //===== Text Register =====
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.lightBlue,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                //===== Form Sign Up =====
                Form(
                  key: fromState,
                  child: Column(
                    children: [
                      //===== Enter Full name =====
                      TextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            debugPrint('Name is empty');
                            return 'Name is empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter your full name',
                          label: const Text('Full name'),
                          labelStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18.0,
                            fontFamily: 'verdana_regular',
                            fontWeight: FontWeight.w400,
                          ),
                          prefixIcon: const Icon(Icons.person),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      //===== Enter Email =====
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            debugPrint('email is empty');
                            return 'email is empty';
                          } else if (!isEmailValid(value)) {
                            debugPrint('ERROR is email');
                            return 'ERROR is email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          label: const Text('Email'),
                          labelStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18.0,
                            fontFamily: 'verdana_regular',
                            fontWeight: FontWeight.w400,
                          ),
                          prefixIcon: const Icon(Icons.email),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      //===== Enter field password =====
                      TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            debugPrint('password is empty');
                            return 'password is empty';
                          }else if(value.length < 6){
                            debugPrint('Password too short');
                            return 'Password too short';
                          }
                          return null;
                        },
                        obscureText: !showPass,
                        decoration: InputDecoration(
                            hintText: 'Enter your password',
                            label: const Text('Password'),
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18.0,
                              fontFamily: 'verdana_regular',
                              fontWeight: FontWeight.w400,
                            ),
                            prefixIcon: const Icon(Icons.vpn_key_sharp),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  showPass = !showPass;
                                });
                              },
                              icon: Icon(showPass
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: const BorderSide(color: Colors.grey),
                            )),
                      ),
                      const SizedBox(height: 10.0),
                      //===== Enter field confirm password =====
                      TextFormField(
                        controller: confirmPasswordController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            debugPrint('Confirm password is empty');
                            return 'Confirm password is empty';
                          }else if(passwordController != confirmPasswordController){
                            debugPrint('Error: Password do not match');
                            return 'Error: Password do not match';
                          }
                          return null;
                        },
                        obscureText: !showPass2,
                        decoration: InputDecoration(
                            hintText: 'Enter your confirm  password',
                            label: const Text('Confirm Password'),
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18.0,
                              fontFamily: 'verdana_regular',
                              fontWeight: FontWeight.w400,
                            ),
                            prefixIcon: const Icon(Icons.vpn_key_sharp),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  showPass2 = !showPass2;
                                });
                              },
                              icon: Icon(
                                showPass2
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: const BorderSide(color: Colors.grey),
                            )),
                      ),
                      const SizedBox(height: 10.0),
                      //===== Button Submit Login =====
                      InkWell(
                        onTap: () {
                          signUp();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          height: 55.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.lock_open, color: Colors.white),
                              SizedBox(width: 5.0),
                              Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  wordSpacing: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                //===== Button Link Register =====
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        });
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
