defmodule Shelve.PostTest do
  use Shelve.ModelCase

  alias Shelve.Post

  test "changeset with valid attributes" do
    changeset = Post.changeset(%Post{}, Post.valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Post.changeset(%Post{}, Post.invalid_attrs)
    refute changeset.valid?
  end
end
