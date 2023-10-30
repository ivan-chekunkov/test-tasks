def get_distances(
    count_old_atms: int, count_new_atms: int, lst_distances: list[int]
) -> None:
    temp_lst_distances: list[int, float | int, int] = []
    for index, value in enumerate(lst_distances):
        temp_lst_distances.append([index, value, 1])
    while count_new_atms > 0:
        temp_lst_distances.sort(key=lambda x: x[1], reverse=True)
        index, temp_num, temp_count = temp_lst_distances.pop(0)
        new_num = (temp_num * temp_count) / (temp_count + 1)
        temp_lst_distances.append([index, new_num, temp_count + 1])
        count_new_atms -= 1
    temp_lst_distances.sort(key=lambda x: x[0])
    for elem in temp_lst_distances:
        for _ in range(elem[2]):
            print(f"{float(elem[1]):.1f}")


if __name__ == "__main__":
    n = 5
    k = 3
    L = [100, 30, 20, 80]
    get_distances(n, k, L)
