# Goodnight API

## Overview
- ruby 3.0.0
- Rails 6.1.3
- Database: SQLite 3 (because this is small project, so I choose it)
- Some gems using: Devise, grape, acts_as_follower,...

I use grape to build API structures. Why I choose Grape?

Grape is a “REST-like API framework for Ruby” that is designed to run on Rack or run alongside other Ruby frameworks, such as Rails and Sinatra. When being used alongside other Ruby frameworks, Grape makes it easier to develop RESTful API’s by supplying an easy to use DSL.

I really enjoyed using Grape. Its simplicity made it really easy to understand and use. Grape is an incredibly useful tool to help build clean and efficient RESTful API’s in Ruby. I really enjoyed how clean my code looked and how self explanatory it all was.

## Setup

```
  gem install bundler
  bundle install
  rails db:create
  rails db:migrate
  rails db:seed
```
Then `rails s` to start server

## API

Note some API need `Authorization` access token in Header.

Run `rails c`, and find `authentication_token`. Exam:
```
  User.first.authentication_token
```

### 1. Clock In operation, and return all clocked-in times, ordered by created time.
```
  GET /api/v1/time_trackings/me/my_records
```

### 2. Users can follow and unfollow other users.

Follow Other user:

```
  POST /api/v1/friends/follow/:user_id
```

with `user_id` is user id need follow.

Unfollow Other user:

```
  POST /api/v1/friends/nfollow//:user_id
```

with `user_id` is user id need unfollow.

### 3. See the sleep records over the past week for their friends, ordered by the length of their sleep.

```
  GET /api/v1/time_trackings/me/friend_records
```
