import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'ProfileHome.dart'; // Asegúrate de importar correctamente tu archivo

class ProfileEdith extends StatefulWidget {
  @override
  _ProfileEdithState createState() => _ProfileEdithState();
}

class _ProfileEdithState extends State<ProfileEdith> {
  File? _image;
  final String _defaultImagePath = 'assets/profile.png';

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false, // Para evitar el redimensionamiento cuando aparece el teclado
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Spacer(flex: 1),
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 80,
                        backgroundImage: _image == null
                            ? AssetImage(_defaultImagePath)
                            : FileImage(_image!) as ImageProvider,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () async {
                            await showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Center(child: Text('Elige una opción')),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        _pickImage(ImageSource.gallery);
                                        Navigator.of(context).pop();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 214, 113, 229),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 40, vertical: 8),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ), // Color del botón
                                      ),
                                      child: const Text('Selecciona una imagen', style: TextStyle(
                                            color: Colors.white, fontSize: 15.0),),
                                    ),
                                    const SizedBox(height: 20),
                                    ElevatedButton(
                                      onPressed: () {
                                        _pickImage(ImageSource.camera);
                                        Navigator.of(context).pop();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 214, 113, 229),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 40, vertical: 8),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ), // Color del botón
                                      ),
                                      child: const Text(
                                        'Tomar foto',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              color: Colors.grey,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 35),
                _buildProfileTextField(Icons.person, 'Eider Pool'),
                const SizedBox(height: 20),
                _buildProfileTextField(Icons.email, 'John@gmail.com'),
                const SizedBox(height: 20),
                _buildProfileTextField(Icons.phone, '+52(999)929737'),
                const SizedBox(height: 20),
                _buildProfileTextField(Icons.lock, '*************',
                    obscureText: true),
                const Spacer(flex: 3),
              ],
            ),
          ),
          Positioned(
            bottom: 70.0,
            left: 16.0,
            right: 16.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 214, 113, 229), // Background color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 55, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileHome()),
                    );
                  },
                  child: const Text('Cancelar',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 214, 113, 229), // Background color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 55, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Guardar',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileTextField(IconData icon, String hintText,
      {bool obscureText = false}) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(2.0),
          child: Icon(icon, color: Colors.grey),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            obscureText: obscureText,
            textAlign: TextAlign.center, // Alinea el texto al centro
            decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 20),
            ),
          ),
        ),
      ],
    );
  }
}
