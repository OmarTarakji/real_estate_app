import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../models/add_listing_draft.dart';
import '../widgets/form_section.dart';
import 'add_listing_step2_screen.dart';

class AddListingStep1Screen extends StatefulWidget {
  const AddListingStep1Screen({super.key});

  @override
  State<AddListingStep1Screen> createState() => _AddListingStep1ScreenState();
}

class _AddListingStep1ScreenState extends State<AddListingStep1Screen> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();

  final _areaController = TextEditingController();
  final _bedroomsController = TextEditingController();
  final _bathroomsController = TextEditingController();
  final _residentsController = TextEditingController();

  String? _propertyType;
  String _listingType = 'بيع';

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    _areaController.dispose();
    _bedroomsController.dispose();
    _bathroomsController.dispose();
    _residentsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('إضافة إعلان (1/2)')),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              FormSection(
                title: 'معلومات أساسية',
                icon: LucideIcons.clipboardList,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _titleController,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'عنوان الإعلان',
                        prefixIcon: Icon(LucideIcons.type, size: 18),
                      ),
                      validator: (value) =>
                          _requiredText(value, 'الرجاء إدخال عنوان الإعلان'),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _descriptionController,
                      maxLines: 4,
                      decoration: const InputDecoration(
                        labelText: 'وصف العقار',
                        alignLabelWithHint: true,
                        prefixIcon: Icon(LucideIcons.fileText, size: 18),
                      ),
                      validator: (value) =>
                          _requiredText(value, 'الرجاء إدخال وصف العقار'),
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<String>(
                      value: _propertyType,
                      items: const [
                        DropdownMenuItem(value: 'شقة', child: Text('شقة')),
                        DropdownMenuItem(value: 'فيلا', child: Text('فيلا')),
                        DropdownMenuItem(value: 'أرض', child: Text('أرض')),
                        DropdownMenuItem(value: 'مزرعة', child: Text('مزرعة')),
                        DropdownMenuItem(
                          value: 'محل تجاري',
                          child: Text('محل تجاري'),
                        ),
                        DropdownMenuItem(value: 'غرفة', child: Text('غرفة')),
                      ],
                      onChanged: (value) =>
                          setState(() => _propertyType = value),
                      decoration: InputDecoration(
                        labelText: 'نوع العقار',
                        prefixIcon: const Icon(LucideIcons.house, size: 18),
                      ),
                      validator: (value) =>
                          _requiredText(value, 'الرجاء اختيار نوع العقار'),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _locationController,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        labelText: 'الموقع (المدينة/المنطقة)',
                        prefixIcon: Icon(LucideIcons.mapPin, size: 18),
                      ),
                      validator: (value) =>
                          _requiredText(value, 'الرجاء إدخال الموقع'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              FormSection(
                title: 'تفاصيل العقار',
                icon: LucideIcons.info,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _areaController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'المساحة (م²)',
                        prefixIcon: Icon(LucideIcons.maximize2, size: 18),
                      ),
                      validator: (value) =>
                          _requiredPositiveInt(value, 'الرجاء إدخال المساحة'),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _bedroomsController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              labelText: 'غرف',
                              prefixIcon: Icon(LucideIcons.bed, size: 18),
                            ),
                            validator: (value) =>
                                _requiredPositiveInt(value, 'مطلوب'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextFormField(
                            controller: _bathroomsController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              labelText: 'حمامات',
                              prefixIcon: Icon(LucideIcons.bath, size: 18),
                            ),
                            validator: (value) =>
                                _requiredPositiveInt(value, 'مطلوب'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _residentsController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'عدد النزلاء (اختياري)',
                        prefixIcon: Icon(LucideIcons.users, size: 18),
                      ),
                      validator: _optionalPositiveInt,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              FormSection(
                title: 'نوع الإعلان',
                icon: LucideIcons.tag,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SegmentedButton<String>(
                      segments: const [
                        ButtonSegment(value: 'بيع', label: Text('بيع')),
                        ButtonSegment(value: 'إيجار', label: Text('إيجار')),
                      ],
                      selected: {_listingType},
                      onSelectionChanged: (value) =>
                          setState(() => _listingType = value.first),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      _listingType == 'بيع'
                          ? 'أكمل الخطوات التالية لإضافة السعر والمستندات.'
                          : 'أكمل الخطوات التالية لإضافة أسعار الإيجار والمستندات.',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _onNext,
                  child: const Text('التالي'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onNext() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    final residentsText = _residentsController.text.trim();
    final draft = AddListingDraft(
      title: _titleController.text.trim(),
      description: _descriptionController.text.trim(),
      propertyType: _propertyType!.trim(),
      location: _locationController.text.trim(),
      area: int.parse(_areaController.text.trim()),
      bedrooms: int.parse(_bedroomsController.text.trim()),
      bathrooms: int.parse(_bathroomsController.text.trim()),
      residents: residentsText.isEmpty ? null : int.parse(residentsText),
      listingType: _listingType,
    );

    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => AddListingStep2Screen(draft: draft)),
    );
  }

  String? _requiredText(String? value, String message) {
    if (value == null || value.trim().isEmpty) return message;
    return null;
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
