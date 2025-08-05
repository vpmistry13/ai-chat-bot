import { useState, useRef, useEffect } from 'react';
import axios from 'axios';
import {
  Box,
  TextField,
  IconButton,
  Paper,
  Typography,
  Fade,
  Button,
  Avatar
} from '@mui/material';
import SendIcon from '@mui/icons-material/Send';
import ChatIcon from '@mui/icons-material/Chat';

export default function Chatbot() {
  const [messages, setMessages] = useState([
    { sender: 'bot', text: 'Hello! Welcome to our site. How can I help you today?' },
  ]);
  const [input, setInput] = useState('');
  const [open, setOpen] = useState(false);
  const messagesEndRef = useRef(null);

  const scrollToBottom = () => {
    messagesEndRef.current?.scrollIntoView({ behavior: 'smooth' });
  };

  useEffect(() => {
    scrollToBottom();
  }, [messages]);

  const handleSend = async () => {
    if (!input.trim()) return;

    const userMessage = { sender: 'user', text: input };
    setMessages((prev) => [...prev, userMessage]);
    setInput('');

    try {
      const res = await axios.post('http://localhost:8000/chat/messages', {
        sender: 'user',
        message: input,
      });
      const botMessage = { sender: 'bot', text: res.data.message };
      setMessages((prev) => [...prev, botMessage]);
    } catch (error) {
      console.error('API Error:', error);
      setMessages((prev) => [
        ...prev,
        { sender: 'bot', text: 'Error: Unable to connect to server.' },
      ]);
    }
  };

  const toggleChat = () => setOpen(!open);

  return (
    <Box position="fixed" bottom={20} right={20} zIndex={1000}>
      {!open ? (
        <IconButton color="primary" onClick={toggleChat}>
          <ChatIcon fontSize="large" />
        </IconButton>
      ) : (
        <Fade in={open}>
          <Paper
            elevation={5}
            sx={{
              width: 360,
              height: 500,
              display: 'flex',
              flexDirection: 'column',
              borderRadius: 2,
              p: 2,
              bgcolor: '#fafafa'
            }}
          >
            <Typography variant="h6" sx={{ mb: 1, fontWeight: 600 }}>
              🤖 Chat Assistant
            </Typography>

            <Box
              sx={{
                flexGrow: 1,
                overflowY: 'auto',
                px: 1,
                py: 1,
                mb: 1,
                bgcolor: '#f4f4f4',
                borderRadius: 2
              }}
            >
              {messages.map((msg, i) => (
                <Box
                  key={i}
                  display="flex"
                  justifyContent={msg.sender === 'user' ? 'flex-end' : 'flex-start'}
                  mb={1}
                >
                  {msg.sender === 'bot' && (
                    <Avatar
                      sx={{ width: 24, height: 24, fontSize: 12, mr: 1, bgcolor: '#1976d2' }}
                    >
                      B
                    </Avatar>
                  )}
                  <Box
                    sx={{
                      bgcolor: msg.sender === 'user' ? '#1976d2' : '#e0e0e0',
                      color: msg.sender === 'user' ? '#fff' : '#000',
                      px: 1.5,
                      py: 1,
                      borderRadius: 2,
                      maxWidth: '70%',
                      wordWrap: 'break-word',
                    }}
                  >
                    <Typography variant="body2">{msg.text}</Typography>
                    <Typography
                      variant="caption"
                      sx={{ display: 'block', mt: 0.3, textAlign: msg.sender === 'user' ? 'right' : 'left' }}
                    >
                      {msg.sender === 'user' ? 'You' : 'Bot'}
                    </Typography>
                  </Box>
                </Box>
              ))}
              <div ref={messagesEndRef} />
            </Box>

            <Box sx={{ display: 'flex', gap: 1 }}>
              <TextField
                variant="outlined"
                size="small"
                fullWidth
                value={input}
                onChange={(e) => setInput(e.target.value)}
                onKeyDown={(e) => e.key === 'Enter' && handleSend()}
                placeholder="Type a message..."
              />
              <IconButton color="primary" onClick={handleSend}>
                <SendIcon />
              </IconButton>
            </Box>

            <Button size="small" onClick={toggleChat} sx={{ mt: 1, color: '#1976d2' }}>
              Close
            </Button>
          </Paper>
        </Fade>
      )}
    </Box>
  );
}
