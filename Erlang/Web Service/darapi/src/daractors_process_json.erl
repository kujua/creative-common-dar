-module daractors_process_json.

-export ([convert_to_json/1]).

convert_to_json(Conv) ->
    jsone:encode(Conv).
