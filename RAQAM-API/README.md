# R.A.Q.A.M – Retrieval-Augmented Quiz Automated Maker

R.A.Q.A.M (Retrieval-Augmented Quiz Automated Maker) is an AI-powered tool designed to generate quizzes from any type of content, including documents, videos, and more. Leveraging state-of-the-art retrieval and language generation techniques, R.A.Q.A.M allows users to quickly create engaging and informative quizzes, seamlessly blending content understanding with automation.

## 🚀 Features

- **Multi-format Content Support**: Generate quizzes from text content, PDF files, web pages, YouTube videos, and video files
- **Intelligent Content Processing**: Advanced text chunking and vector embeddings for optimal content understanding
- **Flexible Quiz Generation**: Customizable number of questions and answer choices
- **Flashcard Generation**: Create study flashcards alongside quizzes
- **Cost Tracking**: Real-time monitoring of API usage and costs
- **Web Interface**: User-friendly sandbox for testing and configuration
- **AWS Lambda Ready**: Deployable as serverless function with CORS support

## 🏗️ Architecture

### Core Components

1. **QuizGenerator** (`src/raqam.py`): Main orchestrator that handles content processing and quiz generation
2. **Document Processing** (`src/document.py`): Text chunking and preprocessing
3. **Vector Store** (`src/vector_store.py`): FAISS-based semantic search and retrieval
4. **Content Sources**:
   - `src/pdf.py`: PDF text extraction using PyMuPDF
   - `src/web_page.py`: Web scraping with BeautifulSoup
5. **Quiz Models** (`src/quiz.py`): Pydantic schemas for questions and flashcards
6. **API Layer**: Flask web API and AWS Lambda handler

### Data Flow

```
Content Input → Document Processing → Vector Embeddings → Retrieval → LLM Generation → Quiz Output
```

## 📁 Project Structure

```
RAQAM-main/
├── api/                          # API layer
│   ├── api.py                   # Flask web server
│   ├── lambda_function.py       # AWS Lambda handler
│   ├── static/                  # Web interface assets
│   │   ├── script.js           # Frontend JavaScript
│   │   └── style.css           # Styling
│   └── templates/              # HTML templates
│       └── quiz_sandbox.html   # Web interface
├── src/                         # Core application logic
│   ├── raqam.py                 # Main QuizGenerator class
│   ├── document.py             # Text document processing
│   ├── vector_store.py         # FAISS vector store
│   ├── quiz.py                 # Quiz and flashcard models
│   ├── quiz_config.py          # Configuration management
│   ├── pdf.py                  # PDF processing
│   ├── web_page.py             # Web scraping
│   ├── templates.py             # LLM prompt templates
│   ├── utils.py                # Utility functions
│   └── exception.py            # Custom exceptions
├── config/                      # Configuration files
│   └── default_config.yaml     # Default settings
├── Dockerfile                   # Container configuration
├── requirements.txt             # Python dependencies
└── README.md                   # This file
```

## 🛠️ Installation & Setup

### Prerequisites

- Python 3.9+
- OpenAI API key
- (Optional) AWS account for Lambda deployment

### Local Development

1. **Set up the development environment** (uses the same constraints as production):
```bash
cd RAQAM-API
chmod +x setup_local.sh
./setup_local.sh
```

2. **Activate the virtual environment**:
```bash
source venv/bin/activate
```

3. **Set up environment variables**:
```bash
export OPENAI_API_KEY="your-openai-api-key"
```

4. **Run the Flask development server**:
```bash
python api/api.py
```

5. **Access the web interface**:
   - Open `http://localhost:5050/quiz-sandbox` in your browser

**Note:** The `setup_local.sh` script installs dependencies with the exact same constraints as production (`constraints.txt`). This ensures that your local environment matches the deployed environment, preventing "works on my machine" issues.

### AWS Lambda Deployment

1. **Build the container**:
```bash
docker build -t raqam-lambda .
```

2. **Deploy to AWS Lambda** using the provided Dockerfile

## 🔧 Configuration

### Default Settings (`config/default_config.yaml`)

```yaml
base_quiz_config: 
  model_name: "gpt-4o-mini"                    # LLM model
  embdeddings_model_name: "text-embedding-3-small"  # Embedding model
  embedding_batch_size: 10                    # Batch size for embeddings
  min_text_length: 500                        # Minimum content length
  chunk_size: 2000                           # Text chunk size
  chunk_overlap: 100                         # Chunk overlap
  local_vector_store_path: null              # Vector store persistence
```

### Supported Content Sources

- **Text Content**: Direct text input
- **PDF Files**: Upload and process PDF documents
- **Web Pages**: Extract content from URLs
- **YouTube Videos**: Process video transcripts (planned)
- **Video Files**: Extract audio transcripts (planned)

## 📡 API Endpoints

### Flask API (`api/api.py`)

- `POST /generate-quiz`: Generate quiz from content
- `GET /quiz-sandbox`: Web interface
- `GET /get-config`: Retrieve current configuration
- `GET /get-default-config`: Get default settings
- `POST /set-custom-config`: Update configuration

### Request Format

```json
{
  "data": {
    "text_content": "Your text content here",
    "num_questions": 5,
    "num_choices": 4,
    "generate_flashcards": true
  }
}
```

### Response Format

```json
{
  "quizName": "Generated Quiz Name",
  "questionCards": [
    {
      "questionText": "What is...?",
      "questionChoices": ["Option A", "Option B", "Option C", "Option D"],
      "questionAnswerIndex": 0,
      "answerExplanation": "Explanation here"
    }
  ],
  "flashcards": [
    {
      "front": "Term",
      "back": "Definition"
    }
  ],
  "quizContext": {
    "contentSource": "text",
    "contentLength": 1500,
    "generationModelName": "gpt-4o-mini",
    "tokens": {...},
    "costs": {...}
  }
}
```

## 🧠 How It Works

### 1. Content Processing
- Input content is processed and chunked into manageable pieces
- Text is cleaned and preprocessed for optimal processing

### 2. Vector Embeddings
- Content chunks are converted to vector embeddings using OpenAI's embedding models
- FAISS vector store enables semantic search and retrieval

### 3. Intelligent Retrieval
- Relevant content chunks are retrieved based on the quiz generation query
- Ensures questions are generated from the most relevant parts of the content

### 4. LLM Generation
- Retrieved content is fed to GPT models with specialized prompts
- Generates multiple-choice questions with explanations
- Creates flashcards for key concepts

### 5. Output Processing
- Questions are randomized to prevent pattern recognition
- Answer choices are shuffled while maintaining correct answer mapping
- Cost and token usage are tracked and reported

## 💰 Cost Management

The system tracks and reports:
- **Input tokens**: Text sent to the LLM
- **Output tokens**: Generated responses
- **Embedding tokens**: Vector embeddings
- **Estimated costs**: Based on OpenAI pricing

## 🔒 Error Handling

Custom exception hierarchy:
- `RAQAMException`: Base exception class
- `InvalidInputDataException`: Invalid input validation
- `DocumentParsingException`: Content processing errors
- `QuizGenerationException`: Quiz generation failures
- `FlashcardsGenerationException`: Flashcard generation errors
- `WebPageException`: Web scraping errors

## 🚀 Deployment Options

### 1. Local Flask Server
- Development and testing
- Full web interface available
- Easy debugging and configuration

### 2. AWS Lambda
- Serverless deployment
- Automatic scaling
- Cost-effective for production
- CORS support for web applications

### 3. Docker Container
- Consistent deployment environment
- Easy integration with existing infrastructure

## 🔧 Customization

### Prompt Templates
Modify `src/templates.py` to customize:
- Question generation prompts
- Flashcard generation prompts
- Retrieval queries

### Configuration
- Adjust chunk sizes for different content types
- Modify embedding batch sizes for performance optimization
- Configure vector store persistence for faster subsequent runs

## 📊 Performance Considerations

- **Chunk Size**: Larger chunks provide more context but increase processing time
- **Batch Size**: Optimize embedding batch size based on available memory
- **Vector Store**: Persist vector stores to avoid re-computing embeddings
- **Model Selection**: Balance between cost and quality (GPT-4o-mini vs GPT-4)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🆘 Support

For issues and questions:
1. Check the error logs for detailed stack traces
2. Verify your OpenAI API key is valid
3. Ensure input content meets minimum length requirements
4. Check network connectivity for web scraping features