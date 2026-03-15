import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:real_estate_app/src/features/listings/presentation/widgets/form_section.dart';

import '../models/add_listing_draft.dart';

class AddListingStep2Screen extends StatefulWidget {
  const AddListingStep2Screen({required this.draft, super.key});

  final AddListingDraft draft;

  @override
  State<AddListingStep2Screen> createState() => _AddListingStep2ScreenState();
}

class _AddListingStep2ScreenState extends State<AddListingStep2Screen> {
  final _formKey = GlobalKey<FormState>();

  final _imagePicker = ImagePicker();
  final _attachments = AddListingAttachments();

  final _salePriceController = TextEditingController();
  final _rentDailyController = TextEditingController();
  final _rentMonthlyController = TextEditingController();
  final _rentYearlyController = TextEditingController();

  bool _isNegotiable = false;

  String _propertyPosition = 'مالك';
  final _propertyRelationController = TextEditingController();

  @override
  void dispose() {
    _salePriceController.dispose();
    _rentDailyController.dispose();
    _rentMonthlyController.dispose();
    _rentYearlyController.dispose();
    _propertyRelationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('إضافة إعلان (2/2)')),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              FormSection(
                title: 'صور العقار',
                icon: LucideIcons.image,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: _pickImagesFromGallery,
                            icon: const Icon(LucideIcons.images, size: 18),
                            label: const Text('اختيار من المعرض'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: _pickFromCamera,
                            icon: const Icon(LucideIcons.camera, size: 18),
                            label: const Text('التقاط صورة'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    if (_attachments.images.isEmpty)
                      Text(
                        'لم يتم اختيار أي صور بعد.',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      )
                    else
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: List.generate(_attachments.images.length, (
                          index,
                        ) {
                          final file = _attachments.images[index];
                          return Stack(
                            clipBehavior: Clip.none,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.file(
                                  File(file.path),
                                  width: 96,
                                  height: 96,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: -8,
                                right: -8,
                                child: IconButton.filledTonal(
                                  visualDensity: VisualDensity.compact,
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(
                                    minWidth: 30,
                                    minHeight: 30,
                                  ),
                                  onPressed: () => _removeImageAt(index),
                                  icon: const Icon(Icons.close, size: 16),
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              FormSection(
                title: 'السعر',
                icon: LucideIcons.dollarSign,
                child: Column(
                  children: [
                    if (widget.draft.listingType == 'بيع') ...[
                      TextFormField(
                        controller: _salePriceController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          labelText: 'السعر المطلوب',
                          prefixIcon: Icon(LucideIcons.dollarSign, size: 18),
                        ),
                        validator: (value) =>
                            _requiredPositiveInt(value, 'الرجاء إدخال السعر'),
                      ),
                      const SizedBox(height: 12),
                      SwitchListTile.adaptive(
                        value: _isNegotiable,
                        onChanged: (value) =>
                            setState(() => _isNegotiable = value),
                        title: const Text('قابل للتفاوض'),
                        contentPadding: EdgeInsets.zero,
                      ),
                    ] else ...[
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _rentDailyController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                labelText: 'سعر يومي',
                                prefixIcon: Icon(
                                  LucideIcons.calendar,
                                  size: 18,
                                ),
                              ),
                              validator: _optionalPositiveInt,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextFormField(
                              controller: _rentMonthlyController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                labelText: 'سعر شهري',
                                prefixIcon: Icon(
                                  LucideIcons.calendarDays,
                                  size: 18,
                                ),
                              ),
                              validator: _optionalPositiveInt,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _rentYearlyController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          labelText: 'سعر سنوي',
                          prefixIcon: const Icon(
                            LucideIcons.calendar,
                            size: 18,
                          ),
                        ),
                        validator: _optionalPositiveInt,
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          'الرجاء إدخال سعر واحد على الأقل (يومي أو شهري أو سنوي).',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 16),
              FormSection(
                title: 'المستندات',
                icon: LucideIcons.fileText,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DropdownButtonFormField<String>(
                      initialValue: _propertyPosition,
                      items: const [
                        DropdownMenuItem(value: 'مالك', child: Text('مالك')),
                        DropdownMenuItem(
                          value: 'مفوض من المالك',
                          child: Text('مفوض من المالك'),
                        ),
                      ],
                      onChanged: (value) {
                        if (value == null) return;
                        setState(() => _propertyPosition = value);
                      },
                      decoration: const InputDecoration(
                        labelText: 'صفتي بالنسبة للعقار',
                        prefixIcon: Icon(LucideIcons.user, size: 18),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _propertyRelationController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        labelText: 'اشرح علاقتك بالعقار (مالك/مفوض/وكالة...)',
                        alignLabelWithHint: true,
                        prefixIcon: const Icon(
                          LucideIcons.messageSquare,
                          size: 18,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'الرجاء كتابة شرح مختصر';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: _pickOwnershipFromGallery,
                            icon: const Icon(LucideIcons.upload, size: 18),
                            label: const Text('رفع مستند الملكية'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: _pickIdFromGallery,
                            icon: const Icon(LucideIcons.idCard, size: 18),
                            label: const Text('رفع صورة الهوية'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        if (_attachments.ownershipDocument != null)
                          _DocPreview(
                            file: _attachments.ownershipDocument!,
                            label: 'مستند الملكية',
                            onRemove: () => setState(
                              () => _attachments.ownershipDocument = null,
                            ),
                          ),
                        if (_attachments.idDocument != null)
                          _DocPreview(
                            file: _attachments.idDocument!,
                            label: 'الهوية',
                            onRemove: () =>
                                setState(() => _attachments.idDocument = null),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _submit,
                  child: const Text('إرسال الإعلان'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickImagesFromGallery() async {
    try {
      final files = await _imagePicker.pickMultiImage();
      if (files.isEmpty) return;
      setState(() => _attachments.images.addAll(files));
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('تعذر اختيار الصور: $e')));
    }
  }

  Future<void> _pickFromCamera() async {
    try {
      final file = await _imagePicker.pickImage(source: ImageSource.camera);
      if (file == null) return;
      setState(() => _attachments.images.add(file));
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('تعذر فتح الكاميرا: $e')));
    }
  }

  void _removeImageAt(int index) {
    setState(() => _attachments.images.removeAt(index));
  }

  Future<void> _pickOwnershipFromGallery() async {
    try {
      final file = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (file == null) return;
      setState(() => _attachments.ownershipDocument = file);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('تعذر اختيار مستند الملكية: $e')));
    }
  }

  Future<void> _pickIdFromGallery() async {
    try {
      final file = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (file == null) return;
      setState(() => _attachments.idDocument = file);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('تعذر اختيار صورة الهوية: $e')));
    }
  }

  void _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    if (widget.draft.listingType == 'إيجار') {
      final hasAnyRentPrice =
          _rentDailyController.text.trim().isNotEmpty ||
          _rentMonthlyController.text.trim().isNotEmpty ||
          _rentYearlyController.text.trim().isNotEmpty;

      if (!hasAnyRentPrice) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'للإيجار: الرجاء إدخال سعر واحد على الأقل (يومي أو شهري أو سنوي)',
            ),
          ),
        );
        return;
      }
    }

    if (_attachments.ownershipDocument == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('الرجاء رفع مستند الملكية')));
      return;
    }

    if (_attachments.idDocument == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('الرجاء رفع صورة الهوية')));
      return;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('تم إرسال الإعلان (محاكاة)')));
  }

  String? _requiredPositiveInt(String? value, String message) {
    if (value == null || value.trim().isEmpty) return message;
    final parsed = int.tryParse(value.trim());
    if (parsed == null) return 'الرجاء إدخال رقم صحيح';
    if (parsed <= 0) return 'يجب أن يكون أكبر من صفر';
    return null;
  }

  String? _optionalPositiveInt(String? value) {
    if (value == null || value.trim().isEmpty) return null;
    final parsed = int.tryParse(value.trim());
    if (parsed == null) return 'الرجاء إدخال رقم صحيح';
    if (parsed <= 0) return 'يجب أن يكون أكبر من صفر';
    return null;
  }
}

class _DocPreview extends StatelessWidget {
  const _DocPreview({
    required this.file,
    required this.label,
    required this.onRemove,
  });

  final XFile file;
  final String label;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  File(file.path),
                  width: 120,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                label,
                style: theme.textTheme.bodySmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
        Positioned(
          top: -8,
          right: -8,
          child: IconButton.filledTonal(
            visualDensity: VisualDensity.compact,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 30, minHeight: 30),
            onPressed: onRemove,
            icon: const Icon(Icons.close, size: 16),
          ),
        ),
      ],
    );
  }
}
