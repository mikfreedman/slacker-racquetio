defmodule SlackerRacquetio.Commands.BeatTest do
  use ExUnit.Case
  import Mock

  test "it boopity doo" do
    with_mock HTTPoison, [post: fn(_url, _data, _headers) -> "{}" end] do
      {:ok, manager} = GenEvent.start_link
      GenEvent.add_handler(manager, Slacker.Commands.Beat, self)

      message = %{}
      GenEvent.notify(manager, {{:command, "beat", "winner", "loser"}, %{bot_pid: self, message: message}})
      assert called HTTPoison.post
      assert_receive {:reply, message, "pong"}
    end
  end
end
