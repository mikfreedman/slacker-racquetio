defmodule SlackerRacquetio.Commands.Beat do
  use Slacker.Command

  @usage "<winner> beat <loser>"
  @short_description "responds with http status code"

  def handle_event({{:command, "beat", winner, loser}, meta}, state) do
    status_code = post_result(winner, loser)
    respond("#{winner} won! [#{status_code}]", meta)
    {:ok, state}
  end
  
  def post_result(winner, loser, club_id \\ Application.get_env(:slacker, :racquet_club_id), token \\ get_token) do
    data = """
      utf8=%E2%9C%93&authenticity_token=#{token}
      &commit=
      &match%5Bloser%5D=%40#{loser}
      &match%5Bwinner%5D=%40#{winner}
      &match%5Bclub_id%5D=#{club_id}
    """

    {:ok, %HTTPoison.Response{status_code: status_code, body: body}} = HTTPoison.post("http://racquet.io/matches", data, [{"Content-Type", "application/x-www-form-urlencoded"}])
    IO.inspect(body)
    inspect(status_code)
  end

  def get_token do
    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.get("http://racquet.io/pivotal-sydney")
    SlackerRacquetio.TokenParser.find_token_in_page(body)
  end
end

