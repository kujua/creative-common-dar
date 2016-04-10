#! /usr/local/bin/node
var shell = require("shelljs");

shell.echo('Running rebar3 for Erlang');
shell.exec('rebar3 version');
shell.cd('Erlang/Actor Server/daractors');
// shell.exec('ls');
shell.exec("rebar3 compile");
shell.cd('../../Web Service/darapi');
// shell.exec('ls');
shell.exec("rebar3 compile");
shell.echo('End running rebar3 for Erlang');
