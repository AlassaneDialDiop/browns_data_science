<div class="page-top-bar">
  <h1>Customer Analytics - Exploration Dashboard</h1>
  <a class="report-link" href="https://prod-ca-a.online.tableau.com/#/site/brownsshoes/workbooks/1235059/views">Open in Tableau</a>
</div>

<div class="report-meta">
  <div><strong>Status:</strong> Production</div>
  <div><strong>Category:</strong> Others</div>
  <div><strong>Last updated:</strong> February 22, 2026</div>
</div>

<div class="tabs-container">
  <div class="tabs-bar">
    <button class="tab-btn active" data-tab="tab-interactive">Interactive View</button>
    <button class="tab-btn" data-tab="tab-deep">Deep dives</button>
  </div>

  <div class="tab-panel active" id="tab-interactive">
    <p>Configurable bar chart for ad-hoc exploration of customer order data. Users select up to 3 dimensions (e.g. New_Customer_Flag, Order_Type) and 3 measures (e.g. AOV, Num_Repeaters_Lifetime, Pct_of_Repeaters_Lifetime). Right-side filter panel covers order date, order channel, order type, new/existing status, province, spend bucket, return flags, promo, coupon type, and more.</p>
    <img src="../assets/images/customer-analytics-interactive-view.png" alt="Customer Analytics — Interactive View" />
  </div>

  <div class="tab-panel" id="tab-deep">
    <p>Stacked bar chart showing repeat purchase distribution across time buckets (0-90 days, 91-270, 271-730, No repeat ever) broken down by selected dimensions. Designed for deeper investigation into customer retention patterns by order type, channel, and customer segment. Includes additional filters for carrier, lead time, and contact reason.</p>
    <img src="../assets/images/customer-analytics-deep-dives.png" alt="Customer Analytics — Deep dives" />
  </div>
</div>

## Context

Self-serve exploration dashboard for customer analytics. Allows stakeholders to slice order history data across any combination of dimensions and measures without needing to request custom analysis. The Interactive View supports quick comparisons, while Deep dives focuses on repeat purchase behavior and retention patterns.

## Data Source

**Snowflake model:** `PROD_SANDBOX.ADIOP.lean_order_history_customer_analytics`
