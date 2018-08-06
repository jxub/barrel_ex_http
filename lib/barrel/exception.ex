defmodule BarrelEx.Exception do
  @moduledoc """
  Represents a Barrel exception. Not currently used as we return the
  Erlang errors from Barrel app.
  """
  defexception message: "BarrelDB exception"
end
