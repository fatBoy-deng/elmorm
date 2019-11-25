-module(rebar3_elmorm).

%% API exports
-export([init/1]).

%%====================================================================
%% API functions
%%====================================================================
-spec init(rebar_state:t()) -> {ok, rebar_state:t()}.
init(State0) ->
  {ok, State1} = rebar3_elmorm_compile:init(State0),
  {ok, State1}.

%%====================================================================
%% Internal functions
%%====================================================================
