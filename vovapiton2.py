#задание 1
class Battery:
    def __init__(self, max_charge=5):
        self.capacity = []
        self.max_charge = max_charge

    def charge(self):
        if len(self.capacity) < self.max_charge:
            self.capacity.append(")")
        else:
            print("Battery is already fully charged.")

    def discharge(self):
        if len(self.capacity) > 0:
            self.capacity.pop()
        else:
            print("Battery is already empty.")

    def __str__(self):
        return "[" + "".join(self.capacity) + "]"


b = Battery()
print(b)

b.charge()
b.charge()
print(b)

b.discharge()
print(b)

b.charge()
b.charge()
b.charge()
b.charge()
b.charge()
print(b)

b.discharge()
b.discharge()
b.discharge()
b.discharge()
b.discharge()
b.discharge()
print(b)

#задание 2
class Queue:
    def __init__(self):
        self.inside = []

    def add(self, name):
        self.inside.append(name)

    def take_out(self):
        if len(self.inside) > 0:
            self.inside.pop(0)

    def __str__(self):
        return "=>".join(self.inside)

    def __add__(self, name):
        self.add(name)
        return self

    def __sub__(self, name):
        self.take_out()
        return self

    def __iadd__(self, name):
        self.add(name)
        return self

    def __isub__(self, name):
        self.take_out()
        return self


q = Queue()
print(q)

q.add("Дарья")
q.add("Виктор")
q.add("Иван")
print(q)

q.take_out()
print(q)

q += "Олег"
print(q)

q -= "Виктор"
print(q)

#задание 3
class Matrix:
    def __init__(self, data):
        self.data = data

    def __str__(self):
        return "\n".join(["\t".join([str(col) for col in row]) for row in self.data])

    def __add__(self, other):
        if len(self.data) != len(other.data) or len(self.data[0]) != len(other.data[0]):
            raise ValueError("Matrices must have the same dimensions to be added")
        result = []
        for i in range(len(self.data)):
            row = []
            for j in range(len(self.data[0])):
                row.append(self.data[i][j] + other.data[i][j])
            result.append(row)
        return Matrix(result)

m1 = Matrix([[1, 2], [3, 4]])
m2 = Matrix([[5, 6], [7, 8]])
print(m1)
print(m2)

m3 = m1 + m2
print(m3)