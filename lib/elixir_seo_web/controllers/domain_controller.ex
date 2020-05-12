defmodule ElixirSeoWeb.DomainController do
  use ElixirSeoWeb, :controller

  alias ElixirSeo.Domains
  alias ElixirSeo.Domains.Domain

  def index(conn, _params) do
    domains = Domains.list_domains()
    render(conn, "index.html", domains: domains)
  end

  def new(conn, _params) do
    changeset = Domains.change_domain(%Domain{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, params) do
    IO.inspect(params)
    #case Domains.create_domain(domain_params) do
    #  {:ok, domain} ->
    #    conn
    #    |> put_flash(:info, "Domain created successfully.")
    #    |> redirect(to: Routes.domain_path(conn, :show, domain))
    #
    #  {:error, %Ecto.Changeset{} = changeset} ->
    #    render(conn, "new.html", changeset: changeset)
    #end
    redirect(conn, to: Routes.page_path(conn, :index))
  end

  def show(conn, %{"id" => id}) do
    domain = Domains.get_domain!(id)
    render(conn, "show.html", domain: domain)
  end

  def edit(conn, %{"id" => id}) do
    domain = Domains.get_domain!(id)
    changeset = Domains.change_domain(domain)
    render(conn, "edit.html", domain: domain, changeset: changeset)
  end

  def update(conn, %{"id" => id, "domain" => domain_params}) do
    domain = Domains.get_domain!(id)

    case Domains.update_domain(domain, domain_params) do
      {:ok, domain} ->
        conn
        |> put_flash(:info, "Domain updated successfully.")
        |> redirect(to: Routes.domain_path(conn, :show, domain))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", domain: domain, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    domain = Domains.get_domain!(id)
    {:ok, _domain} = Domains.delete_domain(domain)

    conn
    |> put_flash(:info, "Domain deleted successfully.")
    |> redirect(to: Routes.domain_path(conn, :index))
  end
end
