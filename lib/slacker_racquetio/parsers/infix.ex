defmodule SlackerRacquetio.Parsers.Infix do
  # Handles messages like "@slacker dylan beat mik" to give back {:command, "beat", "dylan", "mik"}
  def try_parse(message) do
    match = Regex.named_captures(~r/(?<lhs>[\w]+)\s+(?<command>[\w-]+)\s+(?<rhs>[\w]+)/i, message)
    if match && match["command"] do
      {:command, match["command"], match["lhs"], match["rhs"]}
    else
      nil
    end
  end
end
