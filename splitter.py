from typing import List
from models import ResultItem, Result, Response
from fastapi import HTTPException

def more_than_avg(expenses: List[float], avg: float) -> int:
    count = 0
    for i in expenses:
        if i > avg:
            count += 1
    return count

def intermediary(expenses: List[float], avg: float):
    count = 0
    for i in expenses:
        if i > avg:
            return count
        count += 1
    return None

def less_intermediary(expenses: List[float], avg: float):
    count = 0
    for i in expenses:
        if i < avg:
            return count
        count += 1
    return None

def splitter(expenses: List[float], members: List[str]):
    if len(expenses) != len(members):
        raise HTTPException(status_code=400, detail="Expenses and members length don't match")

    avg = sum(expenses) / len(expenses)
    sum_of_more_than = more_than_avg(expenses, avg)


    if sum_of_more_than == 1:
        inter_member = intermediary(expenses, avg)
        for i, expense in enumerate(expenses):
            if expense < avg:
                print(f"{members[i]} -> {members[inter_member]}: {avg - expense}")

    elif sum_of_more_than > 1:
        sum_of_less_than = len(members) - sum_of_more_than
        if sum_of_less_than == 1:
            inter_member = less_intermediary(expenses, avg)
            for i, expense in enumerate(expenses):
                if expense > avg:
                    print(f"{members[inter_member]} -> {members[i]}: {expense - avg}")

        elif sum_of_less_than > 1:
            inter_member = 0
            for i, expense in enumerate(expenses[1:], 1):
                if expense < avg:
                    print(f"{members[i]} -> {members[inter_member]}: {avg - expense}")
            for i, expense in enumerate(expenses[1:], 1):
                if expense > avg:
                    print(f"{members[inter_member]} -> {members[i]}: {expense - avg}")

if __name__ == "__main__":
    input_members = ["Phone", "milk", "chopoo", "bomb"]
    input_expenses = [0, 500, 500, 0]
    splitter(input_expenses, input_members)