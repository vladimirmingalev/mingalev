#задание 1
class Person:
    def __init__(self, name, age, surname):
        self._name = name
        self._age = age
        self._surname = surname

    def name(self):
        return self._name

    def age(self):
        return self._age

    def surname(self):
        return self._surname

    def set_age(self, new_age):
        self._age = new_age


person = Person("Ольга", 30, "Петрушкова")
print(person.name())
print(person.age())
print(person.surname())

person.set_age(35)
print(person.age()) # 35
#задание 2
from abc import ABC, abstractmethod

class Cloth(ABC):
    reserved = 0 # количество ткани для производства одежды

    @abstractmethod
    def fabric_required(self):
        pass

class Coat(Cloth):
    def __init__(self, size):
        self.size = size

    @property
    def fabric_required(self):
        return self.size/6.5 + 0.5

class Suit(Cloth):
    def __init__(self, height):
        self.height = height

    @property
    def fabric_required(self):
        return 2*self.height + 0.3

coat1 = Coat(48)
suit1 = Suit(1.8)

print(coat1.fabric_required)
print(suit1.fabric_required)

Cloth.reserved += coat1.fabric_required + suit1.fabric_required
print(Cloth.reserved)

#задание 3
class Box:
    def __init__(self, postcode, name, from_city, target_city):
        self.__postcode = postcode
        self.__name = name
        self.__from_city = from_city
        self.__target_city = target_city

    def get_postcode(self):
        return self.__postcode

    def get_name(self):
        return self.__name

    def get_from_city(self):
        return self.__from_city

    def get_target_city(self):
        return self.__target_city

    def set_target_city(self, new_target_city):
        self.__target_city = new_target_city

box1 = Box("123456", "Максим", "Волгоград", "Астрахань")
print(box1.get_postcode())
print(box1.get_name())
print(box1.get_from_city())
print(box1.get_target_city())

box1.set_target_city("Астрахань")
print(box1.get_target_city())

#задание 4
from task_3_box import Box

class Truck:
    def __init__(self, capacity):
        self.capacity = capacity

    def __str__(self):
        return f"Truck capacity: {len(self.capacity)} boxes"

    def add(self, box):
        self.capacity.append(box)

    def sub(self, box):
        self.capacity.remove(box)


box1 = Box("123456", "John", "New York", "Los Angeles")
box2 = Box("789012", "Jane", "Chicago", "Houston")
box3 = Box("345678", "Bob", "San Francisco", "Seattle")


print(box1.get_postcode())
print(box2.get_name())
box3.set_target_city("Portland")
print(box3.get_target_city())


truck = Truck([box1, box2])
print(truck)

# Добавляем еще одну посылку в грузовик
truck.add(box3)
print(truck)

# Выгружаем первую посылку из грузовика
truck.sub(box1)
print(truck)

