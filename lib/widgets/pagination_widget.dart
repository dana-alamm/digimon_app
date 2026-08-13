import 'package:flutter/material.dart';
import 'package:flutter_application_12/constants/app_colors.dart';
import 'package:flutter_application_12/controller/digimon_controller.dart';
import 'package:provider/provider.dart';

class PaginationWidget extends StatelessWidget {
  const PaginationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DigimonController>(
      builder: (context, controller, child) {
        if (controller.totalPages == 0) return const SizedBox.shrink();

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Container(
            decoration: BoxDecoration(
              color:  AppColors.cardBackground,
              borderRadius: BorderRadius.circular(10), 
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: IntrinsicHeight(
              child: Row(
                mainAxisSize: MainAxisSize.min, 
                children: [
                 
                  IconButton(
                    onPressed: controller.currentPage > 1
                        ? () => controller.previousPage()
                        : null,
                    icon: const Icon(Icons.arrow_back, size: 20),
                  ),

                 
                  VerticalDivider(width: 1, color: Colors.grey.shade300),

                
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      '${controller.currentPage}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),

                  
                  VerticalDivider(width: 1, color: Colors.grey.shade300),

                 
                  IconButton(
                    onPressed: controller.currentPage < controller.totalPages
                        ? () => controller.nextPage()
                        : null,
                    icon: const Icon(Icons.arrow_forward, size: 20),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}