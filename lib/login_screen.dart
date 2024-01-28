import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isScure = true;
  var icon = Icons.visibility;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Brand"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Image.network(
                "https://th.bing.com/th/id/R.2bf2549fa783312b5941919348654c8b?rik=HwlUuVqm7vWKeg&riu=http%3a%2f%2fapphocus.com%2fwp-content%2fuploads%2f2016%2f04%2fBranding-and-Logo-2.jpg&ehk=Zg%2fDuvI%2fnKRX2UvMXk85XelP5bsgpNwCojfzHi2%2bR0M%3d&risl=&pid=ImgRaw&r=0",
                height: MediaQuery.of(context).size.height / 3.5,
                width: MediaQuery.of(context).size.width / 1.2,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "example@gmail.com",
                  label: const Text("Email"),
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              obscureText: isScure,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(icon),
                    onPressed: () {
                      setState(() {
                        isScure = !isScure;
                        isScure
                            ? icon = Icons.visibility
                            : icon = Icons.visibility_off;
                      });
                    },
                  ),
                  hintText: "P@ssw0rd",
                  label: const Text("Password"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
                onPressed: () {},
                child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Login",
                        textAlign: TextAlign.center,
                      ),
                    ))),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have account?",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                TextButton(onPressed: () {}, child: const Text("Create one"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
