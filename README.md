# PUB

> API with Ruby on Rails to study :beer:

## API

| Prefix | Verb | URI Pattern | Controller#Action |
|---|---|---|---|
| api_v1_categories | GET | /api/v1/categories | api/v1/categories#index |
| | POST | /api/v1/categories | api/v1/categories#create |
| api_v1_category | GET | /api/v1/categories/:id | api/v1/categories#show |
| | PATCH | /api/v1/categories/:id | api/v1/categories#update |
| | PUT | /api/v1/categories/:id | api/v1/categories#update |
| | DELETE | /api/v1/categories/:id | api/v1/categories#destroy |
| api_v1_products | GET | /api/v1/products | api/v1/products#index |
| | POST | /api/v1/products | api/v1/products#create |
| api_v1_product | GET | /api/v1/products/:id | api/v1/products#show |
| | PATCH | /api/v1/products/:id | api/v1/products#update |
| | PUT | /api/v1/products/:id | api/v1/products#update |
| | DELETE | /api/v1/products/:id | api/v1/products#destroy |


## Setup

This API use Ruby on Rails.

```bash
# install dependencies
bundle i

# create db
rails db:create
rails db:migrate
rails db:seed

# run serve
rails s
```
