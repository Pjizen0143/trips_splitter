from utils import random_key
from models import CreateTrip, Trip, UpdateTrip, Response
from db import collection

from datetime import datetime, timezone

def create_trip(trip: CreateTrip):
    code = random_key()
    while collection.find_one({"trip_code": code}) is not None:
        code = random_key()

    now = datetime.now(timezone.utc)

    trip_with_key = Trip(**trip.model_dump(), trip_code=code, last_updated=now)
    result = collection.insert_one(trip_with_key.model_dump())

    return {
        "trip_id": str(result.inserted_id),
        "trip_code": trip_with_key.trip_code,
        "trip_name": trip_with_key.trip_name,
        "members": trip_with_key.members,
        "last_updated": now,
    }


def get_trip(trip_code: str):
    trip = collection.find_one({"trip_code": trip_code})
    if trip:
        trip["_id"] = str(trip["_id"])
        # find return Doc ที่มี _id เป็น ObjectId ทำให้แปลงเป็น Json ไม่ได้
        # เลยต้องเปลี่ยน _id เป็น str ก่อน
        return trip
    return None


def delete_trip(trip_code: str):
    result = collection.delete_one({"trip_code": trip_code})
    if result.deleted_count == 1:
        return result
    return None


def update_trip(trip_code: str, trip: UpdateTrip):
    update_data = trip.model_dump()

    for i in list(update_data.keys()): # delete None value out off data
        if update_data[i] is None:
            update_data.pop(i)

    before_update_trip = collection.find_one({"trip_code": trip_code})
    if not before_update_trip:
        return None

    if "members" in update_data:
        new_members = update_data["members"]
    else:
        new_members = before_update_trip["members"]
    if "expenses" in update_data:
        new_expenses = update_data["expenses"]
    else:
        new_expenses = before_update_trip["expenses"]

    if len(new_members) != len(new_expenses):
        return {"error": "members and expenses length don't match"}

    update_data["last_updated"] = datetime.now(timezone.utc)
    result = collection.update_one(
        {"trip_code": trip_code},
        {"$set": update_data},
    )

    return Response(status="complete", message=f"updated {trip_code}: {result}")

