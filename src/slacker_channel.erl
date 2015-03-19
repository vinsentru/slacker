-module(slacker_channel).

-include("spec.hrl").

-export([create/2, info/2, join/2, leave/2, history/2,history_ext/6,
         mark/3, invite/3, list/1, kick/3, rename/3,
         set_purpose/3, set_topic/3]).


%% @doc Creates a channel.
-spec create(Token :: string(), Name :: string()) -> http_response().
create(Token, Name) ->
    slacker_request:send("channels.create", [{"token", Token},{"name", Name}]).

%% @doc Returns information about a team channel.
-spec info(Token :: string(), Channel :: string()) -> http_response().
info(Token, Channel) ->
    slacker_request:send("channels.info", [{"token", Token},{"channel", Channel}]).

%% @doc Join a channel. If the channel does not exist, it is created.
-spec join(Token :: string(), Name :: string()) -> http_response().
join(Token, Name) ->
    slacker_request:send("channels.join", [{"token", Token},{"name", Name}]).

%% @doc Leave a channel.
-spec leave(Token :: string(), Channel :: string()) -> http_response().
leave(Token, Channel) ->
    slacker_request:send("channels.leave", [{"token", Token},{"channel", Channel}]).

%% @doc Fetch history of messages and events from a given channel.
-spec history(Token :: string(), Channel :: string()) -> http_response().
history(Token, Channel) ->
    slacker_request:send("channels.history", [{"token", Token},{"channel", Channel}]).

-spec history_ext(Token :: string(), Channel :: string(), Latest :: string(), Oldest :: string(), Inclusive :: string(), Count :: string() ) -> http_response().    
history_ext(Token, Channel, Latest, Oldest, Inclusive, Count) ->
    slacker_request:send("channels.history", [{"token", Token},{"channel", Channel},{"latest", Latest},{"oldest", Oldest},{"inclusive", Inclusive},{"count", Count}]).    

%% @doc Set read cursor in a channel.
-spec mark(Token :: string(), Channel :: string(), Timestamp :: string()) -> http_response().
mark(Token, Channel, Timestamp) ->
    slacker_request:send("channels.mark", [{"token", Token},{"channel", Channel},{"ts", Timestamp}]).

%% @doc Set read cursor in a channel.
-spec invite(Token :: string(), Channel :: string(), User :: string()) -> http_response().
invite(Token, Channel, User) ->
    slacker_request:send("channels.invite", [{"token", Token},{"channel", Channel},{"user", User}]).

%% @doc List of all channels in the team.
-spec list(Token :: string()) -> http_response().
list(Token) ->
    slacker_request:send("channels.list", [{"token", Token}]).

%% @doc Removes a user from a channel.
-spec kick(Token :: string(), Channel :: string(), User :: string()) -> http_response().
kick(Token, Channel, User) ->
    slacker_request:send("channels.kick", [{"token", Token},{"channel", Channel},{"user", User}]).

%% @doc Rename a channel.
-spec rename(Token :: string(), Channel :: string(), Name :: string()) -> http_response().
rename(Token, Channel, Name) ->
    slacker_request:send("channels.rename", [{"token", Token},{"channel", Channel},{"name", Name}]).

%% @doc Sets the purpose for a channel.
-spec set_purpose(Token :: string(), Channel :: string(), Purpose :: string()) -> http_response().
set_purpose(Token, Channel, Purpose) ->
    slacker_request:send("channels.setPurpose", [{"token", Token},{"channel", Channel},{"purpose", Purpose}]).

%% @doc Sets the topic for a channel.
-spec set_topic(Token :: string(), Channel :: string(), Topic :: string()) -> http_response().
set_topic(Token, Channel, Topic) ->
    slacker_request:send("channels.setTopic", [{"token", Token},{"channel", Channel},{"topic", Topic}]).
