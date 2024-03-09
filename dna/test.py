from Bio import SeqIO

e = "./dog.txt"

with open(e, "r") as file:
    dog = file.read()

print(dog)

