# Power BI Setup
1. Import `products.csv`, `sales.csv` and `purchases.csv` from the project archive.
2. Verify dates, quantities and prices use correct types.
3. Create a relationship Sales[ProductID] → Products[ProductID].
4. Create revenue measure: `Revenue = SUMX(Sales, Sales[Quantity] * Sales[UnitPrice])`.
5. Add cards for Revenue, Transactions and Low Stock Products.
6. Build monthly revenue and top-product charts; add category slicer.
7. Cross-check visual totals with SQL query outputs and save .pbix.

Native .pbix must be created in Power BI Desktop.
