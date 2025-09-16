from models import CreateTrip
import crud

from fastapi import APIRouter, HTTPException

router = APIRouter()

@router.post("/trips")
async def create_trip(trip: CreateTrip):
    if len(trip.members) != len(trip.expenses):
        raise HTTPException(status_code=400, detail="Expenses and members don't have the same length")

    return crud.create_trip(trip)


@router.get("/trips/{trip_key}")
def read_trip(trip_key: str):
    trip = crud.get_trip(trip_key)
    if not trip:
        return {"error": "Trip not found"}
    return trip



@router.delete("/trips/{trip_key}")
async def delete_trip(trip_id: str):
    trip = crud.delete_trip(trip_id)
    if not trip:
        return {"error": "Trip not found"}
    return {"message": "Trip deleted"}
