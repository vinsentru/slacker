-module(slacker_request).

-export([send/2,parse/1]).

-define(API_URL, "https://slack.com/api/").


%% @doc Sends a request to Slack API
send(Endpoint, Params) ->
    URL = restc:construct_url(?API_URL, Endpoint, Params),
    restc:request(get, URL).

parse(Response) ->
	{ok,200,Headers,Body} = Response,
	Body.
