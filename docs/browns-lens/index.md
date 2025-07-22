# [Browns Lens – Real-time SKU Recognition](../)

**Project:** Browns Lens – SKU-on-Camera  
**Owner:** Alassane Diop — Data Science / AI  
**Status:** 🧪 Pilot (2 stores)  
**Demo:** [Live Demo](https://browns-internal/browns-lens)

---

## 🎯 Problem
Associates waste **~90 seconds** per customer typing style codes or flipping through catalogs to find products in the vitrine.

## 💡 Solution  
- **Streamlit app** with WebRTC camera captures frames every 2 seconds
- **AWS Lambda** processes images using CLIP embeddings in <300ms
- **Snowflake vector DB** finds top-5 matches from 50,000+ shoe catalog

## 📈 Why It Matters
- Cuts lookup time **-80s per interaction** → **2 hours saved/associate/week**
- Achieves **>95% top-5 recall** accuracy in pilot testing
- Frees staff for upselling → projected **+1% conversion rate**
- Clean, simple UI with Montserrat font and black/white aesthetic

## 🔧 How Browns Lens Works

![Browns Lens Architecture Diagram](/workspace/browns_data_science/docs/browns-lens/browns-lens-architecture.svg)

*Note: If diagram doesn't display, see ASCII version below*

```
High-level Diagram of How Browns Lens Works
Behind the Scenes

┌─────────────────────┐                    ┌─────────────────────┐
│  Catalog Products   │                    │   Identify Shoe     │
└─────────────────────┘                    └─────────────────────┘
          │                                          │
          ▼                                          ▼
    📷 Product Photos                          📱 Camera Capture
          │                                          │
          ▼                                          ▼
    🖼️ Pre-processing                          ⚡ Live Processing
          │                                          │
          ▼                                          ▼
    🧠 CLIP Embeddings                         🧠 CLIP Embeddings
       (768-dim vectors)                          (Real-time)
          │                                          │
          ▼                                          │
    💾 Vector Storage                                │
          │                                          │
          └────────────┐      ┌─────────────────────┘
                       ▼      ▼
                 ┌────────────────┐
                 │ Vector Database │
                 │ 50,000+ items  │
                 └────────────────┘
                          │
                          ▼
                 🔍 Similarity Matching
                          │
                          ▼
                    👟 Top 5 Products
```

## 🛠️ Technical Components

### 🎥 Frontend Layer
**Streamlit + WebRTC** – Provides real-time camera access through web browsers, capturing frames automatically every 2 seconds. WebRTC ensures low-latency video streaming without requiring any plugins or downloads, making it seamless for store associates to use on any device.

### 🧠 ML Processing  
**OpenAI CLIP (ViT-B/32)** – Converts shoe images into 768-dimensional vectors that capture visual features. CLIP (Contrastive Language-Image Pre-training) understands both images and text, trained on 400M image-text pairs. This allows it to recognize shoes even from different angles, lighting conditions, or partial views.

### ⚡ Compute Layer
**AWS Lambda + Flask** – Serverless functions that automatically scale based on demand, processing each image in under 300ms. Lambda eliminates the need for managing servers and only charges for actual compute time used. Flask provides a lightweight API framework for handling requests.

### ❄️ Vector Storage
**Snowflake Vector Database** – Stores pre-computed embeddings for our entire 50,000+ product catalog. Uses cosine similarity for ultra-fast nearest neighbor search, returning the most visually similar products in milliseconds. Snowflake's distributed architecture ensures consistent performance even as our catalog grows.

### 🐳 Deployment
**Docker on AWS** – Containerized deployment ensures consistent environments across development, testing, and production. Docker images package all dependencies, making deployments reliable and rollbacks simple. AWS provides the infrastructure with auto-scaling and high availability.

---

*Last updated: 2025-07-22* v1.7