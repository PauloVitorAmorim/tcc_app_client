import 'dart:io';
import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _Cadastro();
}


class _Cadastro extends State<Cadastro> {
  _Cadastro();

  File ? pic1;
  File ? pic2;
  File ? pic3;

  int activeStep = 0; 

  void _next(){setState(() => activeStep += 1);}

  InputDecoration decoration(String tip){
    return  InputDecoration(
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 0.5),
                ),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 150, 144, 144), width: 1),
                ),
                hintText: tip,
            );
  }

  Future _pickImageFromGallery1() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image != null){
      setState(() {
        pic1 = File(image.path);
      });     
    } 
  }

  Future _pickImageFromGallery2() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image != null){
      setState(() {
        pic2 = File(image.path);
      });     
    } 
  }

  Future _pickImageFromGallery3() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image != null){
      setState(() {
        pic3 = File(image.path);
      });
      
    } 
  }

  Widget getState(){
    Widget result = const Text("");

    switch(activeStep){
      case 0: result = Column(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          const Text(" "),
          const Text("Nome:"),
          TextFormField(
            decoration: decoration("Nome"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),

          const Text("Sexo:"),
          DropdownButton<String>(
            items: <String>['Masculino', 'Feminino', 'Outro',].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (_) {},
          ),

          const Text("Data de Nascimento:"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, children: [
             //const Text("                                                                                 "),
            DropdownButton<String>(
            items: <String>['01', '02', '03', '04', '05', ''].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (_) {},
          ),
          const Text("  "),
          DropdownButton<String>(
            items: <String>['Janeiro', 'Feminino', 'Outro',].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (_) {},
          ),
          const Text("  "),
          DropdownButton<String>(
            items: <String>['Masculino', 'Feminino', 'Outro',].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (_) {},
          ),
          ],),

          const Text("Numero de celular:"),
          TextFormField(
            decoration: decoration("(xx) x xxxx-xxxx"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),

          const Text("Email:"),
          TextFormField(
            decoration: decoration("seuemail@email.com"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          const Text(" "),
          ElevatedButton(onPressed: _next , child: const Text("Proximo"))]);
        break;

      case 1:
        result = Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("CEP:"),
            TextFormField(
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),

            const Text("Endereço:"),           
            TextFormField(
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),

            const Text("Numero:"),          
            TextFormField(
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Estado:  "),                    
                  DropdownButton<String>(
                    value: "SP",
                    items: <String>["SP", '02', '03', '04', '05', ''].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                  const Text("    "),  
                  const Text("Cidade:  "),           
              DropdownButton<String>(
                value: "Valinhos",
                items: <String>["Valinhos", '02', '03', '04', '05', ''].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
          ],),
            const Text(" "),
            ElevatedButton(onPressed: _next , child: const Text("Próximo"))
          ]);
        break;

      case 2:
        result = Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Biometria:"),
            GestureDetector(
                onTap:_pickImageFromGallery1,
                child: Container(
                width: 150,
                height: 150, 
                decoration: pic1 != null? BoxDecoration(       
                  color: Colors.black,
                  image: DecorationImage(
                    image:FileImage(pic1!), 
                    fit:BoxFit.cover
                  ),
                ): const BoxDecoration(       
                  color: Color.fromARGB(255, 121, 114, 114),
                ),
                child: const Text("clickMe")
              )
            ),

             const Text(" "),
            GestureDetector(
                onTap:_pickImageFromGallery2,
                child: Container(
                width: 150,
                height: 150, 
                decoration: pic2 != null? BoxDecoration(       
                  color: Colors.black,
                  image: DecorationImage(
                    image:FileImage(pic2!), 
                    fit:BoxFit.cover
                  ),
                ): const BoxDecoration(       
                  color: Color.fromARGB(255, 121, 114, 114),
                ),
                child: const Text("clickMe")
              )
            ),

            const Text(" "),
            GestureDetector(
                onTap:_pickImageFromGallery3,
                child: Container(
                width: 150,
                height: 150, 
                decoration: pic3 != null? BoxDecoration(       
                  color: Colors.black,
                  image: DecorationImage(
                    image:FileImage(pic3!), 
                    fit:BoxFit.cover
                  ),
                ): const BoxDecoration(       
                  color: Color.fromARGB(255, 121, 114, 114),
                ),
                child: const Text("clickMe")
                )),//mageFromGallery3,
            const Text(" "),
            const Text(" "),
            ElevatedButton(onPressed: _next , child: const Text("Proximo"))
          ]);
        break;

      case 3:
        result = Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Pagamento:"),
            const Text(" "),
            const Text("Numero do cartão de credito:"),
            TextFormField(
              decoration: decoration("0000000000000000000"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
             const Text(" "),
            const Text("Nome:"),
            TextFormField(
              decoration: decoration("NOME COMO ESTA NO CARTAO"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const Text(" "),
            const Text("Data:"),
            TextFormField(
              decoration: decoration("MM / AA"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const Text(" "),
            const Text("CVV:"),
            TextFormField(
              decoration: decoration("CVV"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            ElevatedButton(onPressed: _next , child: const Text("Proximo"))
          ]);
        break;

      case 4:
      result = Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Finalizar:"),
            const Text(" "),
            ElevatedButton(onPressed:  () {
              Navigator.pop(context);
            }, child: const Text("Enviar"))
          ]);
        break;

    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0), child:  Center(

        child: Column(children: [
          EasyStepper(
                  activeStep: activeStep,
                  lineStyle: const LineStyle(
                    lineLength: 50,
                    lineType: LineType.normal,
                    lineThickness: 3,
                    lineSpace: 1,
                    lineWidth: 10,
                    unreachedLineType: LineType.dashed,
                  ),
                  stepShape: StepShape.rRectangle,
                  stepBorderRadius: 15,
                  borderThickness: 2,
                  internalPadding: 10,
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                  stepRadius: 28,
                  finishedStepBorderColor: Colors.deepOrange,
                  finishedStepTextColor: Colors.deepOrange,
                  finishedStepBackgroundColor: Colors.deepOrange,
                  activeStepIconColor: Colors.deepOrange,
                  showLoadingAnimation: false,
                  steps: [
                    EasyStep(
                      customStep: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Opacity(
                          opacity: activeStep >= 0 ? 1 : 0.3,
                        ),
                      ),
                      customTitle: const Text(
                        'Identificação',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    EasyStep(
                      customStep: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Opacity(
                          opacity: activeStep >= 1 ? 1 : 0.3,
                        ),
                      ),
                      customTitle: const Text(
                        'Endereço',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    EasyStep(
                      customStep: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Opacity(
                          opacity: activeStep >= 2 ? 1 : 0.3,
                        ),
                      ),
                      customTitle: const Text(
                        'Identificação biometrica',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    EasyStep(
                      customStep: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Opacity(
                          opacity: activeStep >= 3 ? 1 : 0.3,
                        ),
                      ),
                      customTitle: const Text(
                        'Pagamento',
                        textAlign: TextAlign.center,
                      ),),

                    EasyStep(
                      customStep: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Opacity(
                          opacity: activeStep >= 3 ? 1 : 0.3,
                        ),
                      ),
                      customTitle: const Text(
                        'Finalizar',
                        textAlign: TextAlign.center,
                      ),),
                  ],
                  onStepReached: (index) => setState(() => activeStep = index),
                ),             
        
          getState()],) )
      
    ));
  }
}