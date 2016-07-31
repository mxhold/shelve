defmodule Shelve.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def up do
    execute """
CREATE SEQUENCE posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    """

    execute """
CREATE TABLE posts (
    id integer PRIMARY KEY DEFAULT nextval('posts_id_seq'),
    url text NOT NULL,
    title text NOT NULL,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    CONSTRAINT title_max_size CHECK (length(title) <= 1000),
    CONSTRAINT title_not_blank CHECK (title <> ''),
    CONSTRAINT url_max_size CHECK (length(url) <= 100000),
    CONSTRAINT url_not_blank CHECK (url <> '')
);
    """

    execute """
ALTER SEQUENCE posts_id_seq OWNED BY posts.id;
    """
  end
end
