# shelve

## Use cases

- Create a post
  - cURL
  - HTML
  - JS Bookmarklet
- View all posts
  - cURL
  - HTML
  - csv
  - public, read-only SQL views
  - RSS?

## Endpoints

### POST /posts
### GET /posts
### GET /posts/:id
### PUT /posts/:id
### DELETE /posts/:id

### POST /users
### GET /users
### GET /users/:id
### PUT /users/:id
### DELETE /users/:id

### POST /tags
### GET /tags
### GET /tags/:id
### PUT /tags/:id
### DELETE /tags/:id

## Schema

### posts

- URL (text)
- slug (text)
- title (text)
- description (text)

### taggings

- post_id
- tag_id

### tags

- name (text)
- slug (text)

### users

- name
- email
- password_hash
- password_salt

## Getting started

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
