defmodule BarrelEx.Replication do
  @moduledoc """
  Manage database replication tasks
  """
  alias BarrelEx.Request

  @doc """
  Get all replication tasks.
  """
  @spec get() :: {atom(), map()}
  def get do
    with url <- make_url() do
      Request.get(url)
    end
  end

  @doc """
  Get all replication tasks. Raises an exception.
  """
  @spec get!() :: map()
  def get! do
    with url <- make_url() do
      Request.get!(url)
    end
  end

  @doc """
  Creates a replication task between two barrels: `source` and `target`.
  """
  @spec create(String.t(), String.t()) :: {atom(), map()}
  def create(source, target) do
    body = %{source: source, target: target}

    with url <- make_url() do
      Request.post(url, body)
    end
  end

  @doc """
  Creates a replication task between two barrels: `source` and `target`.
  Raises an exception.
  """
  @spec create!(String.t(), String.t()) :: map()
  def create!(source, target) do
    body = %{source: source, target: target}

    with url <- make_url() do
      Request.post!(url, body)
    end
  end

  @doc """
  Deletes a replication task between two barrels with the ID `rep_id`.
  """
  @spec delete(String.t()) :: {atom(), map()}
  def delete(rep_id) do
    with url <- make_url(rep_id) do
      Request.delete(url)
    end
  end

  @doc """
  Deletes a replication task between two barrels with the ID `rep_id`.
  Raises exception.
  """
  @spec delete!(String.t()) :: map()
  def delete!(rep_id) do
    with url <- make_url(rep_id) do
      Request.delete!(url)
    end
  end

  defp make_url do
    "replicate/"
  end

  defp make_url(rep_id) do
    make_url() <> rep_id
  end
end
