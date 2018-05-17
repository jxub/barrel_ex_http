defmodule DatabaseTest do
  use ExUnit.Case, async: true
  alias BarrelEx.Database

  setup do
    %{db: "ehlo", db2: "mongo"}
  end

  test "database list status" do
    {:ok, data} = Database.get()
  end

  test "list values correct" do
    data = Database.get!()
    assert data != nil
  end

  test "create and delete database status", %{db: db} do
    {:ok, data} = Database.create(db)
    {:ok, message} = Database.delete(db)
  end

  test "duplicated database deletion and creation", %{db2: db2} do
    {:ok, resp} = Database.delete(db2)
    assert true == resp.body["ok"]
    {:ok, data} = Database.create(db2)
    {:ok, data2} = Database.create(db2)
    assert "db exists" == data2.body["message"]
    assert 409 == data2.status_code
  end
end