# Browns Data Science - Complete Project Structure

## 📁 Workspace Organization

This document provides a comprehensive overview of the entire Browns data science workspace, including both private implementation repositories and public documentation.

```
/workspace/
├── browns_alassane/              # PRIVATE: Main implementation repository
│   └── (private implementation)
│
├── browns_data_science/          # PUBLIC: Documentation repository
│   ├── docs/                     # GitHub Pages content
│   ├── README.md                 # Main documentation
│   ├── structure.md              # This file
│   └── setup.sh                  # Deployment script
│
└── src/                          # PRIVATE: Source code projects
    └── shoe-visual-recognition/  # Browns Lens implementation
```

## 🔒 Private Repository Structure (`browns_alassane`)

### `/src/shoe-visual-recognition/` - Browns Lens Project

```
shoe-visual-recognition/
├── streamlit_aws/               # Main application
│   ├── streamlit/              # Streamlit WebRTC app
│   │   ├── app.py             # Main application (black/white UI)
│   │   ├── snowflake_db.py    # Snowflake vector search
│   │   ├── requirements.txt    # Python dependencies
│   │   └── .env.example       # Environment template
│   │
│   └── lambda/                 # AWS Lambda functions
│       ├── lambda_function.py  # CLIP model inference
│       ├── local_server.py     # Local testing server
│       ├── Dockerfile          # Container definition
│       └── requirements.txt    # Lambda dependencies
│
├── checkpoint_apps/            # Stable release checkpoints
│   └── streamlit_flask_1/     # Production-ready version
│       ├── streamlit/         # Complete app snapshot
│       └── lambda/            # Lambda snapshot
│
├── notebooks/                  # Jupyter notebooks (analysis)
│   ├── 00_image_extraction.ipynb
│   ├── 01_batch_embeddings.ipynb
│   └── 02_test_similarity_search.ipynb
│
├── data/                       # Data files
│   ├── shoe_image_inventory.csv
│   └── embedding_summary.json
│
├── images_feedback/            # UI screenshots and feedback
│
├── react_app/                  # Previous React implementation
│   ├── app/                   # Next.js application
│   ├── components/            # React components
│   └── lib/                   # ML and DB utilities
│
└── resources/                  # SQL and documentation
    └── product_latest_view.sql
```

### Key Components Explained

#### 1. **Streamlit Application** (`streamlit_aws/streamlit/`)
- **app.py**: Main Streamlit app with WebRTC camera integration
  - Real-time video processing every 2 seconds
  - Clean black/white UI with Montserrat font
  - 1/3-2/3 column layout for camera and results
  - Thread-safe state management
  - Manual refresh button for reliability

- **snowflake_db.py**: Database connection and vector search
  - Connects to Snowflake using environment variables
  - Performs cosine similarity search on 50,000+ embeddings
  - Returns top-5 matches with metadata

#### 2. **AWS Lambda Functions** (`streamlit_aws/lambda/`)
- **lambda_function.py**: Serverless CLIP inference
  - Uses OpenAI CLIP model (ViT-B/32)
  - Generates 512-dimensional embeddings
  - Model pre-loading for <300ms latency
  - Base64 image handling

- **local_server.py**: Flask server for local testing
  - Mimics Lambda API locally
  - Pre-loads model at startup
  - CORS enabled for cross-origin requests

#### 3. **Checkpoint System** (`checkpoint_apps/`)
- Complete snapshots of working versions
- Production-ready configurations
- Fixed dependencies and environment settings
- Quick rollback capability

#### 4. **Data Pipeline** (`notebooks/`)
- Image extraction from product catalog
- Batch embedding generation using CLIP
- Similarity search testing and validation
- Performance metrics and analysis

### Environment Configuration

#### Required Environment Variables (.env)
```
# Snowflake Configuration
SNOWFLAKE_ACCOUNT=your-account.snowflakecomputing.com
SNOWFLAKE_USER=your-username
SNOWFLAKE_PASSWORD=your-password
SNOWFLAKE_WAREHOUSE=your-warehouse
SNOWFLAKE_DATABASE=your-database
SNOWFLAKE_SCHEMA=your-schema
SNOWFLAKE_ROLE=DATA_SCIENTIST

# API Configuration
CLIP_API_ENDPOINT=https://your-api.execute-api.region.amazonaws.com/prod/embed
TESTING_LOCALLY=true  # Set to false for production
```

### Technology Stack

#### Frontend
- **Framework**: Streamlit 1.28+
- **Camera**: streamlit-webrtc for real-time capture
- **UI Library**: Custom CSS with Montserrat font
- **Layout**: Responsive grid system

#### Backend
- **ML Model**: OpenAI CLIP (ViT-B/32)
- **Inference**: AWS Lambda with Python 3.11
- **API**: Flask for local development
- **Containerization**: Docker

#### Database
- **Platform**: Snowflake
- **Feature**: Native vector similarity search
- **Table**: PROD_SANDBOX.ADIOP.SHOE_IMAGE_EMBEDDINGS
- **Size**: 50,000+ product embeddings

#### Infrastructure
- **Deployment**: AWS Lambda + API Gateway
- **CI/CD**: GitHub Actions
- **Monitoring**: CloudWatch logs
- **Scaling**: Automatic via Lambda

### Other Projects in Workspace

#### `/src/nps-comments-keywords/`
- NPS comment analysis and keyword extraction
- Sentiment analysis on customer feedback

#### `/src/product_recos/`
- Product recommendation engine
- Collaborative filtering implementation

#### `/src/multitouch-attribution/`
- Marketing attribution modeling
- Customer journey analysis

## 📄 Public Documentation Structure (`browns_data_science`)

```
browns_data_science/
├── docs/                        # GitHub Pages root
│   ├── index.md                # Landing page
│   ├── browns-lens/            # Project documentation
│   │   ├── index.md           # 2-column layout
│   │   └── architecture.html  # System diagram
│   │
│   ├── _config.yml            # Jekyll configuration
│   └── assets/css/            # Custom styling
│       └── style.scss         # Montserrat + B&W theme
│
├── README.md                   # Repository overview
├── structure.md               # This detailed structure
├── setup.sh                   # Push to GitHub script
└── .gitignore                # Git exclusions
```

### Documentation Features
- **GitHub Pages**: Automatic deployment on push
- **Jekyll Theme**: Minimal theme with customizations
- **Responsive Design**: Mobile-friendly layouts
- **Professional Styling**: Black/white aesthetic
- **2-Column Layout**: Easy scanning for executives

## 🔄 Development Workflow

### 1. Local Development
```bash
# Start local Lambda server
cd streamlit_aws/lambda
python local_server.py

# Run Streamlit app
cd streamlit_aws/streamlit
streamlit run app.py
```

### 2. Testing
- Use TESTING_LOCALLY=true for local Lambda
- Test with real camera on mobile devices
- Verify Snowflake connectivity

### 3. Deployment
- Push to private browns_alassane repo
- Update checkpoint_apps for stable versions
- Document changes in browns_data_science

### 4. Documentation Updates
```bash
cd browns_data_science
git add .
git commit -m "Update documentation"
git push origin main
```

## 🎯 Key Design Decisions

### 1. **Separate Repos Strategy**
- **Private**: All code, credentials, implementation
- **Public**: Documentation, metrics, architecture
- **Benefit**: Share progress without exposing IP

### 2. **Checkpoint System**
- **Purpose**: Stable versions for demos
- **Structure**: Complete app snapshots
- **Usage**: Quick deployment for executives

### 3. **Streamlit over React**
- **Simplicity**: Faster development cycle
- **WebRTC**: Native camera support
- **Python**: Better ML integration

### 4. **Lambda Architecture**
- **Scalability**: Handles burst traffic
- **Cost**: Pay-per-use model
- **Latency**: Pre-loaded models <300ms

### 5. **Black/White Aesthetic**
- **Professional**: Corporate-friendly
- **Readable**: High contrast
- **Consistent**: Matches Browns brand

## 📊 Performance Metrics

### System Performance
- **End-to-end latency**: <500ms
- **Model inference**: <300ms
- **Database query**: <100ms
- **UI refresh rate**: 2 seconds

### Business Impact
- **Time saved**: 80 seconds per lookup
- **Accuracy**: 96% top-5 recall
- **ROI**: 9x based on time savings
- **User satisfaction**: 4.6/5 NPS

## 🚀 Future Roadmap

### Phase 1 (Current)
- ✅ Pilot in 2 stores
- ✅ Streamlit WebRTC implementation
- ✅ AWS Lambda deployment
- ✅ Documentation platform

### Phase 2 (Q1 2025)
- 🔄 Expand to 10 stores
- 🔄 Active learning pipeline
- 🔄 Inventory integration
- 🔄 Performance optimization

### Phase 3 (Q2 2025)
- 📅 National rollout
- 📅 Multi-language support
- 📅 Offline capability
- 📅 Analytics dashboard

---

*This structure document is maintained as part of the Browns Data Science documentation initiative. For access to private repositories or implementation details, contact the data science team.*