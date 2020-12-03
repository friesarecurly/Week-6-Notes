## `users`
| column name        | data type | details                        |
|:-------------------|:---------:|:-------------------------------|
| `id`               | integer   | not null, primary key          |
| `username`         | string    | not null, indexed, unique      |
| `password`         | string    | not null                       |
| `created_at`       | datetime  | not null                       |
| `updated_at`       | datetime  | not null                       |
 
## `artists` 
| column name        | data type | details                        |
|:-------------------|:---------:|:-------------------------------|
| `id`               | integer   | not null, primary key          |
| `name`             | string    | not null                       |
| `created_at`       | datetime  | not null                       |
| `updated_at`       | datetime  | not null                       |
 
## `albums`

| column name        | data type | details                        |
|:-------------------|:---------:|:-------------------------------|
| `id`               | integer   | not null, primary key          |
| `name`             | string    | not null                       |
| `year`             | integer   | not null                       |
| `artist_id`        | integer   | not null, indexed              |
| `created_at`       | datetime  | not null                       |
| `updated_at`       | datetime  | not null                       |

## `songs`

| column name        | data type | details                        |
|:-------------------|:---------:|:-------------------------------|
| `id`               | integer   | not null, primary key          |
| `name`             | string    | not null, indexed              |
| `length`           | integer   | not null                       |
| `album_id`         | integer   | not null, indexed              |
| `created_at`       | datetime  | not null                       |
| `updated_at`       | datetime  | not null                       |

## `playlists`

| column name        | data type | details                        |
|:-------------------|:---------:|:-------------------------------|
| `id`               | integer   | not null, primary key          |
| `name`             | string    | not null,                      |
| `user_id`          | integer   | not null, indexed              |
| `created_at`       | datetime  | not null                       |
| `updated_at`       | datetime  | not null                       |

## `playlist_tracks`

| column name        | data type | details                        |
|:-------------------|:---------:|:-------------------------------|
| `id`               | integer   | not null, primary key          |
| `playlist_id`      | integer   | not null, indexed              |
| `song_id`          | integer   | not null, indexed              |
| `created_at`       | datetime  | not null                       |
| `updated_at`       | datetime  | not null                       |

