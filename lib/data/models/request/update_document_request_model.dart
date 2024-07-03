import 'dart:io';

class UpdateDocumentRequestModel {
  final String documentType;
  final String method;
  final File documentFile;
  UpdateDocumentRequestModel({
    required this.documentType,
    required this.method,
    required this.documentFile,
  });

  Map<String, String> toMap() => {
        "document_type": documentType,
        '_method': method,
      };
}
