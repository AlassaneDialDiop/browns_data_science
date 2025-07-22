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

## 🔧 System Use Case Diagram

<div class="usecase-diagram">
  
  <!-- Actors -->
  <div class="actors-section">
    <div class="actor primary-actor">
      <div class="actor-icon">👤</div>
      <div class="actor-label">Store Associate</div>
    </div>
    
    <div class="actor secondary-actor">
      <div class="actor-icon">👥</div>
      <div class="actor-label">Customer</div>
    </div>
  </div>

  <!-- System Boundary -->
  <div class="system-boundary">
    <div class="system-title">Browns Lens System</div>
    
    <!-- Use Cases -->
    <div class="usecase-container">
      
      <div class="usecase primary-usecase">
        <div class="usecase-number">1</div>
        <div class="usecase-text">
          <strong>Capture Shoe Image</strong><br>
          <em>Point camera at shoe</em>
        </div>
      </div>
      
      <div class="usecase">
        <div class="usecase-number">2</div>
        <div class="usecase-text">
          <strong>Process Image</strong><br>
          <em>Extract features via CLIP</em>
        </div>
      </div>
      
      <div class="usecase">
        <div class="usecase-number">3</div>
        <div class="usecase-text">
          <strong>Search Products</strong><br>
          <em>Vector similarity search</em>
        </div>
      </div>
      
      <div class="usecase primary-usecase">
        <div class="usecase-number">4</div>
        <div class="usecase-text">
          <strong>Display Results</strong><br>
          <em>Show top 5 matches</em>
        </div>
      </div>
      
      <div class="usecase">
        <div class="usecase-number">5</div>
        <div class="usecase-text">
          <strong>Select Product</strong><br>
          <em>Choose from results</em>
        </div>
      </div>
      
    </div>
    
    <!-- Connections -->
    <div class="connections">
      <div class="connection">Store Associate → Use Cases 1, 4, 5</div>
      <div class="connection">Customer → Observes process</div>
      <div class="connection">Use Cases: 1 → 2 → 3 → 4 → 5</div>
    </div>
    
  </div>

  <!-- External Systems -->
  <div class="external-systems">
    <div class="external-system">
      <div class="system-icon">☁️</div>
      <div class="system-label">AWS Infrastructure</div>
      <div class="system-details">Lambda, API Gateway</div>
    </div>
    
    <div class="external-system">
      <div class="system-icon">❄️</div>
      <div class="system-label">Snowflake</div>
      <div class="system-details">Vector Database</div>
    </div>
    
    <div class="external-system">
      <div class="system-icon">🤖</div>
      <div class="system-label">OpenAI CLIP</div>
      <div class="system-details">ML Model</div>
    </div>
  </div>

  <!-- Key Flows -->
  <div class="key-flows">
    <div class="flow-title">Data Flow</div>
    <div class="flow-item">📸 Image Capture → Every 2 seconds</div>
    <div class="flow-item">⚡ Processing → <300ms response</div>
    <div class="flow-item">🎯 Accuracy → >95% top-5 recall</div>
  </div>

</div>

</div>

</div>

---

*Last updated: 2025-07-22* v1.5