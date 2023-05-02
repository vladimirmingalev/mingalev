#задание 1
from abc import ABC, abstractmethod


class Animal(ABC):
    def __init__(self, color, name, age):
        self.color = color
        self.name = name
        self.age = age

    @abstractmethod
    def say(self):
        pass


class Cat(Animal):
    def say(self):
        print("Meow!")


class Dog(Animal):
    def say(self):
        print("Woof!")


cat = Cat("black", "Luna", 3)
dog = Dog("brown", "Buddy", 5)

print(f"{cat.name} is {cat.color} and says ", end="")
cat.say()

print(f"{dog.name} is {dog.color} and says ", end="")
dog.say()

#задание 2
class Father:
    def __init__(self, name, surname):
        self.name = name
        self.surname = surname

class Child(Father):
    def __init__(self, name, surname, patronim):
        super().__init__(name, surname)
        self.patronim = patronim

child = Child("Иван", "Матвеев", "Петрович")
print(f"{child.name} {child.surname} {child.patronim}")

#задание 3

#А)

from abc import ABC, abstractmethod

class Stationery(ABC):
    title = ""

    @abstractmethod
    def draw(self):
        pass

class Pen(Stationery):
    color = "blue"

    def draw(self):
        print("Ручка пишет")

class Pencil(Stationery):
    def draw(self):
        print("Карандаш рисует")

class Handle(Stationery):
    def draw(self):
        print("Маркер рисует")

pen = Pen()
pencil = Pencil()
handle = Handle()

pen.draw() # Ручка пишет
pencil.draw() # Карандаш рисует
handle.draw() # Маркер рисует

#Б)

class Stationery(ABC):
    title = ""
    color = ""

    @classmethod
    def set_color(cls, color):
        cls.color = color

class Pen(Stationery):
    color = "blue"

    def draw(self):
        print("Ручка пишет")

class Pencil(Stationery):
    def draw(self):
        print("Карандаш рисует")

class Handle(Stationery):
    def draw(self):
        print("Маркер рисует")

Stationery.set_color("yellow")
print(Pen.color) # blue
print(Pencil.color) # yellow
print(Handle.color) # yellow

#задание 4
class User:
    def __init__(self, login, password):
        self.login = login
        self.password = password

    def view(self):
        print("Я - User. Могу просматривать содержимое")

class Moderator(User):
    def __init__(self, login, password, group_id):
        super().__init__(login, password)
        self.group_id = group_id

    def view(self):
        print("Я - Moderator. Могу просматривать содержимое")

    def redact(self):
        print("Я - Moderator. Могу редактировать содержимое")

user = User("user_login", "user_password")
moderator = Moderator("moderator_login", "moderator_password", 1)

#задание 5
import time

class Clock:
    @staticmethod
    def Say_time():
        print(time.strftime("%H:%M:%S"))

Clock.Say_time()