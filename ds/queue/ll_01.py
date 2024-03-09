
class LinkedList:
    def __init__(self):
        self.head = None

    def __iter__(self):
        node = self.head
        while node is not None:
            yield node
            node = node.next

    # don't touch below this line

    def __repr__(self):
        nodes = []
        current = self.head
        while current and hasattr(current, "val"):
            nodes.append(current.val)
            current = current.next
        return " -> ".join(nodes)

    def add_to_tail(self, node):
        # Simple for now, will get updated
        self.head = node


class Node:
    def __init__(self, val):
        self.val = val
        self.next = None

    def set_next(self, node):
        self.next = node

    def __repr__(self):
        return self.val


run_cases = [
    ("Bow", ["Sword", "Bow"]),
    ("Axe", ["Sword", "Bow", "Axe"]),
    ("Staff", ["Sword", "Bow", "Axe", "Staff"]),
]

submit_cases = run_cases + [
    ("Spear", ["Sword", "Bow", "Axe", "Staff", "Spear"]),
    ("Dagger", ["Sword", "Bow", "Axe", "Staff", "Spear", "Dagger"]),
]


def test(linked_list, input, expected_state):
    print("---------------------------------")
    print(f"Linked List: {linked_list}")
    print(f"Set Next: {input}")
    print(f"Expecting: {expected_state}")
    node = Node(input)
    last_node = get_last_node(linked_list)
    last_node.set_next(node)
    try:
        result = linked_list_to_list(linked_list)
    except Exception as e:
        result = f"Error: {e}"
    print(f"Actual: {result}")
    if result == expected_state:
        print("Pass")
        return True
    print("Fail")
    return False


def linked_list_to_list(linked_list):
    result = []
    for node in linked_list:
        result.append(node.val)

    return result


def get_last_node(linked_list):
    current = linked_list.head
    while hasattr(current, "next") and current.next:
        current = current.next
    return current


def main():
    passed = 0
    failed = 0
    linked_list = LinkedList()
    linked_list.add_to_tail(Node("Sword"))
    for test_case in test_cases:
        correct = test(linked_list, *test_case)
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

