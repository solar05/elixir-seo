defmodule ElixirSeo.Domains.DomainFsm do
  alias ElixirSeo.Domains

  use Machinery,
    states: ["created", "pending", "complete", "canceled"],
    transitions: %{
      "created" => ["pending", "complete"],
      "pending" => "complete",
      "canceled" => "pending",
      "*" => "canceled"
    }

  def persist(struct, next_state) do
    {:ok, domain} = Domains.update_domain(struct, %{state: next_state})
  end
end
