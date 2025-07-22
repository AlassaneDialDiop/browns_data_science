# [Browns Lens – Real-time SKU Recognition](../)

<div class="project-header">
  <div class="project-meta">
    <div><strong>Project:</strong> Browns Lens – SKU-on-Camera</div>
    <div><strong>Owner:</strong> Alassane Diop — Data Science / AI</div>
    <div><strong>Status:</strong> 🧪 Pilot (2 stores)</div>
    <div><strong>Demo:</strong> <a href="https://browns-internal/browns-lens">Live Demo</a></div>
  </div>
</div>

<div class="two-column-layout">

<div class="column-left">

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

</div>

<div class="column-right">

## 🔧 How Browns Lens Works

<div class="shazam-diagram">
  <div class="diagram-title">High-level Diagram of How Browns Lens Works<br>Behind the Scenes</div>
  
  <div class="diagram-content">
    
    <!-- Catalog Side -->
    <div class="process-column catalog-column">
      <div class="column-title">Catalog Products</div>
      
      <div class="process-box">
        <div class="process-icon">📷</div>
        <div class="process-label">Product Photos</div>
      </div>
      
      <div class="process-arrow">↓</div>
      
      <div class="process-box">
        <div class="process-icon">🖼️</div>
        <div class="process-label">Pre-processing</div>
      </div>
      
      <div class="process-arrow">↓</div>
      
      <div class="process-box fingerprint-box">
        <div class="process-label">CLIP Embeddings</div>
        <div class="process-sublabel">768-dim vectors</div>
      </div>
      
      <div class="process-arrow">↓</div>
      
      <div class="process-box">
        <div class="process-label">Vector Storage</div>
      </div>
      
      <div class="arrow-to-db">→</div>
    </div>
    
    <!-- Database -->
    <div class="database-column">
      <div class="database-box">
        <div class="db-icon">🗄️</div>
        <div class="db-label">Vector Database</div>
        <div class="db-sublabel">50,000+ products</div>
      </div>
      
      <div class="matching-box">
        <div class="matching-label">Similarity<br>Matching</div>
      </div>
      
      <div class="result-arrow">↓</div>
      
      <div class="result-box">
        <div class="result-icon">👟</div>
        <div class="result-label">Top 5 Products</div>
      </div>
    </div>
    
    <!-- Recognition Side -->
    <div class="process-column recognize-column">
      <div class="column-title">Identify Shoe</div>
      
      <div class="process-box">
        <div class="process-icon">📱</div>
        <div class="process-label">Camera Capture</div>
      </div>
      
      <div class="process-arrow">↓</div>
      
      <div class="process-box">
        <div class="process-icon">⚡</div>
        <div class="process-label">Live Processing</div>
      </div>
      
      <div class="process-arrow">↓</div>
      
      <div class="process-box fingerprint-box">
        <div class="process-label">CLIP Embeddings</div>
        <div class="process-sublabel">Real-time</div>
      </div>
      
      <div class="arrow-to-matching">→</div>
    </div>
    
  </div>
</div>

</div>

</div>

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

*Last updated: 2025-07-22* v1.6