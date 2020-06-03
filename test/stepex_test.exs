defmodule StepexTest do
  use ExUnit.Case
  doctest Stepex

  test "basic flow" do
    step1_fn = fn _data, context ->
      send(self(), :update_data)
      %{foo: context.foo_context}
    end

    {:ok, response} =
      Stepex.init()
      |> Stepex.put_context(%{foo_context: :bar_context})
      |> Stepex.put_callback(fn _data, _context -> send(self(), :hello_form_callback) end)
      |> Stepex.update_data(step1_fn)
      |> Stepex.run_callback()
      |> Stepex.format_response()

    assert response == %{foo: :bar_context}
    assert_received :update_data
    assert_received :hello_form_callback
  end
end
