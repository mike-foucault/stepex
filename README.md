# Stepex

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `stepex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:stepex, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/stepex](https://hexdocs.pm/stepex).


## Dev Notes

docker run -it --rm \
  --mount "type=bind,src=$(pwd),dst=/opt/shared/stepex" \
  --workdir /opt/shared/stepex \
  elixir-dev:1.10.2 /bin/bash
