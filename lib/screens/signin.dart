import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app_template/screens/forgot_pass.dart';
import 'package:travel_app_template/utils/already_have_an_account_check.dart';
import 'package:travel_app_template/utils/colors_const.dart';
import 'package:travel_app_template/utils/strings.dart';
import 'bottom_navigation.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Stack(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            color: Theme.of(context).backgroundColor,
                            height: MediaQuery.of(context).size.height*0.4,
                            width: double.infinity,
                            child: ImageIcon(
                              
                              AssetImage('assets/icon/waves.png'),
                              color: ColorsConstants.amberColor,
                              
                            ),
                              
                          ),
                          Expanded(child: Container()),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: TextField(
                              onChanged: (text){

                              },
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                prefixIconConstraints:const BoxConstraints(minWidth: 35, maxHeight: 35),
                                prefixIcon:Padding(
                                  padding: const EdgeInsetsDirectional.only(start: 12.0,end: 5.0),
                                  child: ImageIcon(
                                    AssetImage('assets/icon/icon_email.png'),
                                    color:ColorsConstants.amberColor,
                                    size:45
                                  ),
                                ),

                                hintText: Strings.hintEmail,
                                hintStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                focusedBorder: (OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                )),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: TextField(
                              onChanged: (text){

                              },
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIconConstraints:const BoxConstraints(minWidth: 35, maxHeight: 35),
                                prefixIcon:Padding(
                                  padding: const EdgeInsetsDirectional.only(start: 12.0,end: 5.0),
                                  child: ImageIcon(
                                    AssetImage('assets/icon/icon_password.png'),
                                    color:ColorsConstants.amberColor,
                                    size:45
                                  ),
                                ),
                                hintText: Strings.hintPassword,
                                hintStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                focusedBorder: (OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                )),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const BottomNavigationScreen()));
                              },
                              child: Container(
                                padding: const EdgeInsets.only(top: 15,bottom: 15),
                                decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(30),
                                  color: ColorsConstants.amberColor
                                ),
                                child: Center(
                                  child: Text(
                                          Strings.signIn,
                                          style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          CupertinoButton(
                            onPressed: () => {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ForgotPasswordScreen()))
                            },
                            child: Text(
                              Strings.forgotPassword,
                              style: TextStyle(
                                color: ColorsConstants.amberColor,
                                letterSpacing: 2,
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Expanded(child: Container()),
                          AlreadyHaveAnAccountCheck(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            color: ColorsConstants.amberColor,
                            leftTextColor: ColorsConstants.amberColor,
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                      Positioned(
                        left: 0,
                        top:  MediaQuery.of(context).size.height*0.1,
                        right: 0,
                        child: Container(
                          margin: EdgeInsets.zero,
                          width: 100,
                          height: 100,
                          child: Image.asset(
                            'assets/icon/logo.png',
                            fit: BoxFit.contain,
                            width: 100,
                            height: 100,
                            color: Colors.white,
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
      ),
    );
  }
}
