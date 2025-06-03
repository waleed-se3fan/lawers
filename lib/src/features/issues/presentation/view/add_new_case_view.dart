import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawers/core/common/widgets/custom_text_form_field.dart';
import 'package:lawers/src/features/issues/presentation/logic/bloc/issues_bloc.dart';

class AddNewCaseView extends StatefulWidget {
  const AddNewCaseView({super.key});

  @override
  State<AddNewCaseView> createState() => _AddNewCaseViewState();
}

class _AddNewCaseViewState extends State<AddNewCaseView> {
  // Controllers for form fields
  final clientNameController = TextEditingController(text: 'العميل رقم 1');
  final caseNumberController = TextEditingController(text: 'SC12345');
  final caseDateController = TextEditingController(text: '15-05-2023');
  final caseTitleController = TextEditingController(text: 'قضية دو ضد سميث');
  final caseTypeController = TextEditingController(text: 'فئة القضية 1');
  final courtNameController = TextEditingController(text: 'المحكمة العليا');
  final circleController = TextEditingController(text: 'المنطقة 1');
  final opponentNameController = TextEditingController(text: 'جون دو');
  final opponentTypeController = TextEditingController(text: 'فرد');
  final opponentPhoneController = TextEditingController(text: '1234567890');
  final opponentAddressController = TextEditingController(
    text: '123 شارع رئيسي، المدينة',
  );
  final opponentNationController = TextEditingController(text: 'أمريكي');
  final opponentLawyerNameController = TextEditingController(text: 'جين سميث');
  final opponentLawyerPhoneController = TextEditingController(
    text: '0987654321',
  );
  final judgeNameController = TextEditingController(text: 'القاضي وليامز');
  final attorneyNumberController = TextEditingController(text: 'ATT456');
  final contractPriceController = TextEditingController(text: '5000.50');
  final notesController = TextEditingController(text: 'هذه قضية نموذجية');

  @override
  void dispose() {
    // Dispose controllers when the widget is disposed
    clientNameController.dispose();
    caseNumberController.dispose();
    caseDateController.dispose();
    caseTitleController.dispose();
    caseTypeController.dispose();
    courtNameController.dispose();
    circleController.dispose();
    opponentNameController.dispose();
    opponentTypeController.dispose();
    opponentPhoneController.dispose();
    opponentAddressController.dispose();
    opponentNationController.dispose();
    opponentLawyerNameController.dispose();
    opponentLawyerPhoneController.dispose();
    judgeNameController.dispose();
    attorneyNumberController.dispose();
    contractPriceController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إضافة قضية جديدة'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'بيانات القضية الجديدة',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            // Client name
            _buildFormFieldWithLabel(
              controller: clientNameController,
              labelText: 'اسم العميل',
            ),
            // Case number
            _buildFormFieldWithLabel(
              controller: caseNumberController,
              labelText: 'رقم القضية',
            ),
            // Case date
            _buildFormFieldWithLabel(
              controller: caseDateController,
              labelText: 'تاريخ التسجيل',
            ),
            // Case title
            _buildFormFieldWithLabel(
              controller: caseTitleController,
              labelText: 'عنوان القضية',
            ),
            // Case type
            _buildFormFieldWithLabel(
              controller: caseTypeController,
              labelText: 'فئة القضية',
            ),
            // Court name
            _buildFormFieldWithLabel(
              controller: courtNameController,
              labelText: 'اسم المحكمة',
            ),
            // Circle
            _buildFormFieldWithLabel(
              controller: circleController,
              labelText: 'الدائرة',
            ),
            // Opponent name
            _buildFormFieldWithLabel(
              controller: opponentNameController,
              labelText: 'اسم الخصم',
            ),
            // Opponent type
            _buildFormFieldWithLabel(
              controller: opponentTypeController,
              labelText: 'نوع الخصم',
            ),
            // Opponent nation
            _buildFormFieldWithLabel(
              controller: opponentNationController,
              labelText: 'جنسية الخصم',
            ),
            // Opponent phone
            _buildFormFieldWithLabel(
              controller: opponentPhoneController,
              labelText: 'هاتف الخصم',
            ),
            // Opponent address
            _buildFormFieldWithLabel(
              controller: opponentAddressController,
              labelText: 'عنوان الخصم',
            ),
            // Opponent lawyer name
            _buildFormFieldWithLabel(
              controller: opponentLawyerNameController,
              labelText: 'محامي الخصم',
            ),
            // Opponent lawyer phone
            _buildFormFieldWithLabel(
              controller: opponentLawyerPhoneController,
              labelText: 'هاتف محامي الخصم',
            ),
            // Judge name
            _buildFormFieldWithLabel(
              controller: judgeNameController,
              labelText: 'اسم القاضي',
            ),
            // Attorney number
            _buildFormFieldWithLabel(
              controller: attorneyNumberController,
              labelText: 'رقم المحامي',
            ),
            // Contract price
            _buildFormFieldWithLabel(
              controller: contractPriceController,
              labelText: 'سعر العقد',
            ),
            // Notes (multiline)
            _buildFormFieldWithLabel(
              controller: notesController,
              labelText: 'الملاحظات',
              maxLines: 4,
              hintText: 'اكتب ملاحظاتك هنا...',
            ),
            // Submit button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: BlocBuilder<IssuesBloc, IssuesState>(
                builder: (context, state) {
                  if (state is IssuesAddLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is IssuesAddSuccess) {
                    return const Center(child: Text('تم إضافة القضية بنجاح'));
                  } else if (state is IssuesAddFailure) {
                    return Center(child: Text(state.message));
                  }
                  return ElevatedButton(
                    onPressed: () {
                      context.read<IssuesBloc>().add(
                        AddNewIssueEvent(
                          caseNumber: caseNumberController.text,
                          caseTitle: caseTitleController.text,
                          caseType: caseTypeController.text,
                          courtName: courtNameController.text,
                          circle: circleController.text,
                          opponentName: opponentNameController.text,
                          opponentType: opponentTypeController.text,
                          opponentPhone: opponentPhoneController.text,
                          opponentAddress: opponentAddressController.text,
                          opponentNation: opponentNationController.text,
                          opponentLawyerName: opponentLawyerNameController.text,
                          opponentLawyerPhone:
                              opponentLawyerPhoneController.text,
                          judgeName: judgeNameController.text,
                          attorneyNumber: attorneyNumberController.text,
                          contractPrice: contractPriceController.text,
                          notes: notesController.text,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFAA7A24),
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'إضافة القضية',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildFormFieldWithLabel({
  required TextEditingController controller,
  required String labelText,
  String? hintText,
  int maxLines = 1,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: CustomTextFormField(
            controller: controller,
            labelText: labelText,
            hintText: hintText,
            maxLines: maxLines,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.only(top: maxLines > 1 ? 12.0 : 0),
            child: Text(
              labelText,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.end,
            ),
          ),
        ),
      ],
    ),
  );
}
