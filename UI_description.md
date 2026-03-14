# Mobile Application UI Description

## 1. Navigation Structure

The application uses a **bottom navigation bar** to allow quick access to the main features.

Main navigation sections:

1. Home
2. Search
3. Add Listing
4. Messages / Offers
5. Profile

Each section contains multiple screens and actions.

---

## 2. Authentication Screens

### 2.1 Splash Screen

The splash screen appears when the application starts.

Elements:

* Application logo
* Application name
* Loading animation

Purpose:

* Initialize the application
* Check if the user is already logged in

Possible navigation outcomes:

* Redirect to Home screen (if logged in)
* Redirect to Login screen

---

### 2.2 Login Screen

Allows existing users to log into the platform.

UI elements:

* Email input field
* Password input field
* Login button
* “Forgot Password” link
* “Create Account” button

Behavior:

* The system validates credentials
* Successful login redirects the user to the Home screen

---

### 2.3 Registration Screen

Allows new users to create an account.

Required information:

* Full name
* Email address
* Phone number
* Password
* Confirm password

Optional:

* Profile picture

After registration:

* The user account is created
* The user is redirected to the main interface

---

## 3. Home Screen

The Home screen is the **main dashboard of the application**.

Purpose:

* Display featured properties
* Provide quick access to property search
* Highlight recently added listings

UI components:

Header section:

* Greeting message
* Notification icon

Search bar:

* Quick property search
* Shortcut to advanced filters

Featured properties section:

Displays property cards with:

* Property image
* Title
* Location
* Price
* Property type

Recent listings section:

Shows the latest properties added to the platform.

Property card elements:

* Main image
* Price
* Size
* Number of rooms
* Sale or rent label

Interaction:

* Tapping a card opens the **Property Details Screen**

---

## 4. Property Search Screen

The search screen allows users to find properties based on different criteria.

Main UI elements:

Search input:

* Search by location or keyword

Filter options:

* Property type (House, Apartment, Land)
* Listing type (Sale / Rent)
* Minimum price
* Maximum price
* Number of rooms
* Property size

Results section:

Displays properties in a **scrollable list of cards**.

Each property card contains:

* Image
* Title
* Location
* Price
* Listing type

Users can:

* Sort results
* Apply filters
* View property details

---

## 5. Property Details Screen

The property details screen provides **complete information about a selected property**.

Main UI sections:

### Image Gallery

A horizontal image slider displaying property photos.

Features:

* Swipe between images
* Fullscreen image view

---

### Property Information

Displayed information:

* Property title
* Location
* Property type
* Size
* Number of rooms
* Description

---

### Pricing Information

Displays:

* Listing price
* Negotiable status

If renting:

Additional fields:

* Price per day
* Price per month
* Price per year

---

### Owner Information

Displays:

* Owner name
* Contact option (optional)

---

### Action Buttons

Buttons vary depending on listing type.

If property is for sale:

* Make Offer (if negotiable)
* Buy Now (if non-negotiable)

If property is for rent:

* Select rental period
* Book property

---

## 6. Offer / Negotiation Screen

This screen allows buyers and sellers to **negotiate property prices**.

UI elements:

Offer history section:

Displays previous offers with:

* Offered price
* Sender
* Status

Offer input:

Users can enter a price and submit a new offer.

Seller options:

* Accept offer
* Reject offer
* Send counteroffer

Visual indicators:

* Pending offers
* Accepted offers
* Rejected offers

---

## 7. Add Listing Screen

Allows users to publish a property listing.

Form sections:

### Basic Information

Fields:

* Title
* Description
* Property type
* Location

---

### Property Details

Fields:

* Property size
* Number of rooms
* Number of bathrooms

---

### Listing Type

User selects:

* Sell
* Rent

If renting:

Additional fields appear:

* Price per day
* Price per month
* Price per year

---

### Price Settings

Fields:

* Desired price
* Negotiable option (toggle)

The system may display a **recommended price suggestion**.

---

### Upload Images

Users can:

* Take photos
* Upload images from gallery

---

### Ownership Contract Upload

Users must upload a **document proving ownership**.

Supported formats:

* PDF
* Image files

---

### Submit Listing

After submission:

* Listing status becomes **Pending**
* It is sent to a moderator for approval

---

## 8. Messages / Offers Screen

Displays all negotiation conversations.

Sections:

* Active negotiations
* Accepted offers
* Rejected offers

Each item shows:

* Property name
* Offer amount
* Offer status

Users can open a negotiation thread to respond.

---

## 9. My Listings Screen

Displays properties posted by the user.

Each listing card includes:

* Property image
* Title
* Listing type
* Price
* Approval status

Status indicators:

* Pending
* Approved
* Rejected

Users can:

* Edit listing
* Delete listing
* View offers

---

## 10. Rental Booking Screen

This screen appears when renting a property.

UI elements:

Date selection:

* Start date
* End date

Booking summary:

Displays:

* Rental duration
* Price per day
* Total price

Confirmation button:

* Submit rental request

After confirmation:

* Owner receives booking request

---

## 11. Profile Screen

The profile screen allows users to manage their account.

Sections:

User information:

* Profile picture
* Name
* Email
* Phone number

Options:

* Edit profile
* My listings
* My offers
* My transactions
* Logout

---

## 12. Notifications Screen

Displays system alerts such as:

* Offer received
* Offer accepted
* Listing approved
* Listing rejected
* Transaction completed

Notifications appear in chronological order.

---

## 13. Transaction Confirmation Screen

Once the moderator approves a transaction, users see a summary screen.

Information displayed:

* Property name
* Buyer name
* Seller name
* Final price
* Payment method
* Moderator approval

Users can download the **generated contract document**.

---

## 14. UI Design Principles

The mobile UI follows these design principles:

Clarity

* Clear property images
* Easy-to-read pricing

Consistency

* Standard card layout
* Consistent navigation

Responsiveness

* Smooth scrolling
* Fast search results

User focus

* Simple listing process
* Easy negotiation interface
