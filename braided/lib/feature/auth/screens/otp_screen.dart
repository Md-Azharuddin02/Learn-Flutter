import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../../../shared/custom_button.dart';
import '../../../shared/custom_text_field.dart';
import '../../../core/utils/constants.dart';

class OtpScreen extends StatelessWidget {
  final AuthController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify OTP')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppStrings.enterOtp,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'We sent a code to ${controller.phoneController.text}',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            CustomTextField(
              controller: controller.otpController,
              label: 'Enter 6-digit code',
              keyboardType: TextInputType.number,
              maxLength: 6,
              validator: (value) => controller.validateOTP(value),
            ),
            const SizedBox(height: 24),
            Obx(
              () => CustomButton(
                text: AppStrings.verify,
                isLoading: controller.isLoading.value,
                onPressed: controller.verifyOTP,
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: controller.resendOTP,
              child: const Text(AppStrings.resendOtp),
            ),
          ],
        ),
      ),
    );
  }
}
