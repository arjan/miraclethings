%% @author Arjan Scherpenisse
%% @copyright 2011 Arjan Scherpenisse
%% Generated on 2011-06-18
%% @doc This site was based on the 'empty' skeleton.

%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%% 
%%     http://www.apache.org/licenses/LICENSE-2.0
%% 
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.

-module(newsite).
-author("Arjan Scherpenisse").

-mod_title("newsite zotonic site").
-mod_description("An empty Zotonic site, to base your site on.").
-mod_prio(10).

-include_lib("zotonic.hrl").


%%====================================================================
%% support functions go here
%%====================================================================

-export([
         datamodel/0,
         observe_media_viewer/2
        ]).


datamodel() ->
    #datamodel{
           categories=
           [
            {gallery,
             collection,
             [{title, <<"Gallery">>}]
            },
            {project,
             text,
             [{title, <<"Project">>}]
            },
            {institution,
             undefined,
             [{title, <<"Institution">>}]
            },
            {license,
             text,
             [{title, {trans, [{en, <<"License">>}, {nl, <<"Licentie">>}]}}]
            },
            {software,
             text,
             [{title, <<"Software">>}]
            }
           ],

           predicates=
           [
            {has_license,
             [{title, {trans, [{en, <<"Open source license">>}, {nl, <<"Opensource licentie">>}]}}],
             [{project, license},
              {software, license}]
            },
            {has_client,
             [{title, {trans, [{en, <<"Commisioned by">>}, {nl, <<"In opdracht van">>}]}}],
             [{project, institution}]
            },
            {has_link,
             [{title, {trans, [{en, <<"External links">>}, {nl, <<"Meer informatie">>}]}}],
             [{text, website}]
            }
           ],

           resources=
           [
            {page_home,
             text,
             [{title, <<"Home">>},
              {page_path, <<"/">>}
             ]
            },

            {page_about,
             text,
             [{short_title, <<"Who am I?">>},
              {title, <<"About me">>},
              {page_path, <<"/about">>}
             ]
            },

            {page_projects,
             text,
             [{title, <<"Projects">>},
              {page_path, <<"/projects">>}
             ]
            },

            {page_blog,
             text,
             [{title, <<"Stuff we write">>},
              {page_path, <<"/blog">>}
             ]
            },

            {page_favorites,
             collection,
             [{title, <<"Favorite technologies">>},
              {title, <<"Technologies">>},
              {page_path, <<"/tech">>}
             ]
            },

            {page_contact,
             text,
             [{title, <<"Contact me">>},
              {short_title, <<"Get in touch">>},
              {page_path, <<"/contact">>}
             ]
            },

            {main_menu,
             menu,
             [{title, <<"Main menu">>},
              {menu,
               [
                {page_projects, []},
                {page_blog, []},
                {page_favorites, []},
                {page_about, []},
                {page_contact, []}
               ]
              }]
            }
           ]
          }.


%% @doc Return the media viewer for the embedded video (that is, when it is an embedded media).
%% @spec media_viewer(Notification, Context) -> undefined | {ok, Html}
observe_media_viewer({media_viewer, Id, _Props, _Filename, Options}, Context) ->
    case m_rsc:is_a(Id, gallery, Context) of
        true ->
            % todo: handle possible extra js in the contexts
            Html = z_template:render("_gallery.tpl", [{id,Id}|Options], Context),
            {ok, Html};
        false ->
            undefined
    end.
