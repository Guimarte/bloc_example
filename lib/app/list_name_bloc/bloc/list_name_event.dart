abstract class ListNameEvent {}

class FindAllNames extends ListNameEvent {}

class AddNameEvent extends ListNameEvent {
  String name = "";
  AddNameEvent({required this.name});
}

class RemoveNameEvent extends ListNameEvent {
  int index;
  RemoveNameEvent({required this.index});
}
