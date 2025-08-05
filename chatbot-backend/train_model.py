# train_model.py

import pickle
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity
from sqlalchemy.orm import Session
from app.db.session import get_db
from app.models.training import TrainingData

def train_and_save():
    db: Session = next(get_db())

    # Load training data
    records = db.query(TrainingData).all()
    questions = [r.question for r in records]
    answers = [r.answer for r in records]

    # Vectorize questions
    vectorizer = TfidfVectorizer()
    vectors = vectorizer.fit_transform(questions)

    # Save files
    with open("vectorizer.pkl", "wb") as f:
        pickle.dump(vectorizer, f)
    with open("matrix.pkl", "wb") as f:
        pickle.dump(vectors, f)
    with open("answers.pkl", "wb") as f:
        pickle.dump(answers, f)

    print(f"✅ Model trained on {len(questions)} records and saved!")

if __name__ == "__main__":
    train_and_save()
