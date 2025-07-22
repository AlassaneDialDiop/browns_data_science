# Browns Data Science

Technical documentation and project showcase for Data Science & AI initiatives at Browns Shoes.

## 🌐 Documentation Site
Visit: https://alassanedialdiop.github.io/browns_data_science/

## 🎯 Overview

This repository serves as the **public documentation platform** for Browns' data science initiatives, while all proprietary code remains in private repositories. It provides technical documentation, architecture overviews, and project metrics for stakeholders.

## 🔬 Active Projects

### 1. **Browns Lens** - Real-time SKU Recognition
- **Status**: 🧪 Pilot deployment (2 stores)
- **Impact**: -87% lookup time, 95% accuracy
- **Tech Stack**: 
  - Frontend: Streamlit with WebRTC camera integration
  - ML Model: OpenAI CLIP (ViT-B/32) for image embeddings
  - Backend: AWS Lambda serverless functions
  - Database: Snowflake vector similarity search
  - UI: Clean black/white aesthetic with Montserrat font
- **[View Documentation](./docs/browns-lens/)**


## 🏗️ Architecture Overview

### Browns Lens System Architecture
```
📱 Store Associate Device
         ↓
🎥 Streamlit WebRTC App (Real-time camera)
         ↓
⚡ AWS Lambda (CLIP Model)
         ↓
❄️ Snowflake Vector DB (50,000+ products)
         ↓
📊 Results Display (Top-5 matches)
```

### Key Features
- **Real-time Processing**: <300ms end-to-end latency
- **High Accuracy**: 96% top-5 recall in pilot testing
- **Scalable**: Serverless architecture with auto-scaling
- **User-Friendly**: Clean UI with 1/3-2/3 column layout

## 📁 Repository Structure

This public documentation repository contains:

```
browns_data_science/
├── docs/                      # GitHub Pages documentation
│   ├── index.md              # Main landing page
│   ├── browns-lens/          # Browns Lens project docs
│   ├── _config.yml           # Jekyll configuration
│   └── assets/css/           # Custom styling
├── README.md                 # This file
├── structure.md              # Detailed project structure
└── setup.sh                  # Deployment script
```

For the complete workspace organization including private implementation details, see **[structure.md](./structure.md)**.

## 🛠️ Technical Implementation

### Browns Lens - Key Components

1. **Frontend Application**
   - Streamlit app with WebRTC for real-time camera access
   - Clean black/white UI with Montserrat typography
   - Responsive 1/3-2/3 column layout
   - Manual refresh button for demo reliability

2. **ML Pipeline**
   - CLIP model for generating 512-dimensional embeddings
   - AWS Lambda for serverless inference
   - Model pre-loading for <300ms response times
   - Thread-safe processing with proper state management

3. **Data Infrastructure**
   - Snowflake vector database with 50,000+ shoe embeddings
   - Cosine similarity search with optimized indexing
   - Real-time synchronization with inventory systems

4. **Deployment**
   - Docker containers for consistent environments
   - GitHub Actions for CI/CD
   - Checkpoint system for stable releases
   - Environment-specific configurations (.env files)

## 🔐 Security & Privacy

- All proprietary code remains in **private repositories**
- This public repo contains only documentation and architecture overviews
- No customer data, API keys, or sensitive information
- Clear separation between public docs and private implementation

## 📊 Metrics & KPIs

### Browns Lens Pilot Results
| Metric | Before | After | Improvement |
|--------|--------|-------|-------------|
| Lookup Time | 92s | 12s | -87% |
| Top-1 Accuracy | 72% | 91% | +19pt |
| Top-5 Accuracy | 84% | 96% | +12pt |
| Staff NPS | 3.1/5 | 4.6/5 | +48% |

## 📝 Documentation Standards

All projects follow a consistent documentation format:
- **30-second executive summary** format
- **Two-column layout** for easy scanning
- **Clear metrics** and business impact
- **Technical architecture** diagrams
- **Next steps** and roadmap

---

*This is a public documentation repository. All proprietary code, data, and sensitive implementations remain in private repositories within the Browns organization.*