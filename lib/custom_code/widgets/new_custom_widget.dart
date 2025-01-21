// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:file_picker/file_picker.dart';

class NewCustomWidget extends StatefulWidget {
  const NewCustomWidget({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  State<NewCustomWidget> createState() => _NewCustomWidgetState();
}

class _NewCustomWidgetState extends State<NewCustomWidget> {
  final List<String> capabilities = [
    'Calcular materiais necessários',
    'Sugerir esquemas de cores',
    'Medidas de layout',
    'Dicas de decoração'
  ];

  bool isConfigureMode = false;
  String? selectedFile;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade200,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.design_services,
                    color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 12),
                Text(
                  'Design Helper',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Spacer(),
                Row(
                  children: [
                    _buildTabButton('Create', !isConfigureMode),
                    _buildTabButton('Configure', isConfigureMode),
                  ],
                ),
              ],
            ),
          ),

          // Content Area
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Questions Section
                  ...capabilities
                      .map((capability) => _buildCapabilityItem(capability)),

                  // Add Button
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      label: const Text('Adicionar'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),

                  // Knowledge Section
                  const SizedBox(height: 24),
                  Text(
                    'Conhecimento',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 12),
                  _buildFileUploadArea(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String text, bool isSelected) {
    return InkWell(
      onTap: () {
        setState(() {
          isConfigureMode = text == 'Configure';
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey.shade100 : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isSelected ? Colors.black : Colors.grey,
              ),
        ),
      ),
    );
  }

  Widget _buildCapabilityItem(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade200,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {},
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildFileUploadArea() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.upload_file, size: 48),
          const SizedBox(height: 12),
          Text(
            'Escolha um arquivo ou arraste e solte aqui',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'JPEG, PNG, PDF e MP4 formatos até 50 MB',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey,
                ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _pickFile,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Procurar arquivos'),
          ),
        ],
      ),
    );
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf', 'mp4'],
    );

    if (result != null) {
      setState(() {
        selectedFile = result.files.single.name;
      });
    }
  }
}
