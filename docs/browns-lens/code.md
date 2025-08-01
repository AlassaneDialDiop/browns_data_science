# [BrownsLens V5 - Source Code](../)

<div class="project-header">
  <div class="project-meta">
    <div><strong>Version:</strong> V5.0 - Snowflake Native</div>
    <div><strong>Status:</strong> ✅ Production Ready</div>
    <div><strong>Updated:</strong> 2025-08-01</div>
    <div><strong>Back to:</strong> <a href="./">Main Documentation</a></div>
  </div>
</div>

## 📋 Complete Working Code

Copy and paste this code directly into your Snowflake Streamlit application. This is the complete V5 implementation.

### `app.py` - Complete Application

```python
import streamlit as st
from PIL import Image
import time
import os
import logging
from io import BytesIO
import numpy as np
import tempfile
import uuid
from datetime import datetime
from typing import List, Dict, Optional

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Import Snowflake session (only available when running in Snowflake)
from snowflake.snowpark.context import get_active_session

# Page configuration
st.set_page_config(
    page_title="BrownsLens V5 - Snowflake Native Only",
    page_icon="🔍",
    layout="wide",
    initial_sidebar_state="collapsed"
)

# Clean black and white theme CSS with Montserrat font
st.markdown("""
<style>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap');

/* Hide Streamlit branding */
#MainMenu {visibility: hidden;}
footer {visibility: hidden;}

/* Set white background with Montserrat font */
.stApp {
    background-color: white !important;
    font-family: 'Montserrat', sans-serif !important;
}

/* Make text black with Montserrat font, but exclude button elements */
.stMarkdown:not(.stButton .stMarkdown), 
.stText, 
p:not(.stButton p), 
h1, h2, h3, h4, h5, h6, 
div:not(.stButton div):not([data-testid="stCameraInputButton"]), 
span:not(.stButton span),
.stInfo,
.element-container:not(:has(.stButton)) {
    color: black !important;
    font-family: 'Montserrat', sans-serif !important;
}

/* Smaller title aligned to right */
h1 {
    text-align: right !important;
    font-weight: 700 !important;
    font-size: 1.5rem !important;
    margin-bottom: 1rem !important;
}

/* Style buttons */
.stButton > button {
    background-color: black !important;
    color: white !important;
    border: none !important;
    padding: 0.5rem 2rem !important;
    font-family: 'Montserrat', sans-serif !important;
    font-weight: 500 !important;
    font-size: 1rem !important;
    border-radius: 8px !important;
    cursor: pointer !important;
    transition: background-color 0.3s !important;
}

.stButton > button:hover {
    background-color: #333 !important;
}

/* Style camera input */
.stCameraInput > div {
    border: 2px solid black !important;
    border-radius: 8px !important;
    padding: 0.5rem !important;
}

/* Style camera input button specifically */
[data-testid="stCameraInputButton"] button,
.stCameraInput button {
    background-color: black !important;
    color: white !important;
    border: none !important;
    padding: 0.5rem 1rem !important;
    font-family: 'Montserrat', sans-serif !important;
    font-weight: 500 !important;
    border-radius: 8px !important;
    cursor: pointer !important;
}

[data-testid="stCameraInputButton"] button:hover,
.stCameraInput button:hover {
    background-color: #333 !important;
}

/* Style the clear photo button text specifically */
[data-testid="stCameraInputClearButton"],
.stCameraInput button[aria-label*="Clear"],
.stCameraInput button[title*="Clear"],
.stCameraInput [kind="secondary"] {
    color: white !important;
}

/* Ensure all text within camera input buttons is white */
.stCameraInput button span,
.stCameraInput button div,
.stCameraInput button * {
    color: white !important;
}

/* Container styling */
.main > div {
    max-width: 1200px;
    margin: 0 auto;
}

/* Results card styling */
[data-testid="stHorizontalBlock"] {
    background-color: #f8f8f8;
    padding: 1rem;
    border-radius: 8px;
    margin-bottom: 1rem;
}

/* Make images in results have rounded corners */
.stImage {
    border-radius: 8px;
    overflow: hidden;
}
</style>
""", unsafe_allow_html=True)

# Snowflake Database Class - Inline for single-file deployment
class SnowflakeDB:
    def __init__(self):
        """Initialize Snowflake connection using native session only"""
        self.session = get_active_session()
        logger.info("Using Snowflake native session")
    
    def _generate_unique_filename(self, prefix: str = "query") -> str:
        """Generate a unique filename using timestamp and UUID"""
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        unique_id = str(uuid.uuid4())[:8]
        return f"{prefix}_{timestamp}_{unique_id}.png"
    
    def search_similar_shoes_with_image(self, image: Image.Image, threshold: float = 0.13, limit: int = 5) -> List[Dict]:
        """Search for similar shoes using AI_EMBED - Snowflake native only"""
        logger.info(f"Starting shoe search with threshold={threshold}, limit={limit}")
        
        try:
            # Step 1: Upload image and get AI_EMBED embedding
            stage_path = self._upload_image_to_stage(image)
            logger.info(f"Uploaded image to stage: {stage_path}")
            
            embedding_result = self._get_embedding_from_stage(stage_path)
            logger.info("Generated embedding with AI_EMBED")
            
            # Step 2: Format embedding and perform vector search
            embedding_list = self._convert_vector_to_list(embedding_result)
            embedding_sql = self._format_embedding_for_sql(embedding_list)
            logger.info(f"Formatted embedding: {len(embedding_list)} dimensions")
            
            results = self._execute_similarity_search_v2(embedding_sql, threshold, limit)
            logger.info(f"Found {len(results)} similar shoes")
            
            # Step 3: Cleanup
            self._cleanup_stage_file(stage_path)
            
            return results
            
        except Exception as e:
            logger.error(f"Search error: {str(e)}")
            st.error(f"Search error: {str(e)}")
            return []
    
    def _upload_image_to_stage(self, image: Image.Image) -> str:
        """Upload image to Snowflake stage - Snowflake native only"""
        unique_filename = self._generate_unique_filename()
        stage_name = "PROD_SANDBOX.ADIOP.BROWNSLENS_STAGE"
        stage_path = f"temp_images/{unique_filename}"
        
        # Save image with intended filename directly to temp directory
        tmp_dir = tempfile.gettempdir()
        intended_path = os.path.join(tmp_dir, unique_filename)
        image.save(intended_path, format='PNG')
        
        try:
            # Upload using Snowpark session file.put method (native Snowflake approach)
            self.session.file.put(
                local_file_name=intended_path,
                stage_location=f"@{stage_name}/temp_images/",
                auto_compress=False,
                overwrite=True
            )
            return stage_path
        finally:
            # Clean up the temp file
            if os.path.exists(intended_path):
                os.unlink(intended_path)
    
    def _get_embedding_from_stage(self, stage_path: str):
        """Get AI_EMBED embedding from staged file - Snowflake native only"""
        embedding_query = f"""
        SELECT AI_EMBED('voyage-multimodal-3', 
                       TO_FILE('@PROD_SANDBOX.ADIOP.BROWNSLENS_STAGE', '{stage_path}')) AS embedding
        """
        
        result = self.session.sql(embedding_query).collect()
        return result[0]['EMBEDDING']
    
    def _convert_vector_to_list(self, embedding_result):
        """Convert Snowflake VECTOR to Python list - Snowflake native only"""
        if hasattr(embedding_result, 'tolist'):
            return embedding_result.tolist()
        elif isinstance(embedding_result, (list, tuple)):
            return list(embedding_result)
        else:
            # Convert Snowflake VECTOR to ARRAY first
            array_query = "SELECT %s::ARRAY AS arr"
            result = self.session.sql(array_query, (embedding_result,)).collect()
            return result[0]['ARR']
    
    def _format_embedding_for_sql(self, embedding_list: list) -> str:
        """Format embedding list as SQL VECTOR literal"""
        embedding_values = ','.join([str(float(x)) for x in embedding_list])
        return f"[{embedding_values}]::VECTOR(FLOAT, 1024)"
    
    def _execute_similarity_search_v2(self, embedding_sql: str, threshold: float, limit: int) -> List[Dict]:
        """Execute similarity search with multi-face scoring - Snowflake native only"""
        search_query = f"""
        WITH
        query_vec AS (
            SELECT {embedding_sql} AS embedding
        ),
        face_scores AS (
            SELECT
            e.SHOE_ID,
            e.PRODUCT_NAME,
            e.BRAND,
            e.DEPARTMENT,
            e.IMAGE_URL,
            e.FACE_NUM,
            VECTOR_COSINE_SIMILARITY(e.IMAGE_EMBEDDING, q.embedding) AS sim
            FROM PROD_SANDBOX.ADIOP.SHOE_IMAGE_EMBEDDINGS e
            CROSS JOIN query_vec q
            WHERE e.FACE_NUM IN (1,2,3,4)
        ),
        agg AS (
            SELECT
            SHOE_ID,
            MAX(PRODUCT_NAME) AS PRODUCT_NAME,
            MAX(BRAND) AS BRAND,
            MAX(DEPARTMENT) AS DEPARTMENT,
            MAX(CASE WHEN FACE_NUM = 1 THEN IMAGE_URL END) AS IMAGE_URL_FACE1,
            COUNT(*) AS face_cnt,
            SUM(POWER(sim, 2)) AS sim_sq_sum
            FROM face_scores
            GROUP BY SHOE_ID
        )
        SELECT
        SHOE_ID,
        PRODUCT_NAME,
        BRAND,
        DEPARTMENT,
        COALESCE(IMAGE_URL_FACE1, '') AS IMAGE_URL,
        sim_sq_sum / face_cnt AS similarity_score
        FROM agg
        WHERE (sim_sq_sum / face_cnt) >= {threshold}
        ORDER BY similarity_score DESC
        LIMIT {limit}
        """

        # Fetch rows using Snowpark session
        rows = self.session.sql(search_query).collect()

        # Convert to dict format
        return [
            {
                'shoe_id': row['SHOE_ID'],
                'product_name': row['PRODUCT_NAME'],
                'brand': row['BRAND'],
                'department': row['DEPARTMENT'],
                'image_url': row['IMAGE_URL'],
                'similarity_score': float(row['SIMILARITY_SCORE'])
            }
            for row in rows
        ]
    
    def _cleanup_stage_file(self, stage_path: str):
        """Clean up staged file after processing - Snowflake native only"""
        try:
            self.session.sql(f"REMOVE @PROD_SANDBOX.ADIOP.BROWNSLENS_STAGE/{stage_path}").collect()
            logger.info(f"Cleaned up stage file: {stage_path}")
        except Exception as e:
            logger.warning(f"Cleanup failed for {stage_path}: {e}")
            # Don't fail the main operation if cleanup fails

# Initialize session state
if 'db' not in st.session_state:
    st.session_state.db = None
if 'search_results' not in st.session_state:
    st.session_state.search_results = None
if 'processed_image' not in st.session_state:
    st.session_state.processed_image = None
if 'processing' not in st.session_state:
    st.session_state.processing = False

# Initialize database connection
@st.cache_resource
def init_snowflake():
    """Initialize Snowflake connection - native session only"""
    try:
        return SnowflakeDB()
    except Exception as e:
        logger.error(f"Failed to initialize database: {e}")
        st.error(f"Failed to initialize database: {e}")
        return None

# Load Snowflake connection
with st.spinner("Connecting to database..."):
    if st.session_state.db is None:
        st.session_state.db = init_snowflake()

# Title
st.markdown("# 🔍 BrownsLens")

if not st.session_state.db:
    st.error("⚠️ Database connection failed.")
    st.stop()

# Create two-column layout with camera taking 1/3 width
col1, col2 = st.columns([1, 2])

with col1:
    st.markdown("## 📹 Camera")
    
    # Track if we need to process a new image
    if 'last_processed_image' not in st.session_state:
        st.session_state.last_processed_image = None
    
    # Camera input
    camera_image = st.camera_input("Take a photo of a shoe", key="camera")
    
    # Auto-process when a new image is captured
    if camera_image is not None:
        # Check if this is a new image
        current_image_id = id(camera_image)
        
        if st.session_state.last_processed_image != current_image_id and not st.session_state.processing:
            st.session_state.processing = True
            st.session_state.last_processed_image = current_image_id
            st.session_state.processed_image = Image.open(camera_image)
            
            with st.spinner("Processing image..."):
                try:
                    # Search for similar shoes
                    results = st.session_state.db.search_similar_shoes_with_image(
                        st.session_state.processed_image,
                        threshold=0.13,
                        limit=5
                    )
                    
                    if results:
                        st.session_state.search_results = results
                        st.session_state.search_message = ("success", f"Found {len(results)} similar shoes!")
                    else:
                        st.session_state.search_message = ("warning", "No similar shoes found")
                        st.session_state.search_results = []
                        
                except Exception as e:
                    st.error(f"Error processing image: {str(e)}")
                    logger.error(f"Search error: {str(e)}")
                    st.session_state.search_results = None
                finally:
                    st.session_state.processing = False
        
    # Create columns for buttons
    button_col1, button_col2 = st.columns(2)
    
    with button_col1:
        # Clear results button
        if st.button("🔄 Clear Results", key="clear_results", use_container_width=True):
            st.session_state.search_results = None
            st.session_state.processed_image = None
            st.session_state.last_processed_image = None
            st.session_state.search_message = None
            st.rerun()
    
    with button_col2:
        # Optional manual search button (in case auto-search fails)
        if camera_image is not None:
            if st.button("🔍 Retry Search", use_container_width=True, disabled=st.session_state.processing):
                st.session_state.last_processed_image = None  # Force reprocessing
                st.rerun()
    
    # Display search message below buttons
    if hasattr(st.session_state, 'search_message') and st.session_state.search_message:
        msg_type, msg_text = st.session_state.search_message
        if msg_type == "success":
            st.success(msg_text)
        elif msg_type == "warning":
            st.warning(msg_text)

with col2:
    st.markdown("## Results")
    
    # Display results
    if st.session_state.search_results:
        for idx, shoe in enumerate(st.session_state.search_results):
            with st.container():
                img_col, info_col = st.columns([1, 3])
                
                with img_col:
                    if shoe.get('image_url'):
                        st.image(shoe['image_url'], use_container_width=True)
                    else:
                        st.info("No image")
                
                with info_col:
                    st.markdown(f"### {shoe.get('product_name', 'Unknown Product')}")
                    st.markdown(f"**Brand:** {shoe.get('brand', 'Unknown')}")
                    st.markdown(f"**Department:** {shoe.get('department', 'N/A')} - {shoe.get('gender', 'N/A')}")
                    st.markdown(f"**Score:** {shoe.get('similarity_score', 0):.1%}")
                    
                    # Display classes
                    if shoe.get('class_name') or shoe.get('subclass_name'):
                        st.markdown(f"**Category:** {shoe.get('class_name', 'N/A')} / {shoe.get('subclass_name', 'N/A')}")
                    
                    st.markdown(f"**ID:** {shoe.get('shoe_id', 'N/A')}")
                
                st.divider()
    else:
        if st.session_state.processed_image is not None:
            st.info("Processing image... Results will appear here")
        else:
            st.info("Take a photo and click 'Search Similar Shoes' to see results")

# Footer
st.markdown("---")
st.markdown("""
<div style="text-align: center; color: #666; font-size: 0.4rem;">
    BrownsLens V5 - Optimized for Snowflake Streamlit<br>
    Using AI_EMBED with voyage-multimodal-3
</div>
""", unsafe_allow_html=True)
```

### `environment.yml` - Dependencies

```yaml
name: brownslens-v5
channels:
  - snowflake
dependencies:
  - streamlit
  - pillow
  - numpy
```

## 🚀 Deployment Instructions

### 1. Prerequisites
- Snowflake account with Streamlit capability
- Access to `PROD_SANDBOX.ADIOP` schema
- `BROWNSLENS_STAGE` stage configured
- AI_EMBED function available

### 2. Quick Deploy
1. Copy the `app.py` code above
2. Create `environment.yml` with the dependencies listed
3. Deploy to Snowflake Streamlit via Snowsight or SnowSQL
4. Test camera functionality

### 3. Database Setup (if needed)
```sql
-- Create stage for temporary images
CREATE STAGE IF NOT EXISTS PROD_SANDBOX.ADIOP.BROWNSLENS_STAGE;

-- Verify AI_EMBED is available
SELECT AI_EMBED('voyage-multimodal-3', 'test') AS test_embedding;
```

## 🛠️ Key Features & Fixes

### ✅ Working Features
- **Camera Input**: Uses `st.camera_input` (available since March 2025)
- **Auto-search**: Automatically processes photos when taken
- **File Upload Fix**: Uses `session.file.put()` instead of SQL PUT command
- **Multi-face Scoring**: Averages similarity across multiple product angles
- **Clean UI**: Black/white theme with Montserrat font

### 🔧 Critical Fixes Included
- **PUT_FILES Error**: Fixed with `session.file.put()` method
- **Vector Conversion**: Proper VECTOR to ARRAY conversion
- **File Cleanup**: Automatic cleanup of staged files
- **Error Handling**: Comprehensive error catching and logging

## 🔍 Troubleshooting

### Common Issues

**"Unsupported statement type 'PUT_FILES'"**
- **Fixed in V5**: Using `session.file.put()` instead of SQL PUT
- This was the main blocking issue - now resolved

**Camera not working**
- Check if `st.camera_input` is available in your Snowflake version
- Contact Snowflake support if camera input is blocked by organization policy

**No search results**
- Verify `BROWNSLENS_STAGE` exists and has proper permissions
- Check that `SHOE_IMAGE_EMBEDDINGS` table is populated
- Adjust threshold value (try 0.10 instead of 0.13)

**Database connection failed**
- Ensure you're running in Snowflake Streamlit environment
- `get_active_session()` only works within Snowflake

## 📞 Support

For issues with this code:
1. Check troubleshooting section above
2. Verify all prerequisites are met
3. Contact data science team for schema/permissions issues
4. This code was last tested on Snowflake version 9.21.0

---

*Generated: 2025-08-01* | **[Back to Main Documentation](./)** | **[Live Demo](https://app.snowflake.com/browns/prod/#/streamlit-apps/PROD_SANDBOX.ADIOP.NVX6HS9JXW6RG993?ref=snowsight_shared)**