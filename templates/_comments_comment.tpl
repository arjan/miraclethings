<li {% ifequal comment.user_id creator_id %}class="comment-author"{% endifequal %} {% if hidden %}style="display: none"{% endif %} id="comment-{{ comment.id }}">
	<p class="comment-body">{{ comment.message }}</p>
	<p class="comment-meta">{_ Posted by _} {{ comment.name|default:m.rsc[comment.user_id].title }}, {_ on _} {{ comment.created|date:"j F Y" }}.</p>
</li>
