# 🚚 Supply Chain Management Dashboard

## 📊 Project Overview
This project analyzes supply chain operations to optimize profitability, supplier performance, and logistics efficiency.  
Using SQL and Power BI, it tracks KPIs like total revenue, profit, defect rates, and lead times.

## ⚙️ Tools and Technologies
- **PostgreSQL:** Data cleaning, transformation, and analysis.
- **Power BI:** Interactive dashboard visualization.
- **Excel:** Initial data organization.

## 🗃️ Data Workflow
1. Data imported into PostgreSQL.
2. Cleaned and transformed using SQL queries.
3. Profit and margin columns computed.
4. Analytical views created for Power BI.
5. Dashboard visualized using dynamic DAX measures.

## 🔍 SQL Highlights
- Created `supply_chain` table.
- Added computed columns (`Profit`, `Profit_Margin`, `Total_Cost`).
- Aggregations for product, supplier, and location-based insights.
- Created `supplier_performance` view summarizing cost, defect rate, and lead time.

## 📈 Power BI Dashboard
**KPIs**
- Total Revenue: ₹577.6K
- Total Profit: ₹572.32K
- Avg Profit Margin: 9,862%
- Avg Lead Time: 17.35 days

**Visuals**
- Revenue by Product Type  
- Lead Time by Supplier  
- Shipping Cost Share by Carrier  
- Supplier Performance Table  
- Profit by Location (Map)  
- Manufacturing Cost vs Defect Rate Scatter Plot

## 💡 Key Insights
- Skincare = highest revenue.
- Supplier 1 = most efficient.
- Carrier B = costliest.
- High-cost manufacturing correlates with low defect rates.

## 🧠 Challenges & Learnings
- Data inconsistency handled via SQL cleaning.
- Gained practical experience with DAX measures.
- Learned to design performance-efficient dashboards.

## 🏁 Conclusion
A complete end-to-end **Supply Chain Analytics Project** combining SQL preprocessing with Power BI visualization to drive operational insights and business improvements.
