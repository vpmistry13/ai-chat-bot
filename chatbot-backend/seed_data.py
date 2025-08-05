from app.db.base import SessionLocal
from app.models.message import Message

db = SessionLocal()

sample_data = [
    {"sender": "user", "message": "Hi"},
    {"sender": "bot", "message": "Hello!"},
    {"sender": "user", "message": "Are you a software freelancer?"},
    {"sender": "bot", "message": "Yes, I specialize in Python and JavaScript projects."}
]

for data in sample_data:
    db.add(Message(**data))

db.commit()
db.close()
