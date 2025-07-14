RAG PDF Q&A System
Unlock answers from your PDFs using Retrieval-Augmented Generation (RAG) with fast, accurate, and context-aware responses.
🚀 Features
	•	PDF Extraction: Split PDFs into smart chunks.
	•	Semantic Search: Find info fast with FAISS + MiniLM.
	•	Grounded Answers: Uses Groq Llama3 for reliable, source-based replies.
⚡ Quick Example

from PyPDF2 import PdfReader
from langchain.text_splitter import RecursiveCharacterTextSplitter

reader = PdfReader("assignment.pdf")
text = "".join(page.extract_text() for page in reader.pages)
splitter = RecursiveCharacterTextSplitter(chunk_size=500, chunk_overlap=100)
chunks = splitter.split_text(text)

💡 Use Cases
	•	Research Q&A
	•	Document search
	•	Study tools
Built with PyPDF2, LangChain, FAISS, MiniLM, and Groq Llama3.
