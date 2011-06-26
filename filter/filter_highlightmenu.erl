%% @author Arjan Scherpenisse <arjan@scherpenisse.net>
%% @copyright 2011 Arjan Scherpenisse
%% @doc Return the menu item to highlight given the category of the current page.

-module(filter_highlightmenu).
-export([highlightmenu/2]).

-include("zotonic.hrl").

highlightmenu(undefined, _Context) ->
    undefined;
highlightmenu(Id, Context) ->
    case hd(lists:reverse(m_rsc:is_a(Id, Context))) of
        project ->
            m_rsc:p(page_projects, id, Context);
        article ->
            m_rsc:p(page_blog, id, Context);
        _ -> Id
    end.
     

