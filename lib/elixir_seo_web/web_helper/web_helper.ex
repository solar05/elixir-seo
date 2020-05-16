defmodule ElixirSeoWeb.Helpers.WebHelper do
  def valid_url?(url) do
    uri = URI.parse(url)
    uri.scheme != nil && uri.host =~ "."
  end

  def prepare_url(url) do
    cond do
      String.starts_with?(url, "http://") ->
        url

      String.starts_with?(url, "https://") ->
        url

      true ->
        "https://" <> url
    end
  end

  def validate_url(params) do
    case params do
      %{"name" => url} ->
        if valid_url?(url) do
          {:ok, url}
        else
          {:ok, prepare_url(url)}
        end

      _ ->
        {:error, params}
    end
  end
end
