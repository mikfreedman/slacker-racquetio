# SlackerRacquetio

An slacker bot that posts to <racquet.io>

## Execution

```bash
PORT=8080 SLACK_API_TOKEN='slack-api-token' RACQUET_CLUB_ID=666 mix run --no-halt
```

| Variable        | Description                                                 |
| ---             | ---                                                         |
| PORT            | Port that the web server should listen to                   |
| SLACK_API_TOKEN | Your bot's API token                                        |
| RACQUET_CLUB_ID | The numerical ID of your club on <http://racquet.io/clubs>* |

**Your Club ID can be found by running the following jQuery on your club's page `$('#match_club_id').val()`*

Then invite the bot to your channel and ask it for its commands like so `@botname help`

e.g.

```
@racquetbot: mik beat dylan
```

You may also direct message the bot, without a command prefix:

```
mik beat dylan
```
