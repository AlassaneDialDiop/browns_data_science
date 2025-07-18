# Vitrine Vision – Real-time SKU Recognition

**Project**: Vitrine Vision – SKU-on-Camera  
**Owner**: Alassane Diop — Data Science / AI  
**Status**: 🧪 Pilot (2 stores)  
**Demo**: [Live Demo](https://browns-internal/vitrine-vision)

---

<div style="display: flex; gap: 20px;">

<div style="flex: 1.5;">

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

## 🔧 Technical Architecture
```
📱 iPhone Camera → Streamlit WebRTC → AWS Lambda (CLIP)
                                          ↓
                    Snowflake ← Vector Similarity Search
                        ↓
                 📊 Results Display (1/3 - 2/3 layout)
```

</div>

<div style="flex: 1;">

## 📊 Impact Snapshot – Pilot Results

| **KPI**             | **Before** | **After**    | **Change** |
|---------------------|------------|--------------|------------|
| Avg lookup time     | 92s        | **12s**      | **-87%**   |
| Top-1 accuracy      | 72%        | **91%**      | **+19pt**  |
| Top-5 accuracy      | 84%        | **96%**      | **+12pt**  |
| Staff satisfaction  | 3.1/5      | **4.6/5**    | **+48%**   |

## 🚀 Next 30 Days
- ✅ Add active-learning loop (staff feedback → nightly retrain)
- ✅ Roll out to 10 flagship stores across GTA
- ✅ Integrate real-time inventory API
- ✅ Add "similar styles" recommendation

## 💼 Business Ask
- **$3k/month** for Snowflake vector DB production tier
- **Introduction** to Retail Ops VP for national rollout
- **2 iPads** per store for dedicated kiosks

</div>

</div>

---

### 🛠️ Tech Stack Details
- **Frontend**: Streamlit + WebRTC (real-time camera)
- **ML Model**: OpenAI CLIP (ViT-B/32) for image embeddings
- **Backend**: AWS Lambda + Flask API
- **Database**: Snowflake with vector similarity search
- **Deployment**: Docker on AWS with auto-scaling

*Last updated: 2024-01-18*