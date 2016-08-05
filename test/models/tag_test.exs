defmodule Shelve.TagTest do
  use Shelve.ModelCase

  alias Shelve.Tag

  test "changeset with valid attributes" do
    changeset = Tag.changeset(%Tag{}, Tag.valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Tag.changeset(%Tag{}, Tag.invalid_attrs)
    refute changeset.valid?
  end
end
