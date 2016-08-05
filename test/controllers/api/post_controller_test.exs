defmodule Shelve.API.PostControllerTest do
  use Shelve.ConnCase

  alias Shelve.Post

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, api_post_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    post = Repo.insert! struct(Post, Post.valid_attrs)
    conn = get conn, api_post_path(conn, :show, post)
    assert json_response(conn, 200)["data"] == %{"id" => post.id,
      "url" => post.url,
      "title" => post.title}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, api_post_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, api_post_path(conn, :create), post: Post.valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Post, Post.valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, api_post_path(conn, :create), post: Post.invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    post = Repo.insert! struct(Post, Post.valid_attrs)
    conn = patch conn, api_post_path(conn, :update, post), post: Post.valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Post, Post.valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    post = Repo.insert! struct(Post, Post.valid_attrs)
    conn = patch conn, api_post_path(conn, :update, post), post: Post.invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    post = Repo.insert! struct(Post, Post.valid_attrs)
    conn = delete conn, api_post_path(conn, :delete, post)
    assert response(conn, 204)
    refute Repo.get(Post, post.id)
  end
end
