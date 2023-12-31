def print_a_large_number(array: list[str]) -> None:
    def comparator(num_1: str, num_2: str) -> bool:
        return int(num_2 + num_1) < int(num_1 + num_2)

    for index_item_to_insert in range(1, len(array)):
        item_to_insert = array[index_item_to_insert]
        temp_index = index_item_to_insert
        while temp_index > 0 and comparator(
            item_to_insert, array[temp_index - 1]
        ):
            array[temp_index] = array[temp_index - 1]
            temp_index -= 1
        array[temp_index] = item_to_insert
    print("".join(array))


if __name__ == "__main__":
    array = ["41", "4", "005", "89"]
    print_a_large_number(array)
