<div class="page-top-bar">
  <h1>Repeat Purchase Report 2026</h1>
  <a class="report-link" target="_blank" href="https://prod-ca-a.online.tableau.com/#/site/brownsshoes/workbooks/1766303/views">Open in Tableau</a>
</div>

<div class="report-meta">
  <div><strong>Status:</strong> Testing</div>
  <div><strong>Category:</strong> Marketing / Self-Serve</div>
  <div><strong>Last updated:</strong> February 22, 2026</div>
</div>

<div class="tabs-container">
  <div class="tabs-bar">
    <button class="tab-btn active" data-tab="tab-cohort">Cohort (Acquisition Date)</button>
    <button class="tab-btn" data-tab="tab-frequency">Frequency Dashboard</button>
    <button class="tab-btn" data-tab="tab-province">Province Dashboard</button>
    <button class="tab-btn" data-tab="tab-brand">Brand Dashboard</button>
    <button class="tab-btn" data-tab="tab-top-brands">Top Brands Dashboard</button>
    <button class="tab-btn" data-tab="tab-likelihood">Per Cohort - Likelihood</button>
    <button class="tab-btn" data-tab="tab-speed">Repeat speed view</button>
  </div>

  <div class="tab-panel active" id="tab-cohort">
    <p>Repeat purchase rate by monthly acquisition cohort and delay window. Rows are first-purchase months, columns are time-to-repeat buckets (31-60 days, 61-90, up to 601-630 days). Shows how quickly each cohort returns for a second purchase. Filterable by view type, date range, order channel, province, and brand.</p>
    <img src="../assets/images/repeat-purchase-cohort-table.png" alt="Repeat Purchase — Cohort Table" />
  </div>

  <div class="tab-panel" id="tab-frequency">
    <p>Order frequency analysis showing what % of customers will repeat based on previous order history. Left chart displays a cumulative curve of repeat likelihood by number of lifetime purchases. Right charts show repeat curves by purchase number over time. Summary table includes % will repeat, repeat-within-X-days rates, median days until repeat, and average purchases afterward.</p>
    <img src="../assets/images/repeat-purchase-frequency.png" alt="Repeat Purchase — Frequency Dashboard" />
  </div>

  <div class="tab-panel" id="tab-province">
    <p>Repeat purchase rate trends by province over time. Line chart tracks each province's repeat rate by quarter. Summary table shows customer count, avg customers per day, % will repeat, repeat-within-X-days, median and average days until repeat, and avg purchases afterward. Heatmap coloring highlights relative performance.</p>
    <img src="../assets/images/repeat-purchase-province.png" alt="Repeat Purchase — Province Dashboard" />
  </div>

  <div class="tab-panel" id="tab-brand">
    <p>Repeat purchase rate trends by brand over time. Line chart shows repeat rate evolution by month for top brands. Table below lists brand-level metrics including % of customers, repeat rates, days to repeat, and average subsequent purchases. Searchable by brand name.</p>
    <img src="../assets/images/repeat-purchase-brand.png" alt="Repeat Purchase — Brand Dashboard" />
  </div>

  <div class="tab-panel" id="tab-top-brands">
    <p>Ranked table of all brands by customer volume with repeat purchase metrics. Shows # of customers, avg customers per day, % will repeat, repeat-within-X-days, avg days until repeat, and avg purchases afterward. Heatmap coloring for quick visual comparison across brands. Filterable by province, new/existing customer flag, and order channel.</p>
    <img src="../assets/images/repeat-purchase-top-brands.png" alt="Repeat Purchase — Top Brands Dashboard" />
  </div>

  <div class="tab-panel" id="tab-likelihood">
    <p>Monthly likelihood of repeat purchase within 1,000 days, with year-over-year comparison (2022-2025). Each line represents a year, showing how repeat probability varies by month of first purchase. Useful for identifying seasonal patterns in customer retention and tracking YoY improvement or decline.</p>
    <img src="../assets/images/repeat-purchase-cohort-likelihood.png" alt="Repeat Purchase — Per Cohort Likelihood" />
  </div>

  <div class="tab-panel" id="tab-speed">
    <p>Focused view on repeat purchase likelihood trends over time. Zoomed-in perspective on the same cohort likelihood data, making it easier to compare year-over-year shifts in repeat behavior at a monthly granularity.</p>
    <img src="../assets/images/repeat-purchase-speed-view.png" alt="Repeat Purchase — Repeat Speed View" />
  </div>
</div>

## Context

Comprehensive repeat purchase analysis covering every angle of customer retention: when customers come back (cohort delay windows), how purchase frequency drives future behavior, how retention varies by geography and brand, and how repeat likelihood trends year over year. Built to help the CRM team identify retention levers and measure the impact of loyalty initiatives.

## Data Source

**Snowflake model:** `PROD_SANDBOX.ADIOP.customer_spend_summary`
