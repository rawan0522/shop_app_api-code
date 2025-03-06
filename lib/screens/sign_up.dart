import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_api/screens/login.dart';

import '../providers/registeration_provider.dart';
import '../widgets/custom_text_field.dart';

class SignUp extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterProvider providerObject =
        Provider.of<RegisterProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Signup",
            style: TextStyle(fontSize: 24),
          ),
        ),
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.settings),
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            children: [
              CustomTextField(
                controller: nameController,
                labelText: "User Name",
                icon: Icons.person,
              ),
              CustomTextField(
                controller: phoneController,
                labelText: "Phone",
                icon: Icons.phone,
              ),
              CustomTextField(
                controller: emailController,
                labelText: "Email",
                icon: Icons.email,
              ),
              CustomTextField(
                controller: passwordController,
                labelText: "Password",
                icon: Icons.lock,
                obscureText: true,
              ),

              const SizedBox(height: 10),
              // Signup button
              SizedBox(
                width: 150,
                child: Consumer<RegisterProvider>(
                  builder: (context, value, child) {
                    return value.isLoading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                await providerObject.registerUser(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  name: nameController.text,
                                  phone: phoneController.text,
                                );
                                if (providerObject.userModel != null) {

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginPage(),
                                    ),
                                  );
                                }
                              }
                            },
                            child: const Text("Signup"),
                          );
                  },
                ),
              ),
              // Already have an account?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Return to login page
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
