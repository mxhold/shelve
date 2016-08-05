defmodule Shelve.PostTag do
  use Shelve.Web, :model

  schema "post_tags" do
    belongs_to :post, Shelve.Post
    belongs_to :tag, Shelve.Tag

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:post_id, :tag_id])
    |> foreign_key_constraint(:post_id)
    |> foreign_key_constraint(:tag_id)
    |> validate_required([:post_id, :tag_id])
  end

  def valid_attrs do
    %{post_id: 1, tag_id: 1}
  end

  def invalid_attrs do
    %{post_id: nil, tag_id: nil}
  end
end
