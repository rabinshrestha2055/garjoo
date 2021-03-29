import 'package:flutter/foundation.dart';
import 'package:garjoo/models/view_arrival_model.dart';

class ViewArrivalProvider extends ChangeNotifier{
static List<ViewArrivalModel> viewarrivalList=[
  ViewArrivalModel(details: "heloo", image: "fas1.jpeg", price: "Rs 200",rating:'5'),
 ViewArrivalModel(details: "heloo", image: "fas2.jpeg", price: "Rs 200",rating:'5'),
  ViewArrivalModel(details: "heloo", image: "fas3.jpeg", price: "Rs 200",rating:'5'),
  ViewArrivalModel(details: "heloo", image: "fas4.jpeg", price: "Rs 200",rating:'5'),
 ViewArrivalModel(details: "heloo", image: "fas5.jpeg", price: "Rs 200",rating:'5'),
];
List<ViewArrivalModel> get getview => [...viewarrivalList];
}