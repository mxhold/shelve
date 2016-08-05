defmodule Shelve.Repo.Migrations.CreateTags do
  use Ecto.Migration

  def up do
    execute """
CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    """

    execute """
CREATE TABLE tags (
    id integer PRIMARY KEY DEFAULT nextval('tags_id_seq'),
    name text NOT NULL UNIQUE,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    CONSTRAINT name_max_size CHECK (length(name) <= 1000),
    CONSTRAINT name_not_blank CHECK (name <> '')
);
    """

    execute """
ALTER SEQUENCE tags_id_seq OWNED BY tags.id;
    """

    execute """
CREATE SEQUENCE post_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    """

    execute """
CREATE TABLE post_tags (
    id integer PRIMARY KEY DEFAULT nextval('post_tags_id_seq'),
    tag_id integer REFERENCES tags,
    post_id integer REFERENCES posts,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    CONSTRAINT no_duplicate_post_tags UNIQUE (tag_id, post_id)
);
    """

    execute """
ALTER SEQUENCE post_tags_id_seq OWNED BY post_tags.id;
    """
  end
end
