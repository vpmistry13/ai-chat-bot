from sqlalchemy.orm import Session
from app.models.message import Message
from app.schemas.message import MessageCreate

def create_message(db: Session, msg: MessageCreate):
    db_message = Message(sender=msg.sender, message=msg.message)
    db.add(db_message)
    db.commit()
    db.refresh(db_message)
    return db_message

def get_all_messages(db: Session):
    return db.query(Message).all()

def get_best_reply(db: Session, user_message: str):
    from app.models.training import TrainingData

    # Simple match: check if user_message is contained in any training question
    records = db.query(TrainingData).all()

    for record in records:
        if record.question.lower() in user_message.lower():
            return record.answer

    # Fallback
    return "Sorry, I don't understand that yet."
