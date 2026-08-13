
import 'package:flutter/material.dart';
import 'package:flutter_application_12/constants/app_colors.dart';
import 'package:flutter_application_12/controller/digimon_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final FocusNode _focusNode=FocusNode();
  bool _isFocused=false;
  @override
  void initState(){
    super.initState();

    _focusNode.addListener((){
      setState(() {
        _isFocused=_focusNode.hasFocus;
      });
    });

    
  }
  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final borderColor=_isFocused?AppColors.searchBorderActive:AppColors.searchBorderDefault;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 12.0),
      child: Row(
        children: [
          Expanded(
            child: AnimatedContainer(
              duration: const Duration(microseconds: 200),
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.searchBackground,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: borderColor, width: 2.5),
                boxShadow: [
                  BoxShadow(
                    color:borderColor.withOpacity(0.3),
                    blurRadius: 8,
                    spreadRadius: 1,

                  ),
                ],

              ),
              child: TextField(
                focusNode: _focusNode,
                onChanged: (query){
                  context.read<DigimonController>().searchByName(query);
                },
                style: GoogleFonts.bubblegumSans(
                  color:AppColors.textDark,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  hintText: 'DIGIMON NAME',
                  hintStyle: GoogleFonts.bubblegumSans(
                    color: Colors.grey.shade600,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),

                ),
              ),
              ),
          ),
          const SizedBox(width: 10,),

          AnimatedContainer(
            duration: const Duration(microseconds: 200),
            height: 50,
            width: 60,
            decoration: BoxDecoration(
              color: AppColors.searchBackground,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: borderColor, width: 2.5),
              boxShadow: [
                BoxShadow(
                  color: borderColor.withOpacity(0.3),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ]
            ),
            child: Padding(
              padding:  const EdgeInsets.all(8),
              child: Text(
                '🏸',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            )
        ],
      ),
      );
  }
}