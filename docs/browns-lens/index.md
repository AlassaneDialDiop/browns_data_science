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

<div class="architecture-diagram">
  <svg viewBox="0 0 800 500" style="width: 100%; max-width: 800px; margin: 0 auto; display: block;">
    <!-- Background -->
    <rect width="800" height="500" fill="#fef9f5" stroke="#000" stroke-width="2" rx="8"/>
    
    <!-- Title -->
    <text x="400" y="30" text-anchor="middle" font-size="18" font-weight="bold" fill="#333">
      High-level Diagram of How Browns Lens Works Behind the Scenes
    </text>
    
    <!-- Build Catalog Section -->
    <g id="catalog">
      <text x="150" y="70" text-anchor="middle" font-size="14" font-weight="bold" fill="#444">Build Catalog</text>
      
      <!-- Product Photos -->
      <rect x="75" y="90" width="150" height="40" fill="#fff" stroke="#000" stroke-width="2" rx="8"/>
      <text x="150" y="110" text-anchor="middle" font-size="13" fill="#000">📷 Product Photos</text>
      
      <!-- Pre-processing -->
      <rect x="75" y="150" width="150" height="40" fill="#fff" stroke="#000" stroke-width="2" rx="8"/>
      <text x="150" y="170" text-anchor="middle" font-size="13" fill="#000">🖼️ Pre-processing</text>
      
      <!-- CLIP Embeddings -->
      <rect x="75" y="210" width="150" height="50" fill="#e8eaf6" stroke="#9fa8da" stroke-width="2" rx="8"/>
      <text x="150" y="230" text-anchor="middle" font-size="13" fill="#000">🧠 CLIP Embeddings</text>
      <text x="150" y="245" text-anchor="middle" font-size="11" fill="#666">768-dim vectors</text>
      
      <!-- Vector Storage -->
      <rect x="75" y="280" width="150" height="40" fill="#fff" stroke="#000" stroke-width="2" rx="8"/>
      <text x="150" y="300" text-anchor="middle" font-size="13" fill="#000">💾 Vector Storage</text>
      
      <!-- Arrows -->
      <line x1="150" y1="130" x2="150" y2="150" stroke="#666" stroke-width="2" marker-end="url(#arrowhead)"/>
      <line x1="150" y1="190" x2="150" y2="210" stroke="#666" stroke-width="2" marker-end="url(#arrowhead)"/>
      <line x1="150" y1="260" x2="150" y2="280" stroke="#666" stroke-width="2" marker-end="url(#arrowhead)"/>
    </g>
    
    <!-- Vector Database -->
    <g id="database">
      <ellipse cx="400" cy="250" rx="80" ry="80" fill="#fff3e0" stroke="#ffb74d" stroke-width="3"/>
      <text x="400" y="240" text-anchor="middle" font-size="14" font-weight="bold" fill="#e65100">🗄️ Snowflake</text>
      <text x="400" y="260" text-anchor="middle" font-size="12" fill="#bf360c">Vector Database</text>
      <text x="400" y="275" text-anchor="middle" font-size="11" fill="#bf360c">50K+ products</text>
    </g>
    
    <!-- Recognize Shoe Section -->
    <g id="recognize">
      <text x="650" y="70" text-anchor="middle" font-size="14" font-weight="bold" fill="#444">Recognize Shoe</text>
      
      <!-- Camera Capture -->
      <rect x="575" y="90" width="150" height="40" fill="#fff" stroke="#000" stroke-width="2" rx="8"/>
      <text x="650" y="110" text-anchor="middle" font-size="13" fill="#000">📱 Camera Capture</text>
      
      <!-- Live Processing -->
      <rect x="575" y="150" width="150" height="40" fill="#fff" stroke="#000" stroke-width="2" rx="8"/>
      <text x="650" y="170" text-anchor="middle" font-size="13" fill="#000">⚡ Live Processing</text>
      
      <!-- CLIP Embeddings -->
      <rect x="575" y="210" width="150" height="50" fill="#e8eaf6" stroke="#9fa8da" stroke-width="2" rx="8"/>
      <text x="650" y="230" text-anchor="middle" font-size="13" fill="#000">🧠 CLIP Embeddings</text>
      <text x="650" y="245" text-anchor="middle" font-size="11" fill="#666">Real-time</text>
      
      <!-- Arrows -->
      <line x1="650" y1="130" x2="650" y2="150" stroke="#666" stroke-width="2" marker-end="url(#arrowhead)"/>
      <line x1="650" y1="190" x2="650" y2="210" stroke="#666" stroke-width="2" marker-end="url(#arrowhead)"/>
    </g>
    
    <!-- Similarity Matching -->
    <g id="matching">
      <rect x="325" y="350" width="150" height="50" fill="#f3e5f5" stroke="#ba68c8" stroke-width="2" rx="8"/>
      <text x="400" y="370" text-anchor="middle" font-size="13" fill="#6a1b9a">🔍 Similarity</text>
      <text x="400" y="385" text-anchor="middle" font-size="13" fill="#6a1b9a">Matching</text>
    </g>
    
    <!-- Results -->
    <g id="results">
      <rect x="325" y="430" width="150" height="40" fill="#e8f5e9" stroke="#66bb6a" stroke-width="3" rx="8"/>
      <text x="400" y="455" text-anchor="middle" font-size="14" font-weight="bold" fill="#2e7d32">👟 Top 5 Products</text>
    </g>
    
    <!-- Connection Lines -->
    <line x1="225" y1="300" x2="320" y2="250" stroke="#666" stroke-width="2" marker-end="url(#arrowhead)"/>
    <line x1="400" y1="330" x2="400" y2="350" stroke="#666" stroke-width="2" marker-end="url(#arrowhead)"/>
    <line x1="575" y1="235" x2="475" y2="375" stroke="#666" stroke-width="2" marker-end="url(#arrowhead)"/>
    <line x1="400" y1="400" x2="400" y2="430" stroke="#666" stroke-width="2" marker-end="url(#arrowhead)"/>
    
    <!-- Arrow marker definition -->
    <defs>
      <marker id="arrowhead" markerWidth="10" markerHeight="10" refX="8" refY="3" orient="auto">
        <polygon points="0 0, 10 3, 0 6" fill="#666"/>
      </marker>
    </defs>
  </svg>
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

*Last updated: 2025-07-22* v1.10