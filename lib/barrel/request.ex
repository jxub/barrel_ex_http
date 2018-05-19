defmodule BarrelEx.Request do
  @moduledoc """
  Posion wrapper customization.
  """
  use HTTPoison.Base

  @endpoint Application.get_env(:barrel_ex, :database_url)

  def process_url(url) do
    @endpoint <> url
  end

  def process_request_body(body) do
    Poison.encode!(body)
  end

  def process_response_body(body) do
    body
    |> Poison.decode!()
    |> atomize!()
  end

  defp atomize!(body) when is_list(body) do
    body
  end

  defp atomize!(body) when is_map(body) do
    Morphix.atomorphiform!(body)
  end
end
