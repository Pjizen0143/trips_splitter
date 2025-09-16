from typing import List
from datetime import datetime

from pydantic import BaseModel

class CreateTrip(BaseModel):
    trip_name: str
    members: List[str]
    expenses: List[str]


class Trip(CreateTrip):
    trip_key: str
    last_updated: datetime

