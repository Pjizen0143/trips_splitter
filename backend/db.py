import os
from dotenv import load_dotenv
from pymongo import MongoClient, ASCENDING

load_dotenv()

client = MongoClient(os.getenv("MONGO_URI"))
db = client[os.getenv("DB_CLIENT")]
collection = db[os.getenv("DB_COLLECTION")]


collection.create_index(
    [("last_updated", ASCENDING)],
    expireAfterSeconds=10 * 24 * 60 * 60  # 10 days
)
