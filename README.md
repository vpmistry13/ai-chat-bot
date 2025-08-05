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

chatbot-backend/
├── app/
│ ├── api/endpoints/
│ │ └── chat.py # Main chatbot API logic
│ ├── core/ # (Optional for future configs)
│ ├── crud/
│ │ └── message.py # DB CRUD operations
│ ├── db/
│ │ ├── base.py # Base model import/export
│ │ ├── session.py # DB session creation
│ │ └── message.py # SQLAlchemy message model
│ │ └── training.py # Session memory model
│ ├── schemas/
│ │ └── message.py # Pydantic schemas for validation
│ └── services/ # (Optional business logic layer)
│
├── main.py # FastAPI app entry point
├── train_model.py # ML model trainer script
├── seed_data.py # Optional: Seed training data
├── answers.pkl # Pickled list of answers
├── matrix.pkl # TF-IDF transformed matrix
├── vectorizer.pkl # TF-IDF vectorizer
├── README.md
├── requirements.txt
├── public/ # (Static files directory)
├── venv/ # Python virtual environment

````

---

## 🚀 Getting Started

### 1. Clone the Repo

```bash
git clone https://github.com/vpmistry13/ai-chat-bot.git
cd ai-chat-bot
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

Thanks! Since your FastAPI app is structured inside the `app` folder and the main entry file is `main.py` (located at the root), you're right to run it like this:

```bash
uvicorn app.main:app --host 0.0.0.0 --port 8000
```

I'll update the **README.md** section accordingly.

---

### ✅ Updated "Run the Backend Server" Section for `README.md`

````md
## ✅ Run the Backend Server

To start your FastAPI chatbot backend, use the following command:

```bash
uvicorn app.main:app --host 0.0.0.0 --port 8000
````

Once the server is running, open your browser and visit:

```
http://localhost:8000/docs
```

This will open the interactive Swagger UI where you can test your chatbot endpoints.


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
Full-stack Developer | ReactJS | NextJS| AWS Services | PHP Laravel | AI Integrator
