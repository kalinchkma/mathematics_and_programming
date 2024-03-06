class Stack:
    def __init__(self):
        self.items = []

    def push(self, item):
        self.items.append(item)

    def pop(self):
        if len(self.items) == 0:
            return None
        return self.items.pop()

    def peek(self):
        if len(self.items) == 0:
            return None
        return self.items[len(self.items) - 1]


# don't modify above this line


class PotionStack(Stack):
    def push(self, item):
        if self.peek() != item:
            self.items.append(item)

# don't modify below this line
run_cases = [
    ("Mana Potion", ["Mana Potion"]),
    ("Health Potion", ["Mana Potion", "Health Potion"]),
    ("Health Potion", ["Mana Potion", "Health Potion"]),
]

submit_cases = run_cases + [
    ("Health Potion", ["Mana Potion", "Health Potion"]),
    ("Invisibility Potion", ["Mana Potion", "Health Potion", "Invisibility Potion"]),
]


def test(stack, input, expected_output):
    print("---------------------------------")
    print(f"Inputs:")
    print(f" * Potion: {input}")
    print(f"Expecting: {expected_output}")
    stack.push(input)
    result = stack.items
    print(f"Actual: {result}")
    if result == expected_output:
        print("Pass")
        return True
    print("Fail")
    return False


def main():
    stack = PotionStack()
    passed = 0
    failed = 0
    for test_case in test_cases:
        correct = test(stack, *test_case)
        if correct:
            passed += 1
        else:
            failed += 1
    if failed == 0:
        print("============= PASS ==============")
    else:
        print("============= FAIL ==============")
    print(f"{passed} passed, {failed} failed")


test_cases = submit_cases
if "__RUN__" in globals():
    test_cases = run_cases

main()


