import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var selectedValue = 0;
  var selectedText = '';
  final emailController= TextEditingController();
  final ageController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUp'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              // onChanged: (emailController){
              //   print(emailController.toString());
              // },
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
                label: Text('Email'),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Age',
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField(
                //value: selectedValue,   // it sets default value to display
              hint: const Text('Select Usertype'),
                items: const [
              /*DropdownMenuItem(
                child: Text('Select user role'),
                value: -1,
              ),*/
              DropdownMenuItem(
                value: 1,
                child: Text('Admin'),
              ),
              DropdownMenuItem(
                value: 2,
                child: Text('Teacher'),
              ),
              DropdownMenuItem(
                value: 3,
                child: Text('Student'),
              ),
            ], onChanged: (value) {
                  selectedValue = value!;
                 // selectedText= getSelectedText(value);
                 // print(selectedText);
                  setState(() {

                  });

                  //print('Tap');
            }),
          ),
          const SizedBox(height: 40,),
          InkWell(
            onTap: () async{
              SharedPreferences sp= await SharedPreferences.getInstance();
              sp.setString('email', emailController.text.toString());
              sp.setString('age', ageController.text.toString());
              sp.setInt('userType', selectedValue);
              sp.setBool('isLogin', true);
              //print(sp.getString('email'));
              if (selectedValue==1){
                Navigator.pushNamed(context, '/adminScreen');
              }
              else if(selectedValue==2){
                Navigator.pushNamed(context, '/teacherScreen');
              }
              else if(selectedValue==3){
                Navigator.pushNamed(context, '/studentScreen');
              }
              else{
                Navigator.pushNamed(context, '/signUp');
              }

             // print('Tap');


            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                    child: Text(
                  'Signup',
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
//  String getSelectedText(int newValue){
// switch(newValue){
//   case -1:
//     return 'Select user role';
//   case 1:
//       return 'Admin';
//   case 2:
//     return 'Teacher';
//   case 3:
//     return 'Student';
//   default:
//     return '';
//
// }
//  }
}
