defmodule ElixirSeo.DomainsTest do
  use ElixirSeo.DataCase

  alias ElixirSeo.Domains

  describe "domains" do
    alias ElixirSeo.Domains.Domain

    @valid_attrs %{content: "some content", header: "some header", length: 42, name: "some name", state: "some state"}
    @update_attrs %{content: "some updated content", header: "some updated header", length: 43, name: "some updated name", state: "some updated state"}
    @invalid_attrs %{content: nil, header: nil, length: nil, name: nil, state: nil}

    def domain_fixture(attrs \\ %{}) do
      {:ok, domain} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Domains.create_domain()

      domain
    end

    test "list_domains/0 returns all domains" do
      domain = domain_fixture()
      assert Domains.list_domains() == [domain]
    end

    test "get_domain!/1 returns the domain with given id" do
      domain = domain_fixture()
      assert Domains.get_domain!(domain.id) == domain
    end

    test "create_domain/1 with valid data creates a domain" do
      assert {:ok, %Domain{} = domain} = Domains.create_domain(@valid_attrs)
      assert domain.content == "some content"
      assert domain.header == "some header"
      assert domain.length == 42
      assert domain.name == "some name"
      assert domain.state == "some state"
    end

    test "create_domain/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Domains.create_domain(@invalid_attrs)
    end

    test "update_domain/2 with valid data updates the domain" do
      domain = domain_fixture()
      assert {:ok, %Domain{} = domain} = Domains.update_domain(domain, @update_attrs)
      assert domain.content == "some updated content"
      assert domain.header == "some updated header"
      assert domain.length == 43
      assert domain.name == "some updated name"
      assert domain.state == "some updated state"
    end

    test "update_domain/2 with invalid data returns error changeset" do
      domain = domain_fixture()
      assert {:error, %Ecto.Changeset{}} = Domains.update_domain(domain, @invalid_attrs)
      assert domain == Domains.get_domain!(domain.id)
    end

    test "delete_domain/1 deletes the domain" do
      domain = domain_fixture()
      assert {:ok, %Domain{}} = Domains.delete_domain(domain)
      assert_raise Ecto.NoResultsError, fn -> Domains.get_domain!(domain.id) end
    end

    test "change_domain/1 returns a domain changeset" do
      domain = domain_fixture()
      assert %Ecto.Changeset{} = Domains.change_domain(domain)
    end
  end
end
