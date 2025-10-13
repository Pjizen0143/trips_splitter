from typing import List
from models import ResultItem, Result, Response

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
        return Response(status="Error", message="Expenses do not have the same amount of members")

    avg = sum(expenses) / len(expenses)
    sum_of_more_than = more_than_avg(expenses, avg)

    _Result = []

    if sum_of_more_than == 1:
        inter_member = intermediary(expenses, avg)
        for i, expense in enumerate(expenses): # enumerate is return index and item in list
            if expense < avg:
                _resultItem = ResultItem(
                    from_member=str(members[i]),
                    to=str(members[inter_member]),
                    amount=avg - expense
                )
                _Result.append(_resultItem)

    elif sum_of_more_than > 1:
        sum_of_less_than = len(members) - sum_of_more_than
        if sum_of_less_than == 1:
            inter_member = less_intermediary(expenses, avg)
            for i, expense in enumerate(expenses):
                if expense > avg:
                    _resultItem = ResultItem(
                        from_member=str(members[inter_member]),
                        to=str(members[i]),
                        amount=expense - avg
                    )
                    _Result.append(_resultItem)

        elif sum_of_less_than > 1:
            inter_member = 0
            for i, expense in enumerate(expenses[1:], 1):
                if expense < avg:
                    if expense > avg:
                        _resultItem = ResultItem(
                            from_member=str(members[i]),
                            to=str(members[inter_member]),
                            amount=avg - expense
                        )
                        _Result.append(_resultItem)
            for i, expense in enumerate(expenses[1:], 1):
                if expense > avg:
                    if expense > avg:
                        _resultItem = ResultItem(
                            from_member=str(members[inter_member]),
                            to=str(members[i]),
                            amount=expense - avg
                        )
                        _Result.append(_resultItem)
    return Response(status="Complete", message=Result(settlements=_Result))
