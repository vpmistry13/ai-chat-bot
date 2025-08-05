import React from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import './App.css'
import Chatbot from './Chatbot'

function App() {
  return (
    <div style={{ fontFamily: 'sans-serif', minHeight: '100vh', display: 'flex', flexDirection: 'column' }}>
      
      {/* Header */}
      <header style={{
        backgroundColor: '#282c34',
        padding: '2rem',
        color: 'white',
        textAlign: 'center'
      }}>
        <h1 style={{ fontSize: '2.5rem', marginBottom: '0.5rem' }}>AI Chatbot 🤖</h1>
        <p style={{ fontSize: '1.2rem' }}>Built with ReactJS + FastAPI (Python)</p>
      </header>

      {/* Main Content */}
      <main style={{
        display: 'flex',
        justifyContent: 'space-between',
        padding: '2rem 4rem',
        flex: 1,
        backgroundColor: '#000000'
      }}>
        {/* Features Panel */}
        <div style={{
          flex: 1,
          paddingRight: '2rem',
          maxWidth: '40%',
        }}>
          <h2 style={{ marginBottom: '1rem' }}>✨ Features</h2>
          <ul style={{ lineHeight: '2rem', fontSize: '1.1rem' }}>
            <li>✅ ReactJS frontend for smooth UI</li>
            <li>✅ FastAPI backend with Python</li>
            <li>✅ Understands your name and context</li>
            <li>✅ Remembers info within a session</li>
            <li>✅ Easy to expand with your own Q&A</li>
          </ul>

          {/* Logos */}
          <div style={{
            display: 'flex',
            gap: '1.5rem',
            marginTop: '2rem',
            alignItems: 'center'
          }}>
            <a href="https://vitejs.dev" target="_blank">
              <img src={viteLogo} alt="Vite logo" width={60} />
            </a>
            <a href="https://react.dev" target="_blank">
              <img src={reactLogo} alt="React logo" width={60} />
            </a>
          </div>
        </div>

        {/* Chatbot */}
        <div style={{
          flex: 2,
          background: '#000000',
          padding: '2rem',
          borderRadius: '8px',
          boxShadow: '0 4px 12px rgba(0,0,0,0.1)',
          maxHeight: '80vh',
          overflowY: 'auto',
          width: '100%'
        }}>
          <Chatbot />
        </div>
      </main>

      {/* Footer */}
      <footer style={{
        background: '#282c34',
        padding: '1rem',
        textAlign: 'center',
        fontSize: '0.9rem'
      }}>
        Built with ❤️ by Vishal Mistry — <a href="https://github.com/vpmistry13/ai-chat-bot" target="_blank">GitHub Repo</a>
      </footer>
    </div>
  )
}

export default App
