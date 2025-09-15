from typing import List
from dotenv import load_dotenv
import os
import random
import string

from fastapi import FastAPI, HTTPException
from pymongo import MongoClient, ASCENDING
from pydantic import BaseModel
from datetime import datetime, timezone


def random_key() -> str:
    return ''.join(random.choices(string.ascii_lowercase + string.digits, k=5))


app = FastAPI()

load_dotenv()

client = MongoClient(os.getenv("MONGO_URI"))
db = client[os.getenv("DB_CLIENT")]
collection = db[os.getenv("DB_COLLECTION")]


collection.create_index(
    [("last_updated", ASCENDING)],
    expireAfterSeconds=10 * 24 * 60 * 60  # 10 days
)

class CreateTrip(BaseModel):
    trip_name: str
    members: List[str]
    expenses: List[str]


class Trip(CreateTrip):
    trip_key: str
    last_updated: datetime


@app.post("/trips")
async def create_trip(trip: CreateTrip):
    if len(trip.members) != len(trip.expenses):
        raise HTTPException(status_code=400, detail="Expenses and members don't have the same length")

    key = random_key()
    while collection.find_one({"trip_key": key}) is not None:
        key = random_key()

    now = datetime.now(timezone.utc)

    trip_with_key = Trip(**trip.model_dump(), trip_key=key, last_updated=now)
    result = collection.insert_one(trip_with_key.model_dump())

    return {
        "trip_id": str(result.inserted_id),
        "trip_key": trip_with_key.trip_key,
        "trip_name": trip_with_key.trip_name,
        "members": trip_with_key.members,
        "last_updated": now,
    }
