/* This code is for postgres database*/

create database tars;

\c tars;
create table Houses (
  HouseId serial primary key,
  HouseName char
);

create table Rooms (
  RoomId serial primary key,
  RoomName char
);

create table Controllers (
  ControllerId serial primary key,
  ControllerName char
);

create table ControllerGpioPins (
  ControllerGpioPinId serial primary key,
  ControllerGpioPin int
);

create table Devices (
  DeviceId serial primary key,
  DeviceName char
);

/* Relationship tables */

create table RoomsToHouses (
  RoomsToHousesId serial primary key,
  RoomId int references Rooms(RoomId),
  HouseId int references Houses(HouseId)
);

create table ControllersToRooms (
  ControllersToRoomsId serial primary key,
  ControllerId int references Controllers(ControllerId),
  RoomId int references Rooms(RoomId)
);

create table GpioPinsToControllers (
  GpioPinsToControllersId serial primary key,
  ControllerGpioPinId int references ControllerGpioPins(ControllerGpioPinId),
  ControllerId int references Controllers(ControllerId)
);

create table DevicesToGpioPins (
  DevicesToGpioPinsId serial primary key,
  DeviceID int references Devices(DeviceId),
  ControllerGpioPinId int references ControllerGpioPins(ControllerGpioPinId)
);
