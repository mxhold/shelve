defmodule Shelve.PostTagTest do
  use Shelve.ModelCase

  alias Shelve.PostTag

  test "changeset with valid attributes" do
    changeset = PostTag.changeset(%PostTag{}, PostTag.valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = PostTag.changeset(%PostTag{}, PostTag.invalid_attrs)
    refute changeset.valid?
  end

  test "foreign key constraints" do
    changeset = PostTag.changeset(%PostTag{}, PostTag.valid_attrs)
    {:error, changeset} = Repo.insert(changeset)
    refute Enum.empty?(changeset.errors)

    post = Repo.insert!(struct(Shelve.Post, Shelve.Post.valid_attrs))
    tag = Repo.insert!(struct(Shelve.Tag, Shelve.Tag.valid_attrs))
    changeset = PostTag.changeset(%PostTag{}, %{post_id: post.id, tag_id: tag.id})
    Repo.insert!(changeset)
  end
end
