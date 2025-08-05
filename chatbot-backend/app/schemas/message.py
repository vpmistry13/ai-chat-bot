from pydantic import BaseModel

class MessageBase(BaseModel):
    sender: str
    message: str

class MessageCreate(MessageBase):
    pass

class MessageOut(MessageBase):
    id: int

    model_config = {
        "from_attributes": True
    }
