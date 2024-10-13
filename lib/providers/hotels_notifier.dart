import 'package:flutter/material.dart';
import 'package:ticket_booking_app/layout/widgets/hotels/BottomSheetViews/first_page.dart';
import 'package:ticket_booking_app/layout/widgets/hotels/BottomSheetViews/second_page.dart';
import 'package:ticket_booking_app/layout/widgets/hotels/BottomSheetViews/select_room_page.dart';
import 'package:ticket_booking_app/models/Booking/room_booking_model.dart';
import 'package:ticket_booking_app/models/Booking/room_booking_response.dart';
import 'package:ticket_booking_app/utils/helpers/dataService.dart';
import 'package:ticket_booking_app/utils/hero_static/end_points.dart';
import 'package:ticket_booking_app/utils/remote/dio_helper.dart';

class HotelsNotifier extends ChangeNotifier{
  DioHelper helper = DioHelper();

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();


  List<String> titles = const ["Select Start Date", "Select End Date", "Select Room"];
  List<Widget> screens = const [FirstPage(), SecondPage(), SelectRoomPage()];

  String _hotelId = '';

  String get hotelId => _hotelId;

  set hotelId(String id) {
    _hotelId = id;
    notifyListeners();
  }

  String _selectedRoom = '';

  String get selectedRoom => _selectedRoom;

  set selectedRoom(String room) {
    _selectedRoom = room;
    notifyListeners();
  }
  void setStartDate(DateTime date) {
    startDate = date;
    notifyListeners();
  }
  void setEndDate(DateTime date) {
    endDate = date;
    notifyListeners();
  }
  final PageController pageController = PageController();

  String _paymentGateway = '';
  int _currentPage = 0;

  String get paymentGateway => _paymentGateway;

  set paymentGateway(String newGateway){
    _paymentGateway = newGateway;
    notifyListeners();
  }

  int get currentPage => _currentPage;

  set currentPage(int page){
    _currentPage = page;
    notifyListeners();
  }

  void changeCurrentPage(int page){
    _currentPage = page;
    notifyListeners();
  }
  void incrementPage(){
    _currentPage++;
    notifyListeners();
  }

  void nextPage() {
    if (currentPage < screens.length - 1) {
      _currentPage++;
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    }
    notifyListeners();
  }

  List<dynamic> hotels = [];
  List<dynamic> bookingData = [];
  // Map<String, dynamic> data = {};

  Future<List<dynamic>> getHotelsData() async {
    String? token = DataService.sharedPreferences.getString('userToken');

    hotels = await helper.authGetData(
        endPoint: AppEndPoints.getAllHotels,
        token: token!);
    return hotels;
  }

  Future<dynamic> getHotelsDataById(String id) async {
    String? token = DataService.sharedPreferences.getString('userToken');
    final hotels = await helper.authGetData(
        endPoint: '${AppEndPoints.getHotelById}/$id',
        token: token!
    );
    return hotels;
  }


  Future<BookingRoomResponseModel> userBookARoom(RoomBookingModel roomBookingModel) async {
    var bookingData = await helper.postData(AppEndPoints.bookHotelRoom,
        body: roomBookingModel.toJson(),
        token: DataService.sharedPreferences.getString('userToken')!
    );
    BookingRoomResponseModel booking = BookingRoomResponseModel.fromJson(bookingData);
    return booking;
  }

  @override
  void dispose() {
    super.dispose();
    currentPage = 0;
    pageController.dispose();
    selectedRoom = '';
    startDate = DateTime.now();
    endDate = DateTime.now();
  }

}