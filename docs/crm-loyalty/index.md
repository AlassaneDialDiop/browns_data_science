<div class="page-top-bar">
  <h1>CRM Loyalty (dev)</h1>
  <a class="report-link" href="https://prod-ca-a.online.tableau.com/#/site/brownsshoes/workbooks/1766202/views">Open in Tableau</a>
</div>

<div class="report-meta">
  <div><strong>Status:</strong> Broken</div>
  <div><strong>Category:</strong> Marketing / Self-Serve</div>
  <div><strong>Last updated:</strong> February 22, 2026</div>
</div>

<div class="tabs-container">
  <div class="tabs-bar">
    <button class="tab-btn active" data-tab="tab-static">LTV deciles (static)</button>
    <button class="tab-btn" data-tab="tab-dynamic">LTV deciles (dynamic)</button>
    <button class="tab-btn" data-tab="tab-top1">Top1%</button>
    <button class="tab-btn" data-tab="tab-explore">Explore mix store/online</button>
  </div>

  <div class="tab-panel active" id="tab-static">
    <p>Customer value deciles table based on a fixed fiscal year period. Breaks the customer base into spend segments (Top 1%, Decile 1-10%) showing # of customers, min/max/avg spend, % of total spend, total purchases, % onetimers, and avg purchases per customer. Metric type toggles between Gross and Net.</p>
    <img src="../assets/images/loyalty-ltv-static.png" alt="CRM Loyalty — LTV Deciles (static)" />
  </div>

  <div class="tab-panel" id="tab-dynamic">
    <p>Dynamic version of the deciles view with a selectable date range comparison. Shows two tables: stats for the decile definition period (fiscal year) and stats for the selected date range using the same decile repartition. Allows tracking how each spend segment's behavior evolves across different time windows. Includes return order filter.</p>
    <img src="../assets/images/loyalty-ltv-dynamic.png" alt="CRM Loyalty — LTV Deciles (dynamic)" />
  </div>

  <div class="tab-panel" id="tab-top1">
    <p>Customer Value - Top 1% List. Intended to display the top 1% of customers by spend with individual-level detail. Currently broken -- page loads with filters but no data renders.</p>
    <img src="../assets/images/loyalty-top1.png" alt="CRM Loyalty — Top 1%" />
  </div>

  <div class="tab-panel" id="tab-explore">
    <p>Explore mix store/online. Slider filters for purchases in web, kids, and women categories with a customer count. Currently broken -- only filter controls render with no visualization output.</p>
    <img src="../assets/images/loyalty-explore-mix.png" alt="CRM Loyalty — Explore mix store/online" />
  </div>
</div>

## Context

Customer lifetime value and loyalty segmentation dashboard. Segments the customer base into spend deciles to understand value distribution, spending patterns, and one-time vs repeat buyer ratios. Originally designed to also include a Top 1% customer list and a store/online purchase mix explorer, but those tabs are currently non-functional.

## Data Source

**Snowflake model:** `PROD_SANDBOX.ADIOP.customer_spend_summary`
