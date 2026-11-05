price = int(input("Цена обеда: "))
count = int(input("Сколько обедов: "))
paid = int(input("Сколько дали: "))
total = price * count
print("К оплате:", total)
print("Сдача:", paid - total)