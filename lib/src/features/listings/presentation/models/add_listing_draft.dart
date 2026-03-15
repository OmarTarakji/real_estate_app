import 'package:image_picker/image_picker.dart';

class AddListingDraft {
  const AddListingDraft({
    required this.title,
    required this.description,
    required this.propertyType,
    required this.location,
    required this.area,
    required this.bedrooms,
    required this.bathrooms,
    required this.listingType,
    this.residents,
  });

  final String title;
  final String description;
  final String propertyType;
  final String location;

  final int area;
  final int bedrooms;
  final int bathrooms;
  final int? residents;

  /// 'بيع' | 'إيجار'
  final String listingType;
}

class AddListingAttachments {
  AddListingAttachments({
    List<XFile>? images,
    this.ownershipDocument,
    this.idDocument,
  }) : images = images ?? <XFile>[];

  final List<XFile> images;
  XFile? ownershipDocument;
  XFile? idDocument;
}
