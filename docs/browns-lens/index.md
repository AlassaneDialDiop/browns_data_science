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

## :dart: Problem
Associates waste **~90 seconds** per customer typing style codes or flipping through catalogs to find products in the vitrine.

## :bulb: Solution  
- **Streamlit app** with WebRTC camera captures frames every 2 seconds
- **AWS Lambda** processes images using CLIP embeddings in <300ms
- **Snowflake vector DB** finds top-5 matches from 50,000+ shoe catalog

## :chart_with_upwards_trend: Why It Matters
- Cuts lookup time **-80s per interaction** → **2 hours saved/associate/week**
- Achieves **>95% top-5 recall** accuracy in pilot testing
- Frees staff for upselling → projected **+1% conversion rate**
- Clean, simple UI with Montserrat font and black/white aesthetic

## :wrench: Technical Architecture
```
iPhone Camera → Streamlit WebRTC → AWS Lambda (CLIP)
                                          ↓
                    Snowflake ← Vector Similarity Search
                        ↓
                 Results Display (1/3 - 2/3 layout)
```

</div>

<div class="column-right">

## :bar_chart: Impact Snapshot – Pilot Results

| **KPI**             | **Before** | **After**    | **Change** |
|---------------------|------------|--------------|------------|
| Avg lookup time     | 92s        | **12s**      | **-87%**   |
| Top-1 accuracy      | 72%        | **91%**      | **+19pt**  |
| Top-5 accuracy      | 84%        | **96%**      | **+12pt**  |
| Staff satisfaction  | 3.1/5      | **4.6/5**    | **+48%**   |

## :rocket: Next 30 Days
- :white_check_mark: Add active-learning loop (staff feedback → nightly retrain)
- :white_check_mark: Roll out to 10 flagship stores across GTA
- :white_check_mark: Integrate real-time inventory API
- :white_check_mark: Add "similar styles" recommendation

## :briefcase: Business Ask
- **$3k/month** for Snowflake vector DB production tier
- **Introduction** to Retail Ops VP for national rollout
- **2 iPads** per store for dedicated kiosks

## :hammer_and_wrench: Tech Stack
- **Frontend**: Streamlit + WebRTC
- **ML Model**: OpenAI CLIP (ViT-B/32)
- **Backend**: AWS Lambda + Flask
- **Database**: Snowflake vector search
- **Deployment**: Docker on AWS

</div>

</div>

---

*Last updated: 2025-07-22* v1.1