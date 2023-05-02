#Задание 1
class Cat:
    def __init__(self, name, color, age):
        self.name = name
        self.color = color
        self.age = age

    def meow(self):
        print(f"{self.name} мяукнул")

    def purr(self):
        print(f"{self.name} мурлыкает")

    def scratch(self):
        print(f"{self.name} вкусно кушает колбасу")


cat1 = Cat("Мурзик", "рыжий", 2)

print(f"Имя: {cat1.name}")
print(f"Окрас: {cat1.color}")
print(f"Возраст: {cat1.age}")

cat1.meow()
cat1.purr()
cat1.scratch()

#задание 2
class Good:
    def __init__(self, name, price, weight):
        self.name = name
        self.price = price
        self.weight = weight
        self.cost = self.calc()

    def calc(self):
        return self.price * self.weight


apple = Good('apple', 100, 1.5)
pear = Good('pear', 120, 0.8)

print(f"Стоимость {apple.name}: {apple.cost}")
print(f"Стоимость {pear.name}: {pear.cost}")

#задание 3
class Car:
    def __init__(self, color, brand, body, speed, transmission):
        self.color = color
        self.brand = brand
        self.body = body
        self.speed = speed
        self.transmission = transmission
        self.is_running = False

    def start(self):
        self.is_running = True
        print("Машина начала движение")

    def stop(self):
        self.is_running = False
        print("Машина остановилась")

    def turn(self, direction):
        print(f"Машина повернула {direction}")

    def speed_up(self, acceleration):
        self.speed += acceleration
        print(f"Машина ускорилась до {self.speed} км/ч")

    def speed_down(self, deceleration):
        self.speed -= deceleration
        print(f"Машина замедлилась до {self.speed} км/ч")

    def beep(self):
        print("Би-бип!")


car1 = Car('red', 'Toyota', 'sedan', 60, 'автоматическая')
car2 = Car('blue', 'Ford', 'truck', 40, 'механическая')

car1.start()
car1.speed_up(20)
car1.turn('направо')
car1.beep()
car1.stop()

car2.start()
car2.speed_up(10)
car2.turn('налево')
car2.speed_down(20)
car2.beep()
car2.stop()

#задание 4
class Car:
    def __init__(self, color, brand, body, speed, transmission):
        self.color = color
        self.brand = brand
        self.body = body
        self.transmission = transmission
        self.is_running = False

        if self.body == 'truck':
            self.max_speed = 60
        else:
            self.max_speed = 80

        if speed > self.max_speed:
            print(f"Скорость превышена! Разрешенная скорость {self.max_speed} км/ч")
            self.speed = self.max_speed
        else:
            self.speed = speed

    def start(self):
        self.is_running = True
        print("Машина начала движение")

    def stop(self):
        self.is_running = False
        print("Машина остановилась")

    def turn(self, direction):
        print(f"Машина повернула {direction}")

    def speed_up(self, acceleration):
        if self.speed + acceleration > self.max_speed:
            print(f"Скорость превышена! Разрешенная скорость {self.max_speed} км/ч")
            self.speed = self.max_speed
        else:
            self.speed += acceleration
            print(f"Машина ускорилась до {self.speed} км/ч")

    def speed_down(self, deceleration):
        if self.speed - deceleration < 0:
            self.speed = 0
        else:
            self.speed -= deceleration
            print(f"Машина замедлилась до {self.speed} км/ч")

    def beep(self):
        print("Би-бип!")


car1 = Car('red', 'Toyota', 'car', 60, 'автоматическая')
car2 = Car('blue', 'Ford', 'truck', 70, 'механическая')

car1.start()
car1.speed_up(20)
car1.turn('направо')
car1.beep()
car1.speed_up(30)
car1.stop()

car2.start()
car2.speed_up(10)
car2.turn('налево')
car2.speed_down(20)
car2.beep()
car2.speed_down(50)
car2.stop()


#задание 5
import time
class TrafficLight:
    def __init__(self):
        self.__color = 'red'

    def __change_color(self, color, duration):
        self.__color = color
        print(f"Светофор переключился на {color}")
        time.sleep(duration)

    def run(self):
        while True:
            self.__change_color('red', 1)
            self.__change_color('green', 2)
            self.__change_color('yellow', 0.5)


traffic_light = TrafficLight()
traffic_light.run()