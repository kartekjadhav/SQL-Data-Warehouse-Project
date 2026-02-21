# Data Warehouse & Analytics Project

Welcome to the **Data Warehouse & Analytics Project** repository! 🚀  
This project showcases an end-to-end data warehousing and analytics solution — from raw data ingestion to generating meaningful business insights. Built as a portfolio project, it reflects industry best practices in data engineering and analytics.

---
## 🏗️ Data Architecture

The architecture follows the **Medallion Architecture** pattern with three distinct layers — **Bronze**, **Silver**, and **Gold**:
![Data Architecture]([docs/data_architecture.png](https://viewer.diagrams.net/?tags=%7B%7D&lightbox=1&highlight=0000ff&edit=_blank&layers=1&nav=1&title=SQL-Data-Warehouse-Project.drawio&dark=auto#R%3Cmxfile%3E%3Cdiagram%20name%3D%22Page-1%22%20id%3D%22cwebuJyi4eusLLMjKDo8%22%3E7Vxbc9o6EP41zLQPYXw3PHLtyUzSpiHTPmaELYxObYnKciD99UfyBbBsEkMscjmFCdhrSZa%2F%2FXa1Wol0zFG0%2BULBanlNfBh2DM3fdMxxxzB0y3D4l5A8ZpKepWeCgCI%2FL7QTzNAfmAu1XJogH8algoyQkKFVWegRjKHHSjJAKVmXiy1IWL7rCgSwIph5IKxKfyKfLfOnsLWd%2FB%2BIgmVxZ13Lr0SgKJwL4iXwyXpPZE465ogSwrKjaDOCoQCvwCWrNz1wddsxCjFrUsG53DxoEH%2F7Zk8uHJNtrse%2Fby5qWslFMXssMKAkwT4UzWgdc7heIgZnK%2BCJq2uudS5bsijkZzo%2F9EG8TMsWJzeAMUhxKjE0Ic1u8ADCJL9BLoCUwc1eJ%2FLn%2BAJJBBl95EWWe1DbTg7seqeXLW2KZgrwc%2FbpRR2Q0yLYtr1Djh%2Fk4B0BpNk6kAuCWW4PhigeM0p%2BbUm4k4xISCiXYIJhHbgzklCPm9ApGNdAvIV0I0FaQGyqgthqHWJ1ROy7ZZTM%2FrmIaL9ZIo4BA1zyk%2FdsSZIYtsbIfhlrt3cuRjof3HtaZ3Of7ptl7YjgOInaI6vsPq2z%2Bc%2Fe%2B2WrZdew1bJLSFqm0bVLUBq2Kij7r0DXBQrDWd46SBjJRQV%2FO4a50ICpgbyxPbmWviqM51eGYze7UqMmJ2R5U6XHcn4npLhwEac9Hghdu6tN2k5xnR8F4ntICeaF8uY42lmL2UVVVmX1y0zQe6qYoLcfQR%2FrubgenfRVwwhbvCXyxCQUjySzJHsp5cIMhVzXZ%2BZCTz8bF15%2FEsD16Dtzx67jwmJheN4BLgQU%2BAiW%2BLBY%2BP2MUwe8iTqefBGz9POyRNcrw4dCorQ%2FlXlTQ7HrnG8o1tuf8LwpLHXN1c4FZaP5DIrSlNkQxKss4bZAG4HWPoIrgjBLu2cPO%2FZYlA5RIAD0eMt8CCh5Np3jNMybHaMo4J0P0Zx%2Fgj8JheKhAoghBfwBplPuGiC9H4YA%2F%2BrGD0FtyH57fZo6qtqw%2Bl2jX9ZHX5O53VemkEbTomfYHC%2FBSlyJNoFI0XbnIEZe1ycen9Vg9kTMUDMmzNP3kxFIO5ZhVlVhlh22Ic1NTV2VFoobvXezmNzeFIOqjx52A2ommlNZwpstlTufRVnK5sB1afO%2FFlVvUZaygaZ4BDWBMo%2BuakD7Nv9X2KWh3T1y5YlgWoSgo9kP%2FjlFoUiQv8A2KlUvhT0vRG%2BLW%2BU30RAWJ6m9tmhp23Wn%2FRjXkUIJSw7LbGWGZjZymmWjypbHtP0ITKvzkQIa5IFwkF%2BIkO%2BLFiuGmS0AGtm3aFY8ttYVRpWuUFqieUyYV0ymlJmalKLWNU2yNcNWpYhGHu9jKqJm%2BOltTaBoxrRlVSiziUZu72Oq4nmbcFzZOyk0ikaZmv%2BrJkw5EFCnh0aJkAI4HzAQM0Jhg3BAzn15vtE7lOcCdn123Hf780OZrnayUE4ZeFue02jKXFGjrEkLwL%2BF0Pd54HuWPKVXxvhGOZY2GJ9new%2Fnh5%2FK%2BZ4LeF2vpgrVYd%2F%2BKnOzNeRbsOaCbP%2FDCTAW7nc%2FjJEchy45DsftKkOx%2FXXkhivxIQSYN2nwfmszBrAPqM%2BnfP5LsK0JEXVbymb3XYmiprptZO2vLDcDd5jECMNYTFBvIfAfW%2BZrg%2BUWlZy1Gs1GFcBan3W4A%2FMQtptvuCLAL9p3QCQ6i%2Bfx6pgmLnj9IRDhpqHdUOJxNiAcHFV9mqS6yDrzgm7c0QR7gAnEuJnzz0sccw42buMFQN5RgOMFoRFgiOB4q7OvhH98GsQXKP58jn7ku%2BWKHdVFJzB8vhunpI9qVqLkfXXyTiV1E2WrUc7ir7m2a67v2TxfgGFuaGl0cTSCeeWvokMhitNOndLADGDE0MnVJ5gib5muPhxVG1L0kMZP3DCSCMfn0ODbc2xu%2F2yOrVEG8KM4tmzMPMq7vCnPMAgCCoOTjVIsAfE59tHV90LxKxIg79Ws8gXQ8ekZFV%2FeEkbguDEpBEym5lHaSv3Zk9UVuRFdq0wU1WVOrUYZ7JoNB09sT6iksg9nvaVs03TqDGpyqLk3qiS%2BQzQHc3DvhSTxu%2FHvkAcPD%2BkNK35r9v1K0Ghy%2B2Nye5LielW92W7X1Uua65nlAUCd%2F2%2BU736NrSQAg%2FCRpc5mekPWYi%2FJ5f0kmkOfj0SHdpSkBYXHujxJN06vqpuyYnSr35fTg66jSjnNcuK%2F4G5FpqyFIafNKPvjGjFGQtIVHqAirJO5VaFeLca%2F9Lo7yMI6mVsV6tVi4qzodVlYJ3Ptao%2Fl2npNbV2qnVKYJCzkQ99o%2B1terVPZfszfU6FU2QVp%2BqDXG1dcUJYK5y%2FZgxXLdFdgDsMbEqN0nDbHc8IYiTrVdTxGVnVWdmAPilGc58zR6uy54hjXsdWlME5%2FsXnpif4M%2BWl2VC4VAW%2FJobrnsxaKxaylNmf%2FzH5sLwNJhGo0mH8yROJTJFf3Dz5nI660Q%2Fs6u70IUYoOtLhf2606hkK0dQw9pzzSFj%2FEaN8tvINdsTOuBG95yE0P%2FCXxxDCaDqbfEz7rO%2FX3wNXMrmPJHtssKcZ2jx9M%2Benud%2FHptb3%2FLmBO%2FgM%3D%3C%2Fdiagram%3E%3C%2Fmxfile%3E))

1. **Bronze Layer**: Raw data ingested directly from source systems (CSV files) into a SQL Server Database — no transformations applied.
2. **Silver Layer**: Data is cleansed, standardized, and normalized to make it analysis-ready.
3. **Gold Layer**: Business-ready data modeled into a star schema, optimized for reporting and analytics.

---
## 📖 Project Overview

This project covers the following areas:

1. **Data Architecture**: Designing a modern data warehouse using the Medallion Architecture approach.
2. **ETL Pipelines**: Building pipelines to extract, transform, and load data from source systems into the warehouse.
3. **Data Modeling**: Creating fact and dimension tables optimized for analytical queries.
4. **Analytics & Reporting**: Writing SQL-based reports to surface actionable business insights.

🎯 This repository is a great resource for anyone looking to demonstrate skills in:
- SQL Development
- Data Architecture
- Data Engineering
- ETL Pipeline Development
- Data Modeling
- Data Analytics

---

## 🛠️ Tools & Resources

All tools listed below are free to use!
- **[Datasets](datasets/):** Project datasets in CSV format.
- **[SQL Server Express](https://www.microsoft.com/en-us/sql-server/sql-server-downloads):** A lightweight SQL Server instance for local development.
- **[SQL Server Management Studio (SSMS)](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16):** GUI tool for managing and querying your database.
- **[Git Repository](https://github.com/):** Version control and collaboration via GitHub.
- **[DrawIO](https://www.drawio.com/):** For designing architecture diagrams, data flows, and models.

---

## 🚀 Project Requirements

### Part 1 — Building the Data Warehouse (Data Engineering)

#### Objective
Build a modern SQL Server data warehouse that consolidates sales data from multiple sources, enabling reliable reporting and data-driven decision-making.

#### Specifications
- **Data Sources**: Two source systems — ERP and CRM — provided as CSV files.
- **Data Quality**: Identify and resolve data quality issues before loading into the warehouse.
- **Integration**: Merge both sources into a unified, analytics-friendly data model.
- **Scope**: Current data only — no historization required.
- **Documentation**: Document the data model clearly for both technical and business audiences.

---

### Part 2 — BI: Analytics & Reporting (Data Analysis)

#### Objective
Develop SQL-based analytics to uncover insights across three key areas:
- **Customer Behavior**
- **Product Performance**
- **Sales Trends**

These insights give stakeholders the metrics they need to make informed strategic decisions.

For full details, see [docs/requirements.md](docs/requirements.md).

---

## 📂 Repository Structure
```
data-warehouse-project/
│
├── datasets/                           # Raw datasets (ERP and CRM CSV files)
│
├── docs/                               # Documentation and architecture diagrams
│   ├── etl.drawio                      # ETL techniques and methods diagram
│   ├── data_architecture.drawio        # Overall project architecture
│   ├── data_catalog.md                 # Dataset catalog with field descriptions and metadata
│   ├── data_flow.drawio                # Data flow diagram
│   ├── data_models.drawio              # Star schema data model
│   ├── naming-conventions.md           # Naming guidelines for tables, columns, and files
│
├── scripts/                            # SQL scripts for ETL and transformations
│   ├── bronze/                         # Raw data extraction and loading
│   ├── silver/                         # Data cleansing and transformation
│   ├── gold/                           # Analytical model creation
│
├── tests/                              # Test and data quality scripts
│
├── README.md                           # Project overview and setup instructions
├── LICENSE                             # Repository license
├── .gitignore                          # Git ignore rules
└── requirements.txt                    # Project dependencies
```
---

## ☕ Let's Connect
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)]([https://www.linkedin.com/in/kartek-jadhav])

## 🛡️ License

This project is licensed under the [MIT License](LICENSE). You're welcome to use, modify, and distribute it with proper attribution.

---

