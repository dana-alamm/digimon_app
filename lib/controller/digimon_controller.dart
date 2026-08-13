import 'package:flutter/material.dart';
import 'package:flutter_application_12/api/api_service.dart';
import 'package:flutter_application_12/model/digimon_model.dart';

class DigimonController extends ChangeNotifier {
  final ApiService _apiService=ApiService();

  List<DigimonModel>_allDigimons=[];
  List<DigimonModel> _filteredDigimons=[];

  bool isLoading=false;
  String? errorMessage;

  int currentPage=1;
  final int  itemsPerPage=4;
   
  int? selectedIndex;
  List<DigimonModel> get allDigimons=>_allDigimons;

  List<DigimonModel> get currentPageItems{
    final startIndex=(currentPage-1)*itemsPerPage;
    final endIndex=startIndex+itemsPerPage;

    if(startIndex>=_filteredDigimons.length)return[];
    return _filteredDigimons.sublist(
      startIndex,
      endIndex>_filteredDigimons.length?_filteredDigimons.length:endIndex,
    );
  }
  int get totalPages =>(_filteredDigimons.length/itemsPerPage).ceil();

  Future<void>fetchDigimons()async{
    isLoading=true;
    errorMessage=null;
    notifyListeners();

    try {
      _allDigimons=await _apiService.getDigimons();
      _filteredDigimons=_allDigimons;
    } catch (e) {
      errorMessage="Failed to load Digimons. Please check your connection.";
    }finally{
      isLoading=false;
      notifyListeners();
    }

  }
  void searchByName(String query){
    if(query.isEmpty){
      _filteredDigimons=_allDigimons;
    }else{
      _filteredDigimons=_allDigimons
      .where((digimon)=>
      digimon.name.toLowerCase().contains(query.toLowerCase()))
      .toList();

    }
    currentPage=1;
    selectedIndex=null;
    notifyListeners();
  }
  void nextPage(){
    if(currentPage<totalPages){
      currentPage++;
      selectedIndex=null;
      notifyListeners();
    }
  }
  void previousPage(){
    if(currentPage>1){
      currentPage--;
      selectedIndex=null;
      notifyListeners();
    }
  }
  void selectCard(int index){
  if(selectedIndex==index){
    selectedIndex=null;
  }else{
    selectedIndex=index;
  }
  notifyListeners();
  }
}