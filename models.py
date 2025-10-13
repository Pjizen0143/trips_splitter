from typing import List, Any
from datetime import datetime

from pydantic import BaseModel, Field, ConfigDict

class CreateTrip(BaseModel):
    trip_name: str
    members: List[str]
    expenses: List[float]


class Trip(CreateTrip):
    trip_code: str
    last_updated: datetime


class UpdateTrip(BaseModel):
    trip_name: str | None = None
    members: List[str] | None = None
    expenses: List[float] | None = None
    last_updated: datetime | None = None


class ResultItem(BaseModel):
    from_member: str = Field(..., alias="from")
    to: str
    amount: float

    model_config = ConfigDict(populate_by_name=True)


class Result(BaseModel):
    settlements: List[ResultItem]


class Response(BaseModel):
    status: str
    message: Any
