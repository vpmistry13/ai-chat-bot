import pickle
import re
import numpy as np
from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from sklearn.metrics.pairwise import cosine_similarity
from app.schemas.message import MessageCreate, MessageOut
from app.crud.message import create_message, get_all_messages
from app.db.session import get_db

router = APIRouter()

# Load vectorizer and model
with open("vectorizer.pkl", "rb") as f:
    vectorizer = pickle.load(f)
with open("matrix.pkl", "rb") as f:
    matrix = pickle.load(f)
with open("answers.pkl", "rb") as f:
    answers = pickle.load(f)

# In-memory session store to remember names per sender
session_store = {}

@router.post("/messages", response_model=MessageOut)
def post_message(msg: MessageCreate, db: Session = Depends(get_db)):
    user_message = msg.message
    sender = msg.sender
    db_msg = create_message(db, msg)

    # Name detection: "my name is Vishal"
    name_match = re.search(r"\bmy name is (\w+)", user_message, re.IGNORECASE)

    if name_match:
        user_name = name_match.group(1)
        session_store[sender] = user_name  # Store name in session
        reply = f"Hi {user_name}! Thanks for letting me know your good name.\nYes {user_name}, how can I help you?"
    elif re.search(r"\bdo you know my name\b", user_message, re.IGNORECASE):
        user_name = session_store.get(sender)
        if user_name:
            reply = f"Yes {user_name}, of course I remember your name!"
        else:
            reply = "Hmm, I don't know your name yet. You can tell me by saying 'My name is ...'"
    else:
        # Default AI logic
        question_vec = vectorizer.transform([user_message])
        similarities = cosine_similarity(question_vec, matrix)
        best_match = np.argmax(similarities)
        reply = answers[best_match] if similarities[0][best_match] > 0.2 else "I'm sorry, I don't understand."

    return {
        "id": db_msg.id,
        "message": reply,
        "sender": "bot"
    }

@router.get("/messages", response_model=list[MessageOut])
def read_messages(db: Session = Depends(get_db)):
    return get_all_messages(db)
