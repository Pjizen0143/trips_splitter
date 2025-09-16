from utils import random_key
from models import CreateTrip, Trip
from db import collection

from datetime import datetime, timezone

def create_trip(trip: CreateTrip):
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
