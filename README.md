Original App Design Project - README Template
===

# Forkly

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Milestone GIFs](#MilestoneGIFS)
5. [Schema](#Schema)

## Overview

### Description

Our iOS application leverages the Spoonacular API to enable users to search for recipes. It features a streamlined UI for browsing recipes and a local storage mechanism for saving favorites. Built using Swift and SwiftUI, the app demonstrates API integration, and data persistence

### 🔁 Project Evolution

This repo is a rewrite of our original app [Original Repo](https://github.com/COP4655-Group3/RecipeApp), where the first milestones and early development happened. 

### App Evaluation

[Evaluation of your app across the following attributes]
- **Category:** Food & Drink
- **Mobile:** Mobile only
- **Story:**  Our app is the guide that answers that question. It offers inspiration, options based on taste or time, and something new to try — it’s like a digital cookbook that never stops growing.
- **Market:** Users who are into cooking and baking and Anyone who loves to cook but does not know where to start.
- **Habit:** Easily works for daily use or a few times a week when you have time to cook.
- **Scope:** Broadly covering recipes by type but narrow as it only covers recipes. 

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

For our app, we identified the following "must-have" features which a user needs to be able to perform for the app to work:

** Search for Recipes **
Story: As a user, I want to search for recipes based on a keyword (e.g., “chicken”, “pasta”) so that I can find meals I want to cook.

** View Recipe Details **
Story: As a user, I want to tap on a recipe and view all the details (image, summary, instructions) so I know how to make it.

** Save and Access Favorite Recipes **
Story: As a user, I want to save recipes to a favorites list and view them later so I don’t lose the meals I liked.

* User can search for a new recipe
* User can see multiple recipes and select the specific one that they want
* User can see a step-by-step breakdown of the steps to follow
* User can favorite recipes to reference later
* User can see the recipes they have favorited
* User can see their favorited recipes across multiple sessions

**Optional Nice-to-have Stories**


** Filter Recipes by dietary preference **

** Add ingredients to a shopping list **

** Allow users to create their own recipes **
* User can log in to a personalized view and have their data stored in a server
* User can filter recipes based on cuisine, diets, etc...
* User can make a shopping list

### 2. Screen Archetypes

- [ ] **Home Screen**
- [ ] **Search Screen**
* User can search for a new recipe
* User can see multiple recipes and select the specific one that they want
* User can favorite recipes to reference later
- [ ] **Recipe Details Screen**
* User can see a step-by-step breakdown of the steps to follow
- [ ] **Favorite Recipes Screen**
* User can see the recipes they have favorited
* User can see their favorited recipes across multiple sessions

### 3. Navigation

**Tab Navigation** (Tab to Screen)


- [ ] [Home screen]
- [ ] [Recipe Search screen]
- [ ] [Recipe Detail View screen]
- [ ] [Favorites Screen]


**Flow Navigation** (Screen to Screen)

- [ ] [**Home Screen**]
  * Leads to [**Recipe Search Screen**]
- [ ] [**Recipe Search Screen**]
  * Leads to [**Recipe Detail Screen**]
- [ ] [**Recipe Detail Screen**]
  * Leads to [**Favorites Screen**]
- [ ] [**Favorites Screen**]
  * Leads to [**Recipe Detail Screen**]  


## Wireframes

![](wireframesketch.jpg)

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Milestone 1 GIF

<div>
    <a href="https://www.loom.com/share/73016fdd0f2047fe934aac0b0504d881">
      <p>Loom | Free Screen & Video Recording Software | Loom - 13 April 2025 - Watch Video</p>
    </a>
    <a href="https://www.loom.com/share/73016fdd0f2047fe934aac0b0504d881">
      <img style="max-width:300px;" src="https://cdn.loom.com/sessions/thumbnails/73016fdd0f2047fe934aac0b0504d881-de2607e400108dde-full-play.gif">
    </a>
  </div>


### Models

[Model Name, e.g., User]
| Property | Type   | Description                                  |
|----------|--------|----------------------------------------------|
| username | String | unique id for the user post (default field)   |
| password | String | user's password for login authentication      |
| ...      | ...    | ...                          


### Networking

- [List of network requests by screen]
- [Example: `[GET] /users` - to retrieve user data]
- ...
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
