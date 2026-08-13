
import 'package:flutter/material.dart';
import 'package:flutter_application_12/constants/app_colors.dart';
import 'package:flutter_application_12/controller/digimon_controller.dart';
import 'package:flutter_application_12/widgets/digimon_card.dart';
import 'package:flutter_application_12/widgets/pagination_widget.dart';
import 'package:flutter_application_12/widgets/search_bar_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DigimonScreen extends StatefulWidget {
  const DigimonScreen({super.key});

  @override
  State<DigimonScreen> createState() => _DigimonScreenState();
}

class _DigimonScreenState extends State<DigimonScreen> {
  @override 
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      context.read<DigimonController>().fetchDigimons();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('DIGIMON',
        style: GoogleFonts.bubblegumSans(
          fontSize: 65,
          color: AppColors.primaryTitle,
          letterSpacing: 2,
          fontWeight: FontWeight.bold
        ),
          
        ),
        centerTitle: true,
        elevation: 0,

      ),
      body: Consumer<DigimonController>(
        builder: (context,controller,child){
          if(controller.isLoading){
            return const Center(
              child: CircularProgressIndicator(color:Colors.white),
            );
          }
          if(controller.errorMessage !=null){
            return Center(
              child:Text(
                controller.errorMessage!,
                style:const TextStyle(color:Colors.white)
              ),
            );
          }
          return SingleChildScrollView(
         physics: const BouncingScrollPhysics(),
         child: Column(
          children: [
            SearchBarWidget(),

            if(controller.currentPageItems.isEmpty)
            const Padding(
              padding: EdgeInsets.all(40),
              child: Text(
                'No Digimons found.',
                style: TextStyle(color:Colors.white,fontSize: 18),
              ),
            )
            else
            ...List.generate(
              controller.currentPageItems.length,
               (index){
                final digimon=controller.currentPageItems[index];
                final isSelected=controller.selectedIndex==index;

                return DigimonCard(
                  digimon: digimon,
                  shadowColor: isSelected
                  ?AppColors.redGlow
                  :AppColors.defaultGlow,
                  onTap: (){
                    controller.selectedIndex=index;
                    controller.notifyListeners();
                  },
                  );
               },
               ),
               const PaginationWidget(),
                const SizedBox(height: 20),
          ],
         ),
          );
        }
        ),
    );
  }
}