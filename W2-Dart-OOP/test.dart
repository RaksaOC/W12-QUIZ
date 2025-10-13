enum GENDER {male, female, other}

class Passenger{
  late int id;
  late String firstName;
  late String lastName;
  late int age;
  late String SSN;
  GENDER gender;

  Passenger(this.id, this.firstName, this.lastName, this.age,  this.SSN, this.gender);
}

class Destination{
  late String city;
  late String airport;

  Destination(this.city, this.airport);
}

class Travel{
  late String transportation;
  late String type;

  Travel(this.transportation, this.type);
}

class TravelTicket{
  Passenger passenger;
  Destination destination;
  Travel travel;
  String discountCode;

  TravelTicket(this.passenger, this.destination, this.travel, this.discountCode);

}

main(){
  Passenger passenger = Passenger(1, "raksa", "chan", 20, "1010101", GENDER.female);
  Destination destination = Destination("phnom penh", "takhmao airport");
  Travel travel = Travel("plane", "business");

  TravelTicket travelTicket = TravelTicket(passenger, destination, travel, "ronan is the best");


}