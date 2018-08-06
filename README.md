# BarrelEx HTTP
## Elixir bindings for the BarrelDB HTTP API

This package contains the Elixir bindings to the REST API.
Bindings directly to Erlang code can be found [here](https://gitlab.com/barrel-db/Clients/barrel_ex).

## Usage

To use the latest version, paste the following line in mix.exs deps:

```elixir
{:barrel_ex_http,  git: "https://gitlab.com/barrel-db/Clients/barrel_ex_http", branch: "develop"}
```

And use as you wish:

```elixir
defmodule Users do
  
  alias BarrelEx.{
    Database,
    Document
  }
  
  def create_user(name, surname) do
    with {:ok, db} = Database.get(db) do
      Map.new([id: "1234", name: name, surname: surname])
      |> Document.create!(db)
    end
  end
end
```

For more usage examples, have a look at the tests.

## Development

Get the code for barrel-platform first, compile it and run in
the background as follows:

```bash
$ git clone https://gitlab.com/barrel-db/barrel-platform
$ cd barrel-platform
$ make rel
$ ./_build/prod/rel/barrel/bin/barrel start
```

If barrel-platform fails to start, you might need to remove the BARREL_TS file, as it's
not erased automatically after each run.

```bash
$ rm _build/prod/rel/barrel/data/barrel@127.0.0.1/BARREL_TS
```

In case you'd like to see the list of all the supported operations,
visit the API documentation at http://localhost:7080/api-doc/index.html.

Then, get the code for BarrelEx:

```bash
$ git clone https://gitlab.com/barrel-db/Clients/barrel_ex_http
$ cd barrel_ex_http
```

Finally, test the application with:

```bash
$ mix test
```

You can also check the test coverage and run the quality check with credo:

```bash
$ mix coveralls
$ mix credo
```
