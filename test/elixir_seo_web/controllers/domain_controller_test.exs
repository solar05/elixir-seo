defmodule ElixirSeoWeb.DomainControllerTest do
  use ElixirSeoWeb.ConnCase

  alias ElixirSeo.Domains

  @create_attrs %{
    content: "somecontent",
    header: "some header",
    length: 42,
    name: "some name",
    state: "created"
  }
  @update_attrs %{
    content: "someupdatedcontent",
    header: "some updated header",
    length: 43,
    name: "some updated name",
    state: "created"
  }
  @invalid_attrs %{content: nil, header: nil, length: nil, name: "", state: nil}

  def fixture(:domain) do
    {:ok, domain} = Domains.create_domain(@create_attrs)
    domain
  end

  describe "index" do
    test "lists all domains", %{conn: conn} do
      conn = get(conn, Routes.domain_path(conn, :index))
      assert html_response(conn, 200)
    end
  end

  describe "new domain" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.domain_path(conn, :new))
      assert html_response(conn, 200)
    end
  end

  describe "create domain" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.domain_path(conn, :create), domain: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.domain_path(conn, :show, id)

      conn = get(conn, Routes.domain_path(conn, :show, id))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.domain_path(conn, :create), domain: @invalid_attrs)
      assert html_response(conn, 302)
    end
  end

  defp create_domain(_) do
    domain = fixture(:domain)
    %{domain: domain}
  end
end
