import re


def convert_number(text: str) -> None:
    matchs = re.findall(r"\b\d{2,4}\\\d{2,5}\b", text)
    for match in matchs:
        one_number, two_number = match.split("\\")
        one_number = (4 - len(one_number)) * "0" + one_number
        two_number = (5 - len(two_number)) * "0" + two_number
        print("\\".join((one_number, two_number)))


if __name__ == "__main__":
    text = (
        "Адрес 5467\\456. Номер \n405\\549\n"
        "Тест неверного номера 34567\\453 и 1234\\2"
    )
    convert_number(text)
