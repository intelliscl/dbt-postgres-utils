-- original credits to https://github.com/fishtown-analytics/postgres
{% macro uindex(this, column=[],idx_type="btree") %}

    {% set a_list = [] %}
    {% set a_list = a_list+column %}
    {% set csv_string = a_list|join(",") %}
    {% set text_string = a_list|join ("_")  %}

create unique index if not exists "{{ this.name }}__index_on_{{ text_string }}" on {{ this }} using {{idx_type}} ({{ csv_string }})

{% endmacro %}
