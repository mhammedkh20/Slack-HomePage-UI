🎯 Overview

This page showcases a smooth interactive UI experience built with #Flutter_Animation + BLoC state management.
The goal is to create dynamic UI reactions to user scrolling, interaction, and category reordering.


The screen uses multiple AnimationController and Tween objects to animate UI elements including:

✅ Header shrink animation on scroll

✅ Dynamic font scaling

✅ Image & icon resizing

✅ Opacity transitions

✅ Search hint color transition

✅ Drag & drop animation for categories

✅ Smooth UI refresh effects



Key animation variables used:

fontSizeStatemet, fontSizeTitle, sizeImages, sizeIconSearch,
paddingRow, opacityHeader, colorHintSearch

Each animation is connected to scroll events and UI state changes to provide a fluid, responsive feel.



🧠 State Management (BLoC)

The page uses a custom HomeBloc to manage UI actions such as:

Expand/collapse sections (Mentions, Unread, Channels, Messages)

Reordering category items with drag-and-drop

Notifying UI with individual state updates



🚀 Result

This demo implements:

Smooth scroll-driven animations

Responsive interactive UI

Clean BLoC-based architecture

Flutter best practices for performance & structure

Ideal as a template for building animated dashboards, social apps, or modern landing pages.


📸 Preview


<img width="400" alt="Image" src="https://github.com/user-attachments/assets/8f0f6d2b-5be7-41fc-bf5d-9817ed24b2c1" />
<img width="400" alt="Image" src="https://github.com/user-attachments/assets/2b229c48-851c-4a7c-beff-d1d78d3218f7" />
<img width="400" alt="Image" src="https://github.com/user-attachments/assets/9d70e4a6-1371-442c-a03a-1155f5a93c25" />
<img width="400" alt="Image" src="https://github.com/user-attachments/assets/8d5b1730-aefb-4640-8977-24d7a3422c79" />


📦 Technologies

Tool	Purpose

Flutter Animation	Motion & transitions

Tween / CurvedAnimation	Element styling animation

BLoC	UI state changes

ScrollController	Scroll-based triggers
