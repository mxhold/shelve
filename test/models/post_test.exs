defmodule Shelve.PostTest do
  use Shelve.ModelCase

  alias Shelve.Post

  @valid_attrs %{title: "some content", url: "some content"}
  @invalid_attrs %{title: "", url: ""}

  test "changeset with valid attributes" do
    changeset = Post.changeset(%Post{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Post.changeset(%Post{}, @invalid_attrs)
    refute changeset.valid?
  end
end
