import 'package:bemet/service/SaveAccount.dart';
import 'package:bemet/service/bemetService.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  bool loading = false;
  bool statusAccount = false;

  @override
  void initState() {
    validSaveAccount();
    super.initState();
  }

  validSaveAccount() async {
    try {
       final response = await SaveAccount().getSaveAccount();
    final responseTypeRol = await SaveAccount().getSaveTypeRol();
    if (!response!) {
      return;
    }
    if (mounted) {}
    if (responseTypeRol == "admin") {
      Navigator.popAndPushNamed(context, "menu-admin");
    } else {
      Navigator.popAndPushNamed(context, "menu");
    }
    } catch (e) {
      print("cerrando session");
    }
   
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Image(height: 240, image: AssetImage("assets/logo.jpg")),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: size.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(5)),
                child: TextField(
                  controller: _controllerEmail,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      labelText: "Nombre Usuario",
                      floatingLabelStyle: TextStyle(color: Colors.orange),
                      border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: size.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(5)),
                child: TextField(
                  controller: _controllerPassword,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      labelText: "Contraseña",
                      floatingLabelStyle: TextStyle(color: Colors.orange),
                      border: InputBorder.none),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("¿Guardar Inicio de sesión?"),
                  Checkbox(
                      activeColor: Colors.orange,
                      value: statusAccount,
                      onChanged: (v) {
                        setState(() {
                          statusAccount = v!;
                        });
                      }),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  setState(() {
                    loading = true;
                  });
                  final response = await BemetService()
                      .login(_controllerEmail.text, _controllerPassword.text);

                  switch (response["status"]) {
                    case StatusResponse.Error:
                      {
                        verifyMounted(StatusResponse.Error);
                      }
                      break;
                    case StatusResponse.ErrorCredencial:
                      {
                        verifyMounted(StatusResponse.ErrorCredencial);
                      }
                      break;
                    case StatusResponse.Successfully:
                      {
                        verifyMounted(
                            StatusResponse.Successfully, response["user"]);
                      }
                      break;
                    default:
                  }
                },
                child: Container(
                  width: size.width * 0.9,
                  height: size.height * 0.07,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      gradient: LinearGradient(
                          colors: [Colors.orange, Colors.orange[200]!]),
                      borderRadius: BorderRadius.circular(9)),
                  child: Center(
                      child: loading
                          ? Transform.scale(
                              scale: 0.8,
                              child: const CircularProgressIndicator(
                                backgroundColor: Colors.white,
                                color: Colors.orange,
                              ),
                            )
                          : const Text(
                              "Iniciar sesión",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.27),
                child: Text(
                  "By wedler_0xff",
                  style: TextStyle(color: Colors.grey.withOpacity(0.6)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  verifyMounted(StatusResponse type, [response]) {
    if (mounted) {
      setState(() {
        loading = false;
      });
      switch (type) {
        case StatusResponse.Error:
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Error of server")));
          break;
        case StatusResponse.ErrorCredencial:
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Error of credencial")));
          break;
        case StatusResponse.Successfully:
          {
            saveAccount(response.rol);
            if (response.rol == "admin") {
              Navigator.popAndPushNamed(context, "menu-admin");
            } else {
              Navigator.popAndPushNamed(context, "menu");
            }
          }
          break;
        default:
      }
    }
  }

  saveAccount(String rol) {
    if (statusAccount) {
      SaveAccount().saveAccount(rol);
    }
  }
}
