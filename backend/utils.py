import random
import string

from splitter import splitter
from db import collection
from models import Response

def random_key() -> str:
    return ''.join(random.choices(string.ascii_lowercase + string.digits, k=5))


def calculate(code: str) -> Response | None:
    trip = collection.find_one({"trip_code": code})
    if not trip:
        return None

    trip.pop("_id")
    members = trip["members"]
    expenses = trip["expenses"]
    splits = splitter(members=members, expenses=expenses)
    return splits
