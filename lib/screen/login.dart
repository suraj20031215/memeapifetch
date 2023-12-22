import 'package:exampledemo/screen/home.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}





class _LoginScreenState extends State<LoginScreen> {
  bool passwordVisibles=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        decoration: const BoxDecoration(

          image: DecorationImage(
              image: AssetImage("assets/images/bgimg.jpeg"),fit: BoxFit.cover),
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Image.asset("assets/images/loginicon.jpeg"),
            Container(
              margin: const EdgeInsets.only(left: 20,right: 20,top: 20),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Text('Email Id'),
                    ],
                  ),
                  const TextField(
                    decoration: InputDecoration(border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(width: 1)),
                        prefixIcon: Icon(Icons.email_outlined)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Text('Company ID'),
                    ],
                  ),
                  const TextField(
                      decoration: InputDecoration(border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(width: 1)),
                          prefixIcon: Icon(Icons.factory_outlined))
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                   Row(
                    children: [
                      Text('Password'),
                    ],
                  ),
                   TextField(

                    obscureText: passwordVisibles,
                    decoration: InputDecoration(
                      // focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(0, 119, 182, 1)),   borderRadius: BorderRadius.all(Radius.circular(50))),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        // borderSide: BorderSide(width: 1)
                      ),
                      hintText: "Password",
                      // labelText: "Password",
                      fillColor: Colors.white,
                      filled: true,

                      prefixIcon: const Icon(Icons.lock_outline),
                      // helperText:"Password must contain special character",
                      helperStyle:const TextStyle(color:Colors.red),
                      suffixIcon: IconButton(
                        icon: Icon(passwordVisibles
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(
                                () {
                              passwordVisibles = !passwordVisibles;
                            },
                          );
                        },
                      ),
                      alignLabelWithHint: false,
                      // filled: true,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  SizedBox(

                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(6, 6, 6, 1)),
                        onPressed: () {

                                 Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                        },
                        child: Text('Login',style: TextStyle(color: Colors.white),)),
                  )
                ],
              ),
            ),

          ],
        ),
      ),

    );}
}
