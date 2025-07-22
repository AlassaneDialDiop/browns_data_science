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

## 🛠️ Tech Stack
- **Frontend**: Streamlit + WebRTC
- **ML Model**: OpenAI CLIP (ViT-B/32)
- **Backend**: AWS Lambda + Flask
- **Database**: Snowflake vector search
- **Deployment**: Docker on AWS

</div>

<div class="column-right">

## 🔧 System Architecture

<div class="architecture-diagram">
  
  <!-- User Layer -->
  <div class="arch-layer user-layer">
    <div class="layer-label">USER LAYER</div>
    <div class="layer-content">
      <div class="component user-component">
        <div class="component-icon">👤</div>
        <div class="component-text">
          <strong>Store Associate</strong><br>
          Point camera at shoe
        </div>
      </div>
    </div>
  </div>

  <!-- Frontend Layer -->
  <div class="arch-layer frontend-layer">
    <div class="layer-label">FRONTEND LAYER</div>
    <div class="layer-content">
      <div class="component frontend-component">
        <div class="component-icon">📱</div>
        <div class="component-text">
          <strong>Streamlit WebApp</strong><br>
          WebRTC Camera Capture<br>
          <em>Auto-capture every 2s</em>
        </div>
      </div>
    </div>
  </div>

  <!-- API Layer -->
  <div class="arch-layer api-layer">
    <div class="layer-label">API LAYER</div>
    <div class="layer-content">
      <div class="component api-component">
        <div class="component-icon">🌐</div>
        <div class="component-text">
          <strong>AWS API Gateway</strong><br>
          RESTful Endpoint<br>
          <em>Authentication & Rate Limiting</em>
        </div>
      </div>
    </div>
  </div>

  <!-- Processing Layer -->
  <div class="arch-layer processing-layer">
    <div class="layer-label">PROCESSING LAYER</div>
    <div class="layer-content">
      <div class="component lambda-component">
        <div class="component-icon">⚡</div>
        <div class="component-text">
          <strong>AWS Lambda</strong><br>
          Image Processing<br>
          <em>Auto-scaling</em>
        </div>
      </div>
      <div class="process-arrow">→</div>
      <div class="component ml-component">
        <div class="component-icon">🧠</div>
        <div class="component-text">
          <strong>CLIP Model</strong><br>
          ViT-B/32<br>
          <em>768-dim embeddings</em>
        </div>
      </div>
    </div>
  </div>

  <!-- Data Layer -->
  <div class="arch-layer data-layer">
    <div class="layer-label">DATA LAYER</div>
    <div class="layer-content">
      <div class="component database-component">
        <div class="component-icon">🗄️</div>
        <div class="component-text">
          <strong>Snowflake Vector DB</strong><br>
          50,000+ Products<br>
          <em>Cosine similarity search</em>
        </div>
      </div>
    </div>
  </div>

  <!-- Response Flow -->
  <div class="response-flow">
    <div class="response-arrow">↑</div>
    <div class="response-text">
      <strong>Response: &lt;300ms</strong><br>
      Top 5 matching products<br>
      with confidence scores
    </div>
  </div>

  <!-- Data Flow Indicators -->
  <div class="flow-indicators">
    <div class="flow-down">⬇ Image Data</div>
    <div class="flow-up">⬆ Product Results</div>
  </div>

</div>

## 📊 Impact Metrics

| **KPI**             | **Before** | **After**    | **Change** |
|---------------------|------------|--------------|------------|
| Avg lookup time     | 92s        | **12s**      | **-87%**   |
| Top-1 accuracy      | 72%        | **91%**      | **+19pt**  |
| Top-5 accuracy      | 84%        | **96%**      | **+12pt**  |
| Staff satisfaction  | 3.1/5      | **4.6/5**    | **+48%**   |

</div>

</div>


---

*Last updated: 2025-07-22* v1.4