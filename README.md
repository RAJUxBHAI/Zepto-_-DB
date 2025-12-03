# **DBMS-Project-(341066-341090-341077)**

## **DBMS Project as part of Term – 2 for ETB Subject**

# **QComm Enterprise DB (Quick Commerce Database System)**

---

## **Project Overview**

QComm Enterprise is a high-fidelity relational database system designed to model an end-to-end quick commerce platform similar to Zepto, Blinkit, Swiggy Instamart, etc.
The schema implements real-world complexities of instant-delivery ecosystems, incorporating:

* Multi-city user onboarding
* Detailed address management with geolocation
* Categorized product catalogs with brands, taxes & variants
* Warehouse-based inventory with batch-level tracking
* Rider assignment, shifts & live logistics
* Coupon engine & advanced order computation
* User wallets, transactions, and financial flows
* Customer support, complaints & product reviews

This project demonstrates a large-scale, modular DBMS design applying concepts such as **normalization, foreign key enforcement, data integrity, scalability**, and **realistic enterprise schema structuring**.

---

## **Database Design Philosophy**

The goal behind this schema is to simulate the *thinking style* and architecture used by actual commerce companies:

* **Modular, scalable tables** grouped by business domains
* **Batch-level inventory** to track expiry, manufacturing & aisle positions
* **Variant-based product catalog** reflecting real SKU-based operations
* **Location-aware fulfillment operations** (cities → warehouses → riders)
* **Flexible order lifecycle** to reflect modern delivery pipelines
* **Transactional finance tables** for wallet operations & refunds
* **Support system integration** for post-order complaint resolution

This makes the project ideal not only academically but also as a blueprint for real microservice-based deployments.

---

## **Database Schema**

The schema is divided into **six enterprise modules**, covering over **30 interconnected tables**.
Each module represents a real business domain within a quick-commerce operation.

---

### **1. Users & Geography**

This module forms the foundation of the system—mapping **cities**, **users**, their **addresses**, and **wallets**.

* **Cities:**
  Core geographical units containing city & state metadata, used by warehouses and user addresses.

* **Users:**
  Customer profiles including contact information, prime membership, and auto-generated timestamps.

* **User Addresses:**
  Each user can store multiple addresses tied to specific cities, including geolocation coordinates.

* **User Wallets:**
  Built-in wallet system for cashback, refunds, and digital transactions.

This module ensures accurate customer onboarding, location-based delivery, and financial identity management.


---

### **2. Catalog & Products**

The marketplace-facing module that organizes the entire product ecosystem.

* **Categories:**
  Nested structure for browsing (e.g., Essentials, Snacks, Pharma).

* **Brands:**
  Brand catalog with optional logo URLs.

* **Taxes:**
  GST slabs and sin-tax configurations applied to products.

* **Products:**
  Core items with category, brand, descriptions & tax mappings.

* **Product Variants:**
  SKU-level details such as weight/volume, MRP, selling price, and purchase limits.

This module models a modern, scalable catalog capable of supporting thousands of searchable SKUs.



---

### **3. Warehousing & Inventory Management**

A sophisticated module that ensures product availability across cities.

* **Warehouses:**
  Fulfillment centers mapped to cities with geo-coordinates and delivery radii.

* **Suppliers:**
  Vendors from whom the warehouse procures goods.

* **Purchase Orders:**
  Tracks procurement operations: Created → Approved → Received.

* **Inventory Batches:**
  This is where realism kicks in—batch-level stock, expiry dates, aisle & rack-level storage.

This module allows:
✔ Expiry management
✔ FIFO stock deduction
✔ Warehouse-specific stock levels
✔ Large-scale procurement operations

(Industry-inspired inventory design.)



---

### **4. Logistics & Rider Workforce**

The operational backbone ensuring last-mile delivery.

* **Delivery Partners (Riders):**
  Rider profiles, vehicles, licenses, and assigned warehouses.

* **Shifts:**
  Time-based slots for rush hours, evening peaks, or midnight deliveries.

* **Rider Shifts:**
  Daily attendance, login/logout tracking, and rider productivity.

This mimics how quick-commerce systems plan rider availability during peak demand hours.



---

### **5. Orders & Order Lifecycle**

A deeply structured ordering pipeline with applied discounts, fees, and SKU-level linkages.

* **Coupons:**
  Full coupon engine with percentage/flat discounting, min/max limits & expiry.

* **Orders:**
  Captures user, warehouse, rider, time window, all fees, and delivery status transitions.

* **Order Items:**
  Every item ties a *variant* to a *batch*, storing the exact price at the time of purchase.

This module mirrors modern commerce apps—dynamic billing, discounts, and batch-sourced fulfillment.



---

### **6. Finance & Support**

Handles payments, refunds, user escalation, and feedback.

* **Wallet Transactions:**
  Every credit/debit entry tied to an order or wallet action.

* **Support Tickets:**
  Problem categories & resolution statuses—mirroring customer support desks.

* **Product Reviews:**
  User feedback on ratings and comments with timestamps.

These tables close the loop between order completion and post-purchase customer engagement.



---

## **Summary**

The QComm Enterprise Database provides:

* Enterprise-level modular schema
* Highly realistic modeling of real quick-commerce systems
* Strong transactional integrity
* Inventory + logistics + finance + support integration
* Scalable structure suitable for academic + industry demonstrations

This schema is ideal for demonstrating advanced DBMS concepts such as **normalization, indexing, referential integrity, role-based modularization, and real-time order workflows**.

---

## **Group 15 — Member Details**

* **341066 – Ramanjan Dutta**
* **341090 – Nandini Singh**
* **341077 – Mohammed Sarshad**

---

