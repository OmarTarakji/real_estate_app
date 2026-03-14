# Real Estate Selling & Renting Platform – System Design

## 1. System Overview

The platform enables users to **buy, sell, or rent properties online** directly from owners. Listings are moderated by moderators to ensure legitimacy. The system also supports **price negotiation and booking for rentals**.

**Tech Stack**

Frontend

* Vite + React (Web UI)
* Flutter (Mobile app)

Backend

* CodeIgniter 4 (REST API)

Database

* PostgreSQL

---

# 2. User Roles

## 1. User

Capabilities:

* Register / Login
* List property for sale or rent
* Upload ownership contract
* Search properties
* Buy property
* Rent property
* Make price offers (if negotiable)
* Accept or reject offers for their own listings

---

## 2. Moderator

Moderators act as **moderators and transaction verifiers**.

Capabilities:

* Approve or reject property listings
* Review ownership contracts
* Manage transactions
* Confirm payment completion
* Generate property transfer contracts

---

## 3. Admin

System owner with full access.

Capabilities:

* Manage users
* Manage moderators
* View all listings
* View transactions
* System statistics

---

# 3. Core Features

## 1. Property Listing

Users can publish their properties.

Required information:

* Title
* Description
* Location
* Property type (house, apartment, land)
* Space (m²)
* Number of rooms
* Number of bathrooms
* Status (new, used)
* Images
* Ownership contract
* Listing type:

  * Sale
  * Rent

Additional rent information:

* Price per day
* Price per month
* Price per year

Price configuration:

* Desired price
* Negotiable (Yes / No)

Listing flow:

```
User submits listing
      ↓
Listing status = Pending
      ↓
Moderator reviews listing
      ↓
Approved / Rejected
```

---

# 4. Buying Flow

## Step 1 – User Finds Property

User searches properties by:

* Location
* Price range
* Property type
* Sale / Rent
* Rooms
* Size

---

## Step 2 – Negotiation Logic

### If price is negotiable

```
Buyer submits offer
      ↓
Seller receives offer
      ↓
Seller options:
    Accept
    Reject
    Counteroffer
```

If accepted:

```
Transaction created
        ↓
Moderator notified
```

---

### If price is NOT negotiable

```
Buyer places order
      ↓
Transaction created
      ↓
Moderator notified
```

---

## Step 3 – Moderator Verification

Moderator actions:

1. Contact buyer and seller
2. Arrange payment (fake online or cash)
3. Verify payment completion

```
Moderator approves transaction
```

---

## Step 4 – Contract Generation

The system generates a **property transfer contract** including:

* Buyer name
* Seller name
* Property information
* Final price
* Date
* Moderator approval

The contract can be exported as **PDF**.

---

# 5. Renting Flow

Similar to buying but with booking.

Steps:

```
User selects property
      ↓
Select rental period
      ↓
Check availability
      ↓
Submit rental request
      ↓
Owner accepts or rejects
      ↓
Moderator verifies payment
      ↓
Rental contract generated
```

Extra fields:

* Start date
* End date
* Total price

---

# 6. Database Design (Important for your project)

### Users Table

```
users
-----
id
name
email
password
role (user, moderator, admin)
phone
created_at
```

---

### Properties Table

```
properties
----------
id
owner_id
title
description
location
space
rooms
property_type
listing_type (sell/rent)
price
negotiable
status (pending, approved, rejected)
created_at
```

---

### Property Images

```
property_images
---------------
id
property_id
image_url
```

---

### Offers (Negotiation)

```
offers
------
id
property_id
buyer_id
seller_id
offer_price
status (pending, accepted, rejected, counter)
created_at
```

---

### Transactions

```
transactions
------------
id
property_id
buyer_id
seller_id
moderator_id
final_price
payment_method
status
created_at
```

---

### Rentals

```
rentals
-------
id
property_id
renter_id
owner_id
start_date
end_date
total_price
status
```

---

# 7. Price Recommendation System

The system suggests a price based on:

* Location
* Property size
* Number of rooms
* Average price of nearby listings

Simple formula example:

```
recommended_price =
(avg_price_per_m2 * property_size)
+ (rooms * room_value)
```

This can be calculated in the backend using **CodeIgniter service logic**.

---
