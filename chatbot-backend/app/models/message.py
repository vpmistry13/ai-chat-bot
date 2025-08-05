from sqlalchemy import Column, Integer, String
from app.db.base import Base

class Message(Base):
    __tablename__ = "messages"

    id = Column(Integer, primary_key=True, index=True)
    sender = Column(String(50))
    message = Column(String(255))
