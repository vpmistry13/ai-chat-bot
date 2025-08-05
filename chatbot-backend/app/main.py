from fastapi import FastAPI
from app.api.endpoints import chat
from fastapi.middleware.cors import CORSMiddleware
from app.db.base import Base, engine

Base.metadata.create_all(bind=engine)

app = FastAPI()

# CORS configuration
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:5173"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(chat.router, prefix="/chat", tags=["Chat"])
