from models import CreateTrip
import crud

from fastapi import APIRouter, HTTPException

router = APIRouter()

@router.post("/trips")
async def create_trip(trip: CreateTrip):
    if len(trip.members) != len(trip.expenses):
        raise HTTPException(status_code=400, detail="Expenses and members don't have the same length")

    return crud.create_trip(trip)
