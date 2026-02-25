<div class="page-top-bar">
  <h1>Product Intelligence (Recos and Shopping Patterns)</h1>
  <a class="report-link" target="_blank" href="https://prod-ca-a.online.tableau.com/#/site/brownsshoes/workbooks/1251974/views">Open in Tableau</a>
</div>

<div class="report-meta">
  <div><strong>Status:</strong> Testing</div>
  <div><strong>Category:</strong> Others</div>
  <div><strong>Last updated:</strong> February 22, 2026</div>
</div>

<div class="tabs-container">
  <div class="tabs-bar">
    <button class="tab-btn active" data-tab="tab-profile">Customer Profile & Recos</button>
    <button class="tab-btn" data-tab="tab-product-assoc">All Product associations</button>
    <button class="tab-btn" data-tab="tab-brand">Brand associations</button>
    <button class="tab-btn" data-tab="tab-cross-visual">Cross selling (visual)</button>
    <button class="tab-btn" data-tab="tab-cross-table">Cross selling (table)</button>
    <button class="tab-btn" data-tab="tab-reco-viewer">Product Reco Viewer</button>
  </div>

  <div class="tab-panel active" id="tab-profile">
    <p>Individual customer lookup by email. Displays a customer profile summary -- first/last order dates, return rate, regular price %, favorite brand, province, and gender split across Women/Men/Kids products. Below, shows the customer's full purchase history with product images, followed by personalized product recommendations.</p>
    <img src="../assets/images/product-intel-customer-profile.png" alt="Product Intelligence — Customer Profile & Recos" />
  </div>

  <div class="tab-panel" id="tab-product-assoc">
    <p>Market basket analysis showing product associations based on 2024 purchase patterns. For each reference product, displays the top co-purchased products with images in a visual grid. Filterable by recommendation model (e.g. CALC_mba, CALC_mba_broad_dept_lvl) and number of customers threshold.</p>
    <img src="../assets/images/product-intel-all-product-associations.png" alt="Product Intelligence — All Product Associations" />
  </div>

  <div class="tab-panel" id="tab-brand">
    <p>Brand affinity table showing the top co-purchased brands based on 2024 purchase patterns. For each brand, ranks the most associated brands by purchase frequency (e.g. UGG customers also buy Michael Michael Kors, Wishbone, Browns). Link to full table in Snowflake for the top 100 brands.</p>
    <img src="../assets/images/product-intel-brand-associations.png" alt="Product Intelligence — Brand Associations" />
  </div>

  <div class="tab-panel" id="tab-cross-visual">
    <p>Cross-selling focused page filtered by product department and brand. For each product, shows the most commonly cross-sold items with product images and customer counts. Useful for merchandising teams to identify complementary products within specific categories.</p>
    <img src="../assets/images/product-intel-cross-selling-visual.png" alt="Product Intelligence — Cross Selling (visual)" />
  </div>

  <div class="tab-panel" id="tab-cross-table">
    <p>Detailed table view of the cross-selling data. For each product, lists the top 10 associated products with recommendation rank, purchase percentage, customer base percentage, and full product details (brand, name, department, gender). Filterable by department, brand, and customer base percentage range.</p>
    <img src="../assets/images/product-intel-cross-selling-table.png" alt="Product Intelligence — Cross Selling (table)" />
  </div>

  <div class="tab-panel" id="tab-reco-viewer">
    <p>Customer-specific product recommendation viewer with model version selector and tunable scoring weights (Association Score, Collaborative Score, KNN, MBA). Shows the customer's purchase history alongside scored recommendations with product images, sizes, and composite scores. Designed for testing and validating recommendation model outputs.</p>
    <img src="../assets/images/product-intel-reco-viewer.png" alt="Product Intelligence — Product Reco Viewer" />
  </div>
</div>

## Context

End-to-end product intelligence dashboard combining market basket analysis, brand affinity, cross-selling recommendations, and personalized customer product recommendations. Powered by Snowflake python notebooks that compute association rules and collaborative filtering models. Used by merchandising and CRM teams to understand shopping patterns and validate recommendation engine outputs.

## Data Source

**Snowflake:** Python notebooks (market basket analysis, collaborative filtering, KNN models)
