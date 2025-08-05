```md
# 🤖 AI Chatbot using FastAPI & Scikit-learn

This is a lightweight, intelligent chatbot built using **FastAPI** for the backend and **scikit-learn** for AI model integration. It supports:

- User input and bot replies  
- ML-powered response generation using cosine similarity  
- Name detection and session-based memory  
- SQLite database to store all messages  

---

## 🗂️ Project Structure

```

app/
├── crud/
│   └── message.py         # DB operations
├── db/
│   ├── session.py         # DB session
│   └── models.py          # SQLAlchemy models
├── schemas/
│   └── message.py         # Pydantic schemas
├── api/
│   └── chat.py            # Chat logic & API routes
train\_model.py             # Script to train AI model
vectorizer.pkl             # Saved vectorizer
matrix.pkl                 # Trained question matrix
answers.pkl                # Trained answers list
main.py                    # FastAPI entry point

````

---

## 🚀 Getting Started

### 1. Clone the Repo

```bash
git clone https://github.com/yourusername/ai-chatbot-fastapi.git
cd ai-chatbot-fastapi
````

### 2. Install Requirements

```bash
pip install -r requirements.txt
```

### 3. Train Your Model

Update training questions and answers in `train_model.py`, then run:

```bash
python train_model.py
```

This generates:

* `vectorizer.pkl`
* `matrix.pkl`
* `answers.pkl`

### 4. Run the App

```bash
uvicorn main:app --reload
```

Visit: [http://localhost:8000/docs](http://localhost:8000/docs)

---

## 💬 Chat Functionality

* `POST /chat/messages` – Send user message
* `GET /chat/messages` – Get full message history

The bot can:

* Detect and remember names from messages like *“My name is Vishal”*
* Respond with name if asked: *“Do you know my name?”*
* Reply intelligently using your trained dataset

---

## 🧠 Model Training Logic

Located in `train_model.py`:

* Uses `TfidfVectorizer`
* Compares questions using `cosine_similarity`
* Returns the best match or fallback reply

---

## ✅ Example Interaction

```json
POST /chat/messages

{
  "message": "My name is Vishal",
  "sender": "user123"
}
```

**Bot Reply:**

```
Hi Vishal! Thanks for letting me know your good name.
Yes Vishal, how can I help you?
```

---

## 🧾 Requirements

* Python 3.8+
* FastAPI
* Uvicorn
* SQLAlchemy
* Scikit-learn

---

## 📌 Future Enhancements

* Persist session memory in the database
* Add context-aware multi-turn conversations
* Integrate frontend (React, Vue, etc.)
* Cloud deployment (Railway, Render, AWS, etc.)

---

## 👨‍💻 Author

**Vishal Mistry**
Full-stack Developer | ReactJS | NextJS| AWS Services | PHP Laravel | AI Enthusiast
