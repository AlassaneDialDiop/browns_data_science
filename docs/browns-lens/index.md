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

<div class="system-diagram">
  <div class="diagram-row">
    <div class="node user-node">
      <strong>Store Associate</strong><br>
      iPhone Camera
    </div>
    <div class="arrow">📱</div>
    <div class="node frontend-node">
      <strong>Streamlit App</strong><br>
      WebRTC Capture<br>
      <em>Every 2 seconds</em>
    </div>
  </div>
  
  <div class="diagram-flow">↓</div>
  
  <div class="diagram-row">
    <div class="node api-node">
      <strong>API Gateway</strong><br>
      HTTPS Endpoint
    </div>
    <div class="arrow">🌐</div>
    <div class="node compute-node">
      <strong>AWS Lambda</strong><br>
      Image Processing<br>
      <em>Auto-scaling</em>
    </div>
  </div>
  
  <div class="diagram-flow">↓</div>
  
  <div class="diagram-row">
    <div class="node ml-node">
      <strong>CLIP Model</strong><br>
      ViT-B/32<br>
      768-dim embeddings
    </div>
    <div class="arrow">🧠</div>
    <div class="node database-node">
      <strong>Snowflake</strong><br>
      Vector Database<br>
      50,000+ products
    </div>
  </div>
  
  <div class="diagram-flow">↓</div>
  
  <div class="diagram-row center">
    <div class="node results-node">
      <strong>Search Results</strong><br>
      Top 5 matches<br>
      <em>&lt;300ms response</em>
    </div>
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

*Last updated: 2025-07-22* v1.3