%%%-------------------------------------------------------------------
%%% @author deng
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. 十一月 2019 10:54
%%%-------------------------------------------------------------------
-module(rebar3_elmorm_svn_compile).
-author("deng").

-export([init/1, do/1,format_error/1]).

-define(PROVIDER, svn_compile).
-define(DEPS, [{default, app_discovery}]).

%% ===================================================================
%% Public API
%% ===================================================================
%% ===================================================================
%% Public API
%% ===================================================================
-spec init(rebar_state:t()) -> {ok, rebar_state:t()}.
init(State) ->
  Provider = providers:create([
    {name, ?PROVIDER},            % The 'user friendly' name of the task
    {namespace,elmorm},
    {module, ?MODULE},            % The module implementation of the task
    {bare, true},                 % The task can be run by the user, always true
    {deps, ?DEPS},                % The list of dependencies
    {example, "rebar3 elmorm"}, % How to use the plugin
    {opts, []},                   % list of options understood by the plugin
    {short_desc, "A rebar plugin"},
    {desc, "A rebar plugin"}
  ]),
  {ok, rebar_state:add_provider(State, Provider)}.


-spec do(rebar_state:t()) -> {ok, rebar_state:t()} | {error, string()}.
do(State) ->
  _Apps = case rebar_state:current_app(State) of
           undefined ->
             rebar_state:project_apps(State);
           AppInfo ->
             [AppInfo]
         end,
  io:format("State=~p~n",[State]),
  {ok, State}.

-spec format_error(any()) ->  iolist().
format_error(Reason) ->
  io_lib:format("~p", [Reason]).
