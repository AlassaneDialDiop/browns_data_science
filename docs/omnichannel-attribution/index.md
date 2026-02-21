# [OmniChannel Attribution](../)

<div class="report-header">
  <div class="report-meta">
    <div><strong>Status:</strong> Production</div>
    <div><strong>Category:</strong> CRM Reports</div>
    <div><strong>Last updated:</strong> February 2026</div>
  </div>
</div>

<div class="two-column-layout">

<div class="column-left">

## Context

This report measures the **full omnichannel impact** of web traffic -- attributing revenue to marketing channels across both online and in-store purchases. When a customer browses on brownshoes.com via Google Ads then buys in-store, we can only attribute that sale if we identified the customer during their web session. For some channels we identify as little as 28% of visitors. This report estimates the hidden store revenue using a statistically-grounded uplift methodology, approved by leadership in February 2026.

## Data Source

**Snowflake model:** `bi_digital_web_traffic_omnichannel_attribution`

</div>

<div class="column-right">

<div class="tabs-container">
  <div class="tabs-bar">
    <button class="tab-btn active" data-tab="tab-overview">Overview</button>
    <button class="tab-btn" data-tab="tab-methodology">Methodology</button>
  </div>

  <div class="tab-panel active" id="tab-overview">
    <h3>Overview -- Channel Impact</h3>
    <p>Stacked bar chart showing each channel's online revenue (observed) alongside estimated store revenue. Channels with low identification rates (like Google Ads at ~28%) show the largest uplift. Channels with high identification (like Email at ~97%) show minimal adjustment.</p>
    <img src="../assets/images/omnichannel-attribution-dashboard.png" alt="OmniChannel Attribution Dashboard -- Overview" />
  </div>

  <div class="tab-panel" id="tab-methodology">
    <h3>Methodology -- Uplift Estimation</h3>
    <p>The uplift factor per channel blends two signals: (1) the identification rate -- channels where we identify fewer visitors have more hidden store conversions, and (2) a customer-mix correction -- identified traffic skews toward returning customers, so we adjust for that bias. The uplift uses a rolling 60-day window, making it stable and independent of the selected date range.</p>
    <img src="../assets/images/omnichannel-attribution-dashboard.png" alt="OmniChannel Attribution Dashboard -- Methodology" />
  </div>
</div>

</div>

</div>

---

*Last updated: 2026-02-21*
