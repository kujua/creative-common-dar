-module (darapi_helpers).

-compile(export_all).

new_uuid(Pid) ->
  {U,_} = uuid:get_v1(uuid:new(Pid)),
  uuid:uuid_to_string(U,standard).
