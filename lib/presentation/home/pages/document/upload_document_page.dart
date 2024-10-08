import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../../data/models/request/update_document_request_model.dart';
import '../../bloc/documentData/document_data_bloc.dart';
import '../../bloc/uploadDocument/upload_document_bloc.dart';

class UploadDocumentPage extends StatefulWidget {
  final String documentType;
  final String transactionId;
  const UploadDocumentPage({
    super.key,
    required this.documentType,
    required this.transactionId,
  });

  @override
  State<UploadDocumentPage> createState() => _UploadDocumentPageState();
}

class _UploadDocumentPageState extends State<UploadDocumentPage> {
  File? selectedFile; // Variable to store the selected file

  Future<void> _pickFile() async {
    final FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    setState(() {
      if (pickedFile != null) {
        selectedFile = File(pickedFile.files.single.path!);
      } else {
        selectedFile = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Upload Document'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
          child: Column(
            children: [
              Text(
                  'Upload Document ${widget.documentType} for ${widget.transactionId}'),
              Column(
                children: [
                  InkWell(
                    onTap: _pickFile,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Select document',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.upload_file),
                      ],
                    ),
                  ),
                  const SpaceHeight(8),
                  if (selectedFile != null)
                    Text(
                      'Selected file: ${selectedFile!.path.split('/').last}',
                      style:
                          const TextStyle(fontSize: 16, color: AppColors.black),
                    ),
                ],
              ),
              const SpaceHeight(16),
              BlocConsumer<UploadDocumentBloc, UploadDocumentState>(
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: () {},
                    error: (message) {
                      return ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Error: $message'),
                          backgroundColor: AppColors.red,
                        ),
                      );
                    },
                    success: (state) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'Upload SUCCESS'), //menampilkan snackbar success
                          backgroundColor: AppColors.green,
                        ),
                      );
                      Navigator.pop(context); //kembali ke halaman sebelumnya
                      context.read<DocumentDataBloc>().add(
                            DocumentDataEvent.getDocumentsData(
                                widget.transactionId),
                          );
                    },
                  );
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    orElse: () {
                      return Button.filled(
                        label: 'Upload Document',
                        onPressed: () {
                          if (selectedFile == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please select a file'),
                                backgroundColor: AppColors.red,
                              ),
                            );
                          } else {
                            final dataRequest = UpdateDocumentRequestModel(
                              documentType: widget.documentType,
                              method: 'PUT',
                              documentFile: selectedFile!,
                            );
                            context.read<UploadDocumentBloc>().add(
                                  UploadDocumentEvent.uploadDocument(
                                    dataRequest,
                                    widget.transactionId,
                                  ),
                                );
                          }
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget selectFile(String label) {
    return DottedBorder(
      strokeWidth: 3,
      dashPattern: const [6, 6],
      strokeCap: StrokeCap.round,
      borderType: BorderType.RRect,
      radius: const Radius.circular(10),
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: _pickFile,
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: const Color(0xFF1C3E66),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.folder_open_rounded,
                color: Color(0xFFFFFFFF),
                size: 32,
              ),
              const SpaceWidth(16),
              Text(
                label,
                style: const TextStyle(color: AppColors.primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
